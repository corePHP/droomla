<?php defined( '_JEXEC' ) or die( 'Restricted access' );

jimport( 'joomla.installer.installer' );
jimport( 'joomla.filesystem.file' );
jimport( 'joomla.filesystem.archive.zip' );

require_once ( JPATH_SITE . '/libraries/joomla/filesystem/file.php' );
require_once ( JPATH_SITE . '/libraries/joomla/filesystem/archive.php' );
require_once ( JPATH_SITE . '/libraries/joomla/filesystem/archive/zip.php' );

class Installer{
	
	static function modules_install( $dir ){
		
		$installer = JInstaller::getInstance();	
		$extns = scandir( $dir );
		
		if( is_array( $extns ) ) 
			foreach( $extns as $extn )			
				if( strstr( $extn, 'mod_' ) )
					if( !$installer->install( $dir . $extn ) ) 
						 JError::raiseWarning( '', JText::_( 'jg installation failed_' ) . $extn );		
	}
	
	static function plugins_install( $dir, $group ){
		
		$dir = $dir . $group . '/';
		
		$installer = JInstaller::getInstance();	
		$extns = scandir( $dir );
		
		if( !is_array( $extns ) ) return false;
		
		$db = JFactory::getDBO();
		
		foreach( $extns as $extn ){				
			if( strstr( $extn, '.xml' ) ){
				
				$name = str_replace( '.xml', '', $extn );				
				$dest = $dir . $name . '_install/';
				
				JFolder::copy( $dir . $name , $dest . $name , false, true );
				JFile::copy( $dir . $name . '.xml', $dest . $name . '.xml' );
				JFile::copy( $dir . $name . '.php', $dest . $name . '.php' );
							
				if( $installer->install( $dest ) ){
					$sql = "UPDATE #__plugins 
								SET published = 1
									WHERE element = '$name'";		
					
					$db->setQuery( $sql );	
					$db->query();
				}
			}				
		}
	}
	
	static function modules_uninstall( $dir ){
		
		$extns = scandir( $dir );
		
		if( !is_array( $extns ) ) return false;
		
		$installer = JInstaller::getInstance();
		$where = false;
		
		$db = JFactory::getDBO();
		
		foreach( $extns as $extn ){		
			if( strstr( $extn, 'mod_' ) ){
				$where .= ' module=' . $db->quote($extn) . ' OR';				
			}
		}
		
		if( !$where ) return false;
		
		$where = substr_replace($where ,'' ,-3);
		
		$db->setQuery("
			SELECT id FROM #__modules WHERE $where
		");
		
		$results = $db->loadObjectList();
		
		if( !$results ) return false;
			
		foreach( $results as $result ){
			$installer->uninstall( 'module', $result->id, false );
		}
		
		return true;
	}
	
	static function plugins_uninstall( $dir, $group ){
		$dir = $dir . $group . '/';
		
		$extns = scandir( $dir );
		
		if( !is_array( $extns ) ) return false;
		
		$installer = JInstaller::getInstance();
		$where = false;
		
		$db = JFactory::getDBO();
		
		foreach( $extns as $extn ){				
			if( strstr( $extn, '.xml' ) ){				
				$name = str_replace( '.xml', '', $extn );
				$where .= ' element=' . $db->quote($name) . ' OR';	
			}				
		}
		
		if( !$where ) return false;
		
		$where = substr_replace($where ,'' ,-3);
		
		$db->setQuery("
			SELECT id FROM #__plugins WHERE $where
		");
		
		$results = $db->loadObjectList();
		
		if( !$results ) return false;
			
		foreach( $results as $result ){
			$installer->uninstall( 'plugin', $result->id, false );
		}
		
		return true;
	}
	
	static function drupal_install( $dir ){
		
		$drupal_path = JPATH_SITE . 'components/com_droomla/drupal/';
		
		$cfg = new JConfig();
		
		$db  = JFactory::getDBO();
		$zip = new JArchiveZip();
		
		if(!$zip->extract( $dir . 'drupal.zip', $dir ) ) return false;		
		
		$zip->extract( $dir . '/themes/zen.zip', $dir . 'themes' );
		$zip->extract( $dir . '/themes/rubik.zip', $dir . 'themes' );
		$zip->extract( $dir . '/themes/tao.zip', $dir . 'themes' );
		$zip->extract( $dir . '/themes/engines.zip', $dir . 'themes' );
		
		$zip->extract( $dir . '/modules/admin.zip', $dir . 'modules' );
		$zip->extract( $dir . '/modules/adminrole.zip', $dir . 'modules' );
		$zip->extract( $dir . '/modules/pathauto.zip', $dir . 'modules' );
		$zip->extract( $dir . '/modules/token.zip', $dir . 'modules' );
		
		JFile::copy( $dir . 'files/index.php', $dir . 'index.php' );
		//sys_get_temp_dir()
		$settings =  JFile::read( $dir . 'settings.php' );	
		$settings = str_replace( 
			'mysqli://root:root@localhost/droomla_v1', 
			"{$cfg->dbtype}://{$cfg->user}:{$cfg->password}@{$cfg->host}/{$cfg->db}", 
		$settings);		
		$settings = str_replace( "db_prefix = 'dos_'", "db_prefix = '{$cfg->dbprefix}dos_'", $settings );
		
		chmod(JPATH_SITE . '/components/com_droomla/drupal/sites/default', 0777);
		JFile::write( $dir . 'sites/default/settings.php', $settings );
		JFolder::create( $dir . 'sites/default/files' );
		chmod($dir . 'sites/default/settings.php', 0744);
		chmod($dir . 'sites/default/files', 0777);
		
		//JFolder::copy( $dir . 'files' , $dir . 'sites/default/files' , false, true );
		
		$sql = JFile::read( $dir . 'drupal.sql' );
		
		$tmp_dir = sys_get_temp_dir();
		
		
		
		$sql = str_replace('s:26:"/Applications/MAMP/tmp/php";', 's:'.strlen($tmp_dir).':"'.$tmp_dir.'";', $sql);
		
		
		$db->setQuery( "SHOW TABLES LIKE '{$cfg->dbprefix}dos_%'" );	
		$tables = $db->loadAssocList();
		
		//if( !empty( $tables ) ){
			$db->setQuery( $sql );	
			$db->queryBatch();
		//}
		//sys_get_temp_dir()
		
		JFile::delete( $dir . 'drupal.zip' );
		JFile::delete( $dir . 'zen.zip' );
		JFile::delete( $dir . 'settings.php' );
		JFile::delete( $dir . 'drupal.sql' );
		JFolder::delete( $dir . 'files' );
		
		return true;
	}
	
	static function drupal_uninstall(){
		
		chmod(JPATH_SITE . '/components/com_droomla/drupal/sites/default', 0777);
		
		$db  = JFactory::getDBO();					
		$list = false;
		
		$cfg = new JConfig();
		
		$db->setQuery( "SHOW TABLES LIKE '{$cfg->dbprefix}dos_%'" );	
		$tables = $db->loadAssocList();
		
		foreach( $tables as $table ){				
			$list .= '`' . array_pop( $table ) . '`, ';							
		}
		
		$list = substr_replace( $list ,'' ,-2 );
		
		if( !$list ) return false;
		
		$db->setQuery( "DROP TABLE {$list};" );		
		$db->queryBatch();
		
		return true;
	}
}