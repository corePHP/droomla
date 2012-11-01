<?php defined( '_JEXEC' ) or die( 'Restricted access' );
/**
 * @author Adam Stephen Docherty aka Lobos
 * @date 2010
 * @license GNU/GPL Version 3
 */
 
define( '_PATH', JPATH_SITE. '/components/com_droomla/' );
require_once( _PATH . 'helpers/installer.php' );
	
function com_uninstall(){
	Installer::modules_uninstall( _PATH . 'modules/' );
	Installer::plugins_uninstall( _PATH . 'plugins/', 'system' );
	Installer::drupal_uninstall();
}