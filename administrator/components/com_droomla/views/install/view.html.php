<?php
/**
 * Joomla! 1.5 component jgallery
 *
 * @version $Id: view.html.php 2010-10-20 20:20:10 svn $
 * @author Adam Stephen Docherty aka Lobos
 * @package Joomla
 * @subpackage jgallery
 * @license GNU/GPL
 *
 * Gallery for Joomla
 *
 * This component file was created using the Joomla Component Creator by Not Web Design
 * http://www.notwebdesign.com/joomla_component_creator/
 *
 */

// no direct access
defined('_JEXEC') or die('Restricted access');

jimport( 'joomla.application.component.view');

/**
 * HTML View class for the jgallery component
 */
class DroomlaViewInstall extends JView {
	
	function display() {
        
		define( '_PATH', JPATH_SITE. '/components/com_droomla/' );
	
		require_once( _PATH . 'helpers/installer.php' );
		
		Installer::modules_install( _PATH . 'modules/' );
		Installer::plugins_install( _PATH . 'plugins/', 'system' );
		
		Installer::drupal_install( _PATH . 'drupal/' );
		
		JError::raiseNotice( '', JText::_( 'Successfully Installed Base Extensions' ) );
		
		Installer::modules_install( _PATH . 'modules/' );
		Installer::plugins_install( _PATH . 'plugins/', 'system' );		
		Installer::drupal_install( _PATH . 'drupal/' );
		
		$jconfig = new JConfig;		
		$user_obj = JFactory::getUser( 'admin' );		
		$user = array(
			'status' => 1,
			'username' => $user_obj->username,
			'password' => $jconfig->secret,
			'email' => $user_obj->email,
			'fullname' => $user_obj->name
		);
		
		/*JPluginHelper::importPlugin( 'user' );
		$dispatcher = JDispatcher::getInstance();
		$dispatcher->trigger( 'onLoginUser', array( $user, array() ) );
		
		$user_obj =& JFactory::getUser( $user['username'] );*/
		
		require_once( JPATH_PLUGINS . '/system/droomla.php' );
		
		plgSystemDroomla::onAfterInitialise();
		
		Drupal::login( $user, array(), $user_obj );
		
		header( 'Location: ' . JURI::base() . 'index.php?option=com_droomla&view=dashboard' );
    }
}