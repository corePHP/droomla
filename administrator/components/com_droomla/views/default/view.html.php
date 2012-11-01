<?php
/**
 * Joomla! 1.5 component droomla
 *
 * @version $Id: view.html.php 2010-10-01 02:59:09 svn $
 * @author Adam Stephen Docherty aka Lobos
 * @package Joomla
 * @subpackage droomla
 * @license GNU/GPL
 *
 * Joomla Drupal Bridge
 *
 * This component file was created using the Joomla Component Creator by Not Web Design
 * http://www.notwebdesign.com/joomla_component_creator/
 *
 */

// no direct access
defined('_JEXEC') or die('Restricted access');
error_reporting(E_ALL ^ E_NOTICE);
jimport( 'joomla.application.component.view');
//require_once( JPATH_COMPONENT . '/helpers/QueryPath/QueryPath.php' );
/**
 * HTML View class for the droomla component
 */
class DroomlaViewDefault extends JView {
	
	function display() {
		
		$query_string = $_SERVER['QUERY_STRING'];		
		
		if( !strstr( $query_string, 'dos_backend' ) ) $query_string = $query_string . '&dos_client=dos_backend'; 
		
		$output = Drupal::query( $query_string );
		
		Drupal::load_querypath();
		
		if(strstr($output, 'form-textarea')){
			$j_editor = file_get_contents( str_replace('administrator/', '', JURI::base()) . 'index.php?option=com_droomla&view=editor&tmpl=component');
			
			$j_editor = json_decode( $j_editor, true );
			if(is_array($j_editor) && !empty($j_editor)){
			$output = str_replace('</head>', $j_editor[0] . '</head>', $output);
			$output = str_replace('form-textarea','mceEditor form-textarea', $output);
			} else {
				
				$output = str_replace('for="edit-body">','for="edit-body">
				<a href="http://www.joomlacontenteditor.net/downloads/editor/category/editor-2" target="_blank">
				Install JCE Editor for WYSIWYG Support!</a> ', $output);//
			}
		}
		
		$base = str_replace('administrator/' , '', JURI::base());
		
		$output = str_replace('src="images/', 'src="'.$base.'images/',  $output);
		
		$output = str_replace('<li class="leaf first"><a href="/droomla/v3/administrator/?option=com_droomla&q=user/1">',
		'<li class="leaf first" style="display:none"><a href="/droomla/v3/administrator/?option=com_droomla&amp;q=user/1">',		
		$output);
		$output = str_replace('<li class="leaf last"><a href="/droomla/v3/administrator/?option=com_droomla&q=logout">',
		'<li class="leaf last" style="display:none"><a href="/droomla/v3/administrator/?option=com_droomla&amp;q=user/1">',		
		$output);
		
		$output = str_replace('name="','name="_dos_', $output);
		
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
		
		exit($output);
	}
}