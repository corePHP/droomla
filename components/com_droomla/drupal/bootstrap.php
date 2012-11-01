<?php

define( '_JEXEC', 1 );
define( 'JPATH_BASE', str_replace('components/com_droomla/drupal', '', dirname(__FILE__)) );
define( 'DS', DIRECTORY_SEPARATOR );

require_once ( JPATH_BASE . '/includes/defines.php' );
require_once ( JPATH_BASE . '/includes/framework.php' );

$mainframe =JFactory::getApplication( 'site' );
$mainframe->initialise();

$jconfig = new JConfig;

if( $jconfig->secret != JRequest::getVar( 'secret' ) ) exit( 'secret mismatch' );

JPluginHelper::importPlugin('system');
//$mainframe->triggerEvent('onAfterInitialise');
		
Drupal::initialise(array(
	'base' => str_replace ( 'administrator/', '', JURI::base() ),
	'drupal_uri' => '',
	'drupal_uri' => '',
	'bootstrap' => 'bootstrap.php?',
	'droomla_uri' => '?option=com_droomla',
	'querypath_file' => JPATH_SITE . '/components/com_droomla/helpers/QueryPath/QueryPath.php',
	'session' => JFactory::getSession()
));
		
$_cmd = 'cmd_' . JRequest::getVar( 'cmd' );

//unset( $_GET['secret'] );
//unset( $_GET['cmd'] );

exit( Drupal::$_cmd() ); 