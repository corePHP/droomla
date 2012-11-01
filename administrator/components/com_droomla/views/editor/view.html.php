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

jimport( 'joomla.application.component.view');

/**
 * HTML View class for the droomla component
 */
class DroomlaViewEditor extends JView {
		
	function display() {
		
		$editor = JFactory::getEditor();
		
    	$editor->display('edit-body', '', '740', '400', '60', '20', true);
	
		$document	= JFactory::getDocument();
	
		unset($document->_scripts['/droomla/v4/includes/js/joomla.javascript.js']);
		
		$head = false;
		
		$basepath = str_replace('/administrator/', '', JURI::base());
		$basepath= false;
		
		foreach( $document->_styleSheets as $src=>$v ){
			$head .= '<link rel="stylesheet" href="'.$basepath.$src.'" type="text/css" />';
		}
		
		//$head .= '<link rel="stylesheet" href="'.JURI::base().'/templates/khepri/css/general.css" type="text/css" />';
		
		foreach( $document->_scripts as $src=>$v ){
			$head .= '<script type="text/javascript" src="'.$basepath.$src.'"></script>';
		}
		
		foreach( $document->_script as $src=>$content ){
			$head .= '<script type="text/javascript">'.$content.'</script>';
		}
		
	   $head .= str_replace( 'asdfasdggrgd', 'form-textarea', $document->_custom[0]);
		
		$buttons = '<a class="modal-button" title="Image" href="http://localhost:8888/droomla/v4/administrator/index.php?option=com_media&amp;view=images&amp;tmpl=component&amp;e_name=edit-body" onclick="IeCursorFix();return false;" rel="{handler: \'iframe\', size: {x: 570, y: 400}}">Image</a>
<a href="#" onclick="javascript:tinyMCE.execCommand(\'mceToggleEditor\', false, \'edit-body\');return false;" title="Toggle editor">Toggle editor</a>
';
		$return = json_encode(array(
			$head, $buttons
		));
		
		
		$return = json_decode($return, true);
		
		//print_r($return);
		
		//die();
		
		echo $return[0];
		
		
		?>
        <!-- Start Editor --><textarea id="edit-body" name="bulldang" cols="60" rows="20" style="width:740px; height:400px;" class="mce_editable form-textarea resizable textarea-processed"></textarea>

        <?php
		echo $return[1];
die();
		return;
	}
}