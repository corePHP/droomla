<?php defined( '_JEXEC' ) or die( 'Restricted access' );
/**  
 * @package		Jent Plugin
 * @author		Adam Stephen Docherty
 * @copyright	Copyright (C) 2010 'corePHP' / corephp.com. All rights reserved.
 * @license		GNU/GPL, see LICENSE.txt
 */

class plgSystemDroomla extends JPlugin
{			
	public function onAfterInitialise( )
	{		
		$app =& JFactory::getApplication();
		
		$droomla_uri = 'index.php?option=com_droomla';
		
		/*if ($app->_name == 'administrator' ){
			$droomla_uri = $droomla_uri . '&amp;dos_client=dos_backend';
		}*/
		
		Drupal::initialise(array(
			'base' => str_replace ( 'administrator/', '', JURI::base() ),
			'drupal_uri' => 'components/com_droomla/drupal/',
			'droomla_uri' => $droomla_uri,
			'bootstrap' => 'bootstrap.php?',
			'querypath_file' => JPATH_SITE . '/components/com_droomla/helpers/QueryPath/QueryPath.php',
			'session' => JFactory::getSession()
		));
		
		
		//Drupal::load_blocks();
	}	
	
	public function onAfterRender(){
		
		
			
		if( isset( $_REQUEST['q'] ) && strstr( $_REQUEST['q'], 'user.register' ) ){
			global $Itemid; 
		$destination = str_replace('/', '.', JRequest::getVar('destination'));
			//JRequest::setVar( 'view', 'register' );
			//JRequest::setVar( 'option', 'com_user' );
			
			header( 'Location: ' . JURI::base() . 'index.php?option=com_user&view=register&return=' . base64_encode( urldecode( 'index.php?option=com_droomla&view=droomla&Itemid='.$Itemid.'&q=' . $destination) ) );
		}
		
		if( isset( $_REQUEST['q'] ) && strstr( $_REQUEST['q'], 'user.login' ) ){
			global $Itemid; 
		$destination = str_replace('/', '.', JRequest::getVar('destination'));
			//JRequest::setVar( 'view', 'login' );
			//JRequest::setVar( 'option', 'com_user' );
			//?option=com_droomla&q=user/login&destination=comment/reply/2#comment-form
			//JRequest::setVar( 'return', base64_encode( urldecode( 'index.php?option=com_droomla&q=' . $destination) ) );
		
			header( 'Location: ' . JURI::base() . 'index.php?option=com_user&view=login&return=' . base64_encode( urldecode( 'index.php?option=com_droomla&view=droomla&Itemid='.$Itemid.'&q=' . $destination) ) );
		}
		
	}
	
	public function onAfterDispatch( )
	{
		
		
		
		if( Drupal::$_blocks_disabled ) return;
		
		jimport( 'joomla.application.module.helper' );

		$modules_loaded	= JModuleHelper::_load();
		
		$cache_define = array();
		
		foreach( $modules_loaded as $module ){
			if( $module->module == 'mod_drupalblock' ){			
				$params = parse_ini_string( $module->params );				
				Drupal::block_add( $params['block'] );
				$cache_define[ $params['block'] ] = true;
			}
		}
		 
		Drupal::blocks_get();
		return;
	}
	
	function _get_blocks(){
		Drupal::blocks_get();
	}
	
	function onLoginUser( $user, $options ){
	
		$user_obj = JFactory::getUser( $user['username'] );		
		
		Drupal::login( $user, $options, $user_obj );
	}
	
	function onLogoutUser(){
		
		Drupal::logout();
	}
	
	function onAfterStoreUser( $user, $isnew, $success, $msg ){
	
		$user_obj =& JFactory::getUser( $user['username'] );
		
		$user['password'] = false;
		$user_obj->password = false;
		
		$user['status'] = true;
		
		if( $user['block'] ) $user['status'] = false;
		
		Drupal::user_update( $user, array(), $user_obj );
	}
	
