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
class DroomlaViewDefault extends JView {
	function display() {
       
	   
	   
	   
	  	
		
		//echo $j_editor[0]; die();
		//die();
		
		
		
		$query_string = $_SERVER['QUERY_STRING'];		
		if( !strstr( $query_string, 'dos_backend' ) ) $query_string = $query_string . '&dos_client=dos_backend'; 
		
		
		
		$output = Drupal::query( $query_string );
		
		
		
		//print_r($_POST);die();
		
		Drupal::load_querypath();
		/*$qp = qp(str_replace('&', '&amp;', $output));
		
		$qp->find('ul[class="menu"]:first')->find('li:first')->remove();
		$qp->top()->find('ul[class="menu"]:first')->find('li:last')->remove();
		
		$output = $qp->top()->xhtml();*/
		//form-textarea
		
		
		if(strstr($output, 'form-textarea')){
			$j_editor = file_get_contents( str_replace('administrator/', '', JURI::base()) . 'index.php?option=com_droomla&view=editor&tmpl=component');
			
			
			
			$j_editor = json_decode( $j_editor, true );
			//print_r($j_editor);die();
			if(is_array($j_editor) && !empty($j_editor)){
			$output = str_replace('</head>', $j_editor[0] . '</head>', $output);
			$output = str_replace('form-textarea','mceEditor form-textarea', $output);
			} else {
				
				$output = str_replace('for="edit-body">','for="edit-body">
				<a href="http://www.joomlacontenteditor.net/downloads/editor/category/editor-2" target="_blank">
				Install JCE Editor for WYSIWYG Support!</a> ', $output);//
			}
		}
		
		//echo $output;die();
		$base = str_replace('administrator/' , '', JURI::base());
		
		$output = str_replace('src="images/', 'src="'.$base.'images/',  $output);
		
		$output = str_replace('<li class="leaf first"><a href="/droomla/v3/administrator/?option=com_droomla&q=user/1">',
		'<li class="leaf first" style="display:none"><a href="/droomla/v3/administrator/?option=com_droomla&amp;q=user/1">',		
		$output);
		$output = str_replace('<li class="leaf last"><a href="/droomla/v3/administrator/?option=com_droomla&q=logout">',
		'<li class="leaf last" style="display:none"><a href="/droomla/v3/administrator/?option=com_droomla&amp;q=user/1">',		
		$output);
		
		$output = str_replace('name="','name="_dos_', $output);
		
		/*$output = str_replace('<a href="/droomla/v3/components/com_droomla/drupal/">Home</a>',
		'
			<a href="'. JURI::base().'">Joomla!</a> > 
			<a href="'. JURI::base().'?option=com_droomla&view=dashboard">Droomla Dashboard</a>
		', 		
		$output);*/
		
		if( strstr( $output, 'class="login first"' ) ){
			
			if( JRequest::getVar( 'autologin' ) ){
				echo JText::_( 'Droomla Autologin Failed' );
			}
			
			$jconfig = new JConfig;		
			$user_obj = JFactory::getUser( 'admin' );		
			$user = array(
				'status' => 1,
				'username' => $user_obj->username,
				'password' => $jconfig->secret,
				'email' => $user_obj->email,
				'fullname' => $user_obj->name
			);
			
			Drupal::login( $user, array(), $user_obj );
		
			header( 'Location: ' . JURI::base() . '?' . $_SERVER['QUERY_STRING'] . '&autologin=1' );
		}
		
		echo $output;
		
		//print_r($output);
    }
}