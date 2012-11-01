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
	function display() {
        
		$query_string = $_SERVER['QUERY_STRING'];		
		if( !strstr( $query_string, 'dos_frontend' ) ) $query_string = $query_string . '&dos_client=dos_frontend';
		
		echo Drupal::query( $query_string );
    }
}