	function onAfterDeleteUser( $user, $success, $msg ){
		
		$user_obj =& JFactory::getUser( $user['username'] );
		
		$user['password'] = false;
		$user['status'] = false;
		
		Drupal::user_update( $user, array(), $user_obj );
	}
}

class Drupal
{
	static 
	$_cookiefile,
	$_base,
	$_droomla_uri,
	$_drupal_uri,
	$_querypath_file,
	$_bootstrap,
	$_session,
	$_blocks,
	$_blocks_disabled;
	
	function initialise( $params ){
		
		$app = JFactory::getApplication();
		
		self::$_base = $params['base'];
		self::$_drupal_uri = $params['drupal_uri'];
		
		if ($app->_name == 'administrator' ){
			self::$_droomla_uri = 'administrator/' . $params['droomla_uri'];
			if( $_SERVER['QUERY_STRING'] == 'option=com_droomla'){
				$_SERVER['QUERY_STRING'] = $_SERVER['QUERY_STRING'] . '&q=admin';
				JRequest::setVar( 'q', 'admin' );
			}
			
			$user =& JFactory::getUser();

			if($user->usertype == "Super Administrator" || $user->usertype == "Administrator"){

				if( JRequest::getVar( 'option' ) == 'com_droomla' && JRequest::getVar( 'view' ) == '' ) JRequest::setVar( 'format', 'raw' );
			
			}
			
		} else {
			self::$_droomla_uri = $params['droomla_uri'];
			//JRequest::setVar( 'format', 'raw' );
		}
		
		$destination = str_replace('/', '.', JRequest::getVar('destination'));
		
		
		
		
		self::$_bootstrap = $params['bootstrap'];
		self::$_querypath_file = $params['querypath_file'];
		self::$_session = $params['session'];
		
		self::$_cookiefile = self::$_session->get('cookiefile', false, 'droomla');
		
		if( !self::$_cookiefile ){
			self::$_cookiefile = tempnam( JPATH_SITE . "/tmp", uniqid() );
			self::$_session->set('cookiefile', self::$_cookiefile, 'droomla');
		} 
		
		return; 
	}
	
	function load_querypath(){
		
		if( !function_exists( 'qp' ) ){
			require_once( self::$_querypath_file );
		}
		
		QueryPathOptions::merge(array('ignore_parser_warnings' => true, 'replace_entities', true));
	}
	
	function block_add( $block=false ){		
		if(	$block	){
			self::$_blocks[ $block ] = true;
		}
	}
	
	function blocks_get(){
		
		jimport('joomla.cache.cache');
		jimport('joomla.cache.callback');
		
		$cache = JCache::getInstance( 'callback', array(
			//this will be the folder name of your cache
			//inside the "cachebase" folder
			'defaultgroup' => 'drupal_blocks', ///
			'cachebase' => JPATH_BASE . '/cache/',
			//how long to store the data in cache (seconds
			'lifetime' => ( 3 ), 
			//'lifetime' => ( 5*60*60 ),
			'language' => 'en-GB',
			'storage' => 'file'
		));
		
		$cache_id = md5( self::$_cookiefile );		
		
		$app =& JFactory::getApplication();
		
		$cache->setCaching( true );
		
		if ($app->_name == 'administrator' ) $cache->setCaching( false );
		
		$blocks = json_decode( $cache->get( array( 'Drupal', 'blocks_get_remote' ), array(), $cache_id ), true);
		
		if(is_array($blocks))
		foreach( $blocks as $k=>$block){
			
			$content = $block['content'];
			
			$content = str_replace( self::$_drupal_uri .'?', self::$_droomla_uri .'&', $content );
			$content = str_replace( 'action="/"', 'action="' . self::$_droomla_uri . '"', $content );
			$content = str_replace( 'name="format"', 'name="dformat"' . self::$_droomla_uri . '"', $content );
			
			$blocks[$k]['content'] = $content;
			
			self::$_blocks[ $block['bid'] ] = $blocks[$k];
		}
		
		return json_encode($blocks);
	}
	
