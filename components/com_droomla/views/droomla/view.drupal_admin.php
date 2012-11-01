<?php defined('_JEXEC') or die('Restricted access'); 
/**
 * @package		jomCalendar
 * @author		Adam Stephen Docherty
 * @copyright	Copyright (C) 2009 'corePHP' / corephp.com. All rights reserved.
 * @license		GNU/GPL, see LICENSE.txt
 */

jimport( 'joomla.application.component.view');

/**
 * HTML View class for the JCalendar component
 */
class DroomlaViewDroomla extends JView {
	function display( $tpl = false ) {
        
		if(!$tpl) $tpl = 'drupal_admin';
		
		$output = json_decode( Drupal::query( $_SERVER['QUERY_STRING'] ), true );
		
		//print_r($output);
		
		$maincontent = $output['maincontent'];
		
		$maincontent = str_replace('%2Fuser%2Fuser%3Foption%3Dcom_droomla', '', $maincontent );
		$maincontent = str_replace('?option=com_droomla&option=com_droomla', '', $maincontent );
		
		$this->assign( 'query', Drupal::$_droomla_uri );
		$this->assign( 'path', JURI::base() . 'components/com_droomla/drupal/' );
		$this->assignRef( 'maincontent', $maincontent );   
		$this->assign( 'scripts', $output['scripts'] );          

        parent::display( $tpl );
    }
}