	function blocks_get_remote(){
		$jconfig = new JConfig;
		
		//$postvars = http_build_query( self::$_blocks, 'flags_' );
		$postvars = false;
		
		$cmd = array(
			'secret' => $jconfig->secret,
			'cmd' => 'blocks_render'
		);
				
		$query = JURI::getInstance()->buildQuery( $cmd );

		$url = self::$_base . self::$_drupal_uri . self::$_bootstrap . $query;
		
		
		$crl = curl_init();
		curl_setopt($crl, CURLOPT_URL, $url );
		curl_setopt($crl, CURLOPT_COOKIEFILE, self::$_cookiefile );
		curl_setopt($crl, CURLOPT_COOKIEJAR, self::$_cookiefile );
		curl_setopt($crl, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($crl, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($crl, CURLOPT_POSTFIELDS, $postvars);
		
		
		$response = curl_exec($crl);
	//echo $response;
		return $response;
	}
	
	function cmd_blocks_render(){
		
		/*global $custom_theme;	
		$custom_theme = 'zen';*/
		
		self::initialise_drupal();
		
		menu_execute_active_handler();
		//echo theme('links',menu_navigation_links('navigation'));
		//echo theme_menu_tree(menu_navigation_links('navigation'));
		//print_r( block_list('droomla'));
		return json_encode( block_list('droomla') );
	}
	
	function convert_link( $link, $itemid=false ){
		
		if(!strstr($link, 'Itemid') && !strstr($link, '#')){
			 $link = $link . '&Itemid=' . $itemid;
		} else if(!strstr($new, 'Itemid') && strstr($link, '#')){ 
			$link = str_replace( '#', '&Itemid=' . $itemid .'#', $link );
		}
		
		$base_path = JURI::base( true ) .'/';
		$link = str_replace( self::$_drupal_uri .'?', self::$_droomla_uri .'&', $link );
		return JRoute::_( str_replace( $base_path, '', $link ) );
	}
	
	function convert_links( $response, $view=false, $itemid ){
		
		

		$response = str_replace( self::$_drupal_uri .'?', self::$_droomla_uri .'&', $response );
		//echo $response;die();
		$response = str_replace( 'action="/"', 'action="' . self::$_droomla_uri . '"', $response );
		$response= str_replace( 'name="format"', 'name="dformat"' . self::$_droomla_uri . '"', $response );
		
		
		$response = @qp( '<html><body>' . $response . '</body></html>' );
		
		$base_path = JURI::base( true ) .'/';
		
		foreach( $response->find('a') as $link ){			
		
			$new_link = $link->attr('href');
			
			if($view){
				$new_link = str_replace( 'view='.$view, '', $new_link);		
				$new_link = str_replace( '?', '?view='.$view.'&', $new_link);
			}
			
			if(!strstr($new_link, 'Itemid') && !strstr($new_link, '#')){ 
				$new_link = $new_link . '&Itemid=' . $itemid; 
			} else if(!strstr($new_link, 'Itemid') && strstr($new_link, '#')){  
				$new_link = str_replace( '#', '&Itemid=' . $itemid .'#', $new_link );
			}
			//$new_link = $new_link . '&Itemid=1';
			$new_link = JRoute::_( str_replace( $base_path, '', $new_link ) );
			
			$new_link = str_replace( '&amp;', '&', $new_link);
			
			$link->attr('href', $new_link );
			
		}		
		
		$response->top()->find('li.node_read_more')->remove();
		
		return $response->top()->find('body')->innerHtml();
	}
	
	function query( $query ){
		
		
		
		$jconfig = new JConfig;
		$app = JFactory::getApplication( 'site' );

		$admin_dir = false;
		
		if(!isset($app->setTemplate)){
			$app->setTemplate = false;
			$admin_dir = 'administrator/';
		}
		
		parse_str( $query, $query );
		
		//mime_content_type($filename)
		//$extn = array_pop( explode( '_', $query['q']) );
		//$mime_type = mime_content_type($extn);
		
		unset($query['cmd']);
		unset($query['j_template']);
		unset($query['secret']);
		
		if(!isset($query['Itemid'])) $query['Itemid'] = 1;
		
		$query_append = array(
			//'secret'=>$jconfig->secret,
			'cmd'=>'query',
			'j_template'=>$app->setTemplate,
		);
		
		$query = JURI::getInstance()->buildQuery( array_merge( $query, $query_append ) );
		
		$query = str_replace(':', '-', urldecode($query));
	
		//$url = self::$_base . self::$_drupal_uri . '?' . $query . '&secret=' . $jconfig->secret . '&cmd=query&j_template=' . $app->setTemplate;
		$url = self::$_base . self::$_drupal_uri . '?' . $query;
		//print_r($_POST);die();
		foreach($_POST as $k=>$value){			
			unset($_POST[$k]);
			
			$key = str_replace( '_dos_','', $k );
			
			if (get_magic_quotes_gpc()) {
				
				if(is_array($value)){
					$value = dos_stripslashes_deep($value);
				} else {
			   		$value = stripslashes($value);  
				}
			}
			
			if(isset($_POST[$key])){
				$_POST[$key][] = $value;
			} else {
				$_POST[$key] = $value;
			}
		}
		
		if(isset($_POST['dformat'])){
			$_POST['format'] = $_POST['dformat'];
		}
		
		
		
		$postvars = false;
		
		if(isset($_FILES['_dos_files'])) $_FILES['files'] = $_FILES['_dos_files'];
		
		if(isset($_FILES['files']['tmp_name']) && !empty( $_FILES['files']['tmp_name'] ) ){
			
			$multipart = false;
			
			foreach( $_FILES['files']['tmp_name'] as $k=>$value ){
				
				if($_FILES['files']['tmp_name'][$k]){
					$tmp_name = $_FILES['files']['tmp_name'][$k];
					$name = $_FILES['files']["name"][$k];
					move_uploaded_file($tmp_name, JPATH_SITE . '/tmp/' .  $name );
					
					$_POST["files[{$k}]"] = '@'.JPATH_SITE . '/tmp/' .  $name;
					//$_POST['files'] = $_FILES;
					
					foreach($_POST as $k1=>$value1){			
						if(is_array($value1)){
							$_POST[$k1] = json_encode($value1);
							$multipart = true;
						}
					}
				}
			}
			
			if( $multipart ){
				$postvars = $_POST;
			}
		} 
		
		if( !$postvars && !empty($_POST) ){
			$postvars = http_build_query($_POST, '');
		}
		
		
		
		
		//$postvars = http_build_query($_POST, '');
	
		
		if(isset($_POST['dformat'])) unset($_POST['format']);
		
		$crl = curl_init();
		curl_setopt($crl, CURLOPT_URL, $url );
		//curl_setopt($crl,CURLOPT_HEADER,0);
		curl_setopt($crl, CURLOPT_COOKIEFILE, self::$_cookiefile );
		curl_setopt($crl, CURLOPT_COOKIEJAR, self::$_cookiefile );
		curl_setopt($crl, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($crl, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($crl, CURLOPT_POST, 1);
		@curl_setopt($crl, CURLOPT_POSTFIELDS, $postvars);
		
		
		
		$response = curl_exec($crl);
		
		$info = curl_getinfo($crl);
		
		if( !strstr($info['url'], '/drupal/') ){
			header( 'Location: '. $info['url'], TRUE, $info['http_code'] );
			exit;
		}
		//echo $mime_type;
		
		/*if( $mime_type ){
			header("Content-type: {$mime_type}");
			//header("Cache-Control: max-age={$offset}, must-revalidate");
			//header('Expires: '.gmdate( 'D, d M Y H:i:s', time() + 10 ) . ' GMT');
			echo $response;die();
		}*/

	//	echo $response;die();
		if( $response == '[  ]' ) exit('{}');		
		if( is_object( json_decode( $response ) ) ) self::process_json( $response );
		
		if(!strstr( $response, 'droomla_zen') && !strstr( $response, '</body>') ) exit( str_replace( self::$_drupal_uri .'?', self::$_droomla_uri .'&', $response ) );	
		
		$response = str_replace( self::$_drupal_uri .'?', self::$_droomla_uri .'&', $response );
		$response = str_replace( 'action="/"', 'action="' . self::$_droomla_uri . '"', $response );
		$response= str_replace( 'name="format"', 'name="dformat"', $response );
		
		$response= str_replace( 'index.php?q=sites/default/files/imagecache/product_full/', 
								'sites/default/files/', $response );
		$response= str_replace( 'index.php?q=sites/default/files/imagecache/product/', 
								'sites/default/files/imagefield_thumbs/', $response );
		$response= str_replace( 'index.php?q=sites/default/files/imagecache/uc_thumbnail/', 
								'sites/default/files/imagefield_thumbs/', $response );
		$response= str_replace( 'index.php?q=sites/default/files/imagecache/product_list/', 
								'sites/default/files/imagefield_thumbs/', $response );
		
		
		$response= str_replace( 'id="edit-site-name"', 
								'id="edit-site-name" style="display:none" ', $response );
		//id="edit-site-name"
		
		
		//http://localhost:8888/droomla/v9/components/com_droomla/drupal/index.php?q=sites/default/files/imagecache/product_list/droomla_menu_0.png
		//http://localhost:8888/droomla/v9/components/com_droomla/drupal/index.php?q=sites/default/files/imagecache/uc_thumbnail/droomla_9.png
		//http://localhost:8888/droomla/v9/components/com_droomla/drupal/index.php?q=sites/default/files/imagecache/product/droomla_menu_0.png
		//http://localhost:8888/droomla/v9/components/com_droomla/drupal/index.php?q=sites/default/files/imagecache/product_full/droomla_menu_0.png	
		//http://localhost:8888/droomla/v9/components/com_droomla/drupal/index.php?q=sites/default/files/imagecache/uc_thumbnail/droomla_9.png
		
		$base_path = str_replace('administrator', '',  JURI::base(true));
		
		//echo  '<a href="'.$base_path.'administrator/?option=com_droomla&amp;q=logout">Logout';
			//<a href="/droomla/v6/administrator/index.php?option=com_droomla&amp;q=logout">Logout</a>
		$response = str_replace( '<a href="'.$base_path.'administrator/index.php?option=com_droomla&q=logout">Logout', 
		'<a href="?option=com_droomla&view=dashboard">Back to Joomla!', $response );
	
		$response = str_replace( '<a href="'.$base_path.'components/com_droomla/drupal/">Droomla', 
		'<a href="index.php?option=com_droomla&q=">Droomla', $response );
				
		return $response;		
	}
	
	function process_json( $response ){
		//echo self::$_drupal_uri .'?';
		$response = str_replace( self::$_drupal_uri .'?', self::$_droomla_uri .'&', $response );
		
		exit( $response );
	}
	
	function logout(){
		
		self::$_cookiefile = false;
		self::$_session->set('cookiefile', false, 'droomla');
	}
	
	function login( $user, $options, $user_obj ){
		
		$app =& JFactory::getApplication();
		
		if( $user['type'] == "Super Administrator" || $user['type'] == "Administrator"){
			$jconfig = new JConfig;
			$user['password'] = $jconfig->secret;
		}
		
		$user['password'] = uniqid();
		
		self::user_update( $user, $options, $user_obj );
		
		self::load_querypath();
		
		$login_uri = self::$_base . self::$_drupal_uri . "?q=/user/login";
		$agent="Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)";
		 
		$ch = curl_init(); 
		curl_setopt($ch, CURLOPT_URL, $login_uri ); 
		curl_setopt($ch, CURLOPT_USERAGENT, $agent);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_COOKIEFILE, self::$_cookiefile );
		curl_setopt($ch, CURLOPT_COOKIEJAR, self::$_cookiefile );
		$result = curl_exec ($ch);
		curl_close ($ch);
		
		if( !strstr($result, 'user-login') ) return;
		
		$result = self::extract_tag( 'page_content', $result );
		
		$form_build_id = qp( $result )->find('input[name="form_build_id"]')->attr('value');
		
		$postfields=array(
		  "name" => $user['username'],
		  "pass" => $user['password'],
		  "form_id" => 'user_login',
		  "op" => 'Log in',
		  "form_build_id" => $form_build_id
		);
		
		$reffer = $login_uri;
		 
		$ch = curl_init(); 
		 
		curl_setopt($ch, CURLOPT_URL,$login_uri);
		curl_setopt($ch, CURLOPT_USERAGENT, $agent);
		curl_setopt($ch, CURLOPT_POST, 1); 
		curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($postfields) );  
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); 
		curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($ch, CURLOPT_REFERER, $reffer);
		curl_setopt($ch, CURLOPT_COOKIEFILE, self::$_cookiefile);
		curl_setopt($ch, CURLOPT_COOKIEJAR, self::$_cookiefile);

		$response = curl_exec ($ch);		
		curl_close ($ch); 	

		return;
	}
	
	function user_update( $user, $options, $user_obj ){
		
		$jconfig = new JConfig;
		
		$cmd = array(
			'secret' => $jconfig->secret,
			'cmd' => 'user_update'
		);
		
		$user['usertype'] = $user_obj->usertype;
		$user['gid'] = $user_obj->gid;
		
		$query = JURI::getInstance()->buildQuery( array_merge( $user, $options, $cmd ) );

		$url = self::$_base . self::$_drupal_uri . self::$_bootstrap . $query;
		
		$crl = curl_init();
		curl_setopt($crl, CURLOPT_URL, $url );
		curl_setopt($crl, CURLOPT_COOKIEFILE, self::$_cookiefile );
		curl_setopt($crl, CURLOPT_COOKIEJAR, self::$_cookiefile );
		curl_setopt($crl, CURLOPT_FOLLOWLOCATION, 1);
		curl_setopt($crl, CURLOPT_RETURNTRANSFER, 1);
		
		$response = curl_exec($crl);
		
		return $response;
	}
	
	function initialise_drupal(){
		
		chdir( JPATH_SITE . '/components/com_droomla/drupal' );
		
		define( 'DRUPAL_ROOT', JPATH_SITE . '/components/com_droomla/drupal' );
		
		require_once 'includes/bootstrap.inc';
		
		session_destroy();
		$_SERVER['REQUEST_URI'] = false;
		
		drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);
	}
	
	function cmd_query(){
		
		self::initialise_drupal();
		
		menu_execute_active_handler();
		
		return;
	}
	
	
	
	function cmd_user_update(){
		
		self::initialise_drupal();
		
		$user = JURI::getInstance()->getQuery( true );
		
		if( function_exists( 'user_load_by_name' ) ){
			$user_obj = user_load_by_name( $user['username'] );
		} else {
			$user_obj = user_load( array('name' => $user['username']) );
		}
       	
		if( $user['gid'] >= 23 ){
			//$user['username'] = 'admin';
			//$user['password'] = $_REQUEST['secret'];
		} 
		
        $array = array();
        $array["name"] = $user['username'];
		
		if($user['password']){
        	$array["pass"] = $user['password'];
		}
		
        $array["mail"] = $user['email'];
        $array["status"] = $user['status'];
       	
		if( $user['usertype'] == "Super Administrator" || $user['usertype'] == "Administrator"){
			if( $user_obj ){
				$roles = $user_obj->roles;			
				$roles[3] = 'administrator';			
				$user_obj->roles = $roles;
				$array['roles'] = $roles;
			} else {
				$array['roles']= array(
					3 => 'administrator',
				);
			}
		} else {
			if( !$user_obj ){		
				$array['roles']= array(
					2 => 'authenticated user',
				);
			}
		}
		
        
		$d_user = user_save($user_obj, $array);
		
		if( !$d_user ) return false;
		
		return json_encode( $d_user );
	}
	
	function extract_tag( $tag, $content, $all=false ){
		
		preg_match('%{'.$tag.'}(.*){\/'.$tag.'}%is', $content, $data);
		
		if($all) return $data;
		
		return $data[1];
	}
}

# Define parse_ini_string if it doesn't exist.
# Does accept lines starting with ; as comments
# Does not accept comments after values
if( !function_exists('parse_ini_string') ){
   
    function parse_ini_string( $string ) {
        $array = Array();

        $lines = explode("\n", $string );
       
        foreach( $lines as $line ) {
            $statement = preg_match(
"/^(?!;)(?P<key>[\w+\.\-]+?)\s*=\s*(?P<value>.+?)\s*$/", $line, $match );

            if( $statement ) {
                $key    = $match[ 'key' ];
                $value    = $match[ 'value' ];
               
                # Remove quote
                if( preg_match( "/^\".*\"$/", $value ) || preg_match( "/^'.*'$/", $value ) ) {
                    $value = mb_substr( $value, 1, mb_strlen( $value ) - 2 );
                }
               
                $array[ $key ] = $value;
            }
        }
        return $array;
    }
}

if(!function_exists('dos_stripslashes_deep')){
	function dos_stripslashes_deep($value)
	{
		$value = is_array($value) ?
					array_map('dos_stripslashes_deep', $value) :
					stripslashes($value);
	
		return $value;
	}
}

if(!function_exists('mime_content_type')) {

    function mime_content_type($filename) {

        $mime_types = array(

            'txt' => 'text/plain',
            'htm' => 'text/html',
            'html' => 'text/html',
            'php' => 'text/html',
            'css' => 'text/css',
            'js' => 'application/javascript',
            'json' => 'application/json',
            'xml' => 'application/xml',
            'swf' => 'application/x-shockwave-flash',
            'flv' => 'video/x-flv',

            // images
            'png' => 'image/png',
            'jpe' => 'image/jpeg',
            'jpeg' => 'image/jpeg',
            'jpg' => 'image/jpeg',
            'gif' => 'image/gif',
            'bmp' => 'image/bmp',
            'ico' => 'image/vnd.microsoft.icon',
            'tiff' => 'image/tiff',
            'tif' => 'image/tiff',
            'svg' => 'image/svg+xml',
            'svgz' => 'image/svg+xml',

            // archives
            'zip' => 'application/zip',
            'rar' => 'application/x-rar-compressed',
            'exe' => 'application/x-msdownload',
            'msi' => 'application/x-msdownload',
            'cab' => 'application/vnd.ms-cab-compressed',

            // audio/video
            'mp3' => 'audio/mpeg',
            'qt' => 'video/quicktime',
            'mov' => 'video/quicktime',

            // adobe
            'pdf' => 'application/pdf',
            'psd' => 'image/vnd.adobe.photoshop',
            'ai' => 'application/postscript',
            'eps' => 'application/postscript',
            'ps' => 'application/postscript',

            // ms office
            'doc' => 'application/msword',
            'rtf' => 'application/rtf',
            'xls' => 'application/vnd.ms-excel',
            'ppt' => 'application/vnd.ms-powerpoint',

            // open office
            'odt' => 'application/vnd.oasis.opendocument.text',
            'ods' => 'application/vnd.oasis.opendocument.spreadsheet',
        );

        $ext = strtolower(array_pop(explode('.',$filename)));
        if (array_key_exists($ext, $mime_types)) {
            return $mime_types[$ext];
        }
        elseif (function_exists('finfo_open')) {
            $finfo = finfo_open(FILEINFO_MIME);
            $mimetype = finfo_file($finfo, $filename);
            finfo_close($finfo);
            return $mimetype;
        }
        else {
            return false;
        }
    }
}