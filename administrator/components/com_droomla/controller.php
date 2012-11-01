<?php
/**
 * Joomla! 1.5 component droomla
 *
 * @version $Id: controller.php 2010-10-01 02:59:09 svn $
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

jimport( 'joomla.application.component.controller' );

/**
 * droomla Controller
 *
 * @package Joomla
 * @subpackage droomla
 */
class DroomlaController extends JController {
    /**
     * Constructor
     * @access private
     * @subpackage droomla
     */
    function __construct() {
        //Get View
        if(JRequest::getCmd('view') == '') {
            JRequest::setVar('view', 'default');
        }
        $this->item_type = 'Default';
        parent::__construct();
    }
	
	function upload_module(){
		
		$msg 	= JText::_('Item Published');
		$link 	= 'index.php?option=com_droomla&view=' . JRequest::getVar('view', 'dashboard');
		
		$this->setRedirect($link, $msg);
		$this->redirect();
		
		return;
		//Retrieve file details from uploaded file, sent from upload form
        $file = JRequest::getVar('file_upload', null, 'files', 'array'); 
        // Retorna: Array ( [name] => mod_simpleupload_1.2.1.zip [type] => application/zip 
        // [tmp_name] => /tmp/phpo3VG9F [error] => 0 [size] => 4463 ) 
 
        if(isset($file)){ 
                //Clean up filename to get rid of strange characters like spaces etc
                $filename = JFile::makeSafe($file['name']);
 
                if($file['size'] > $max) $msg = JText::_('ONLY_FILES_UNDER').' '.$max;
                //Set up the source and destination of the file
 
                $src = $file['tmp_name'];
                $dest = $module_dir . DS . $filename;
 
                //First check if the file has the right extension, we need jpg only
                if ($file['type'] == $file_type || $file_type == '*') { 
                   if ( JFile::upload($src, $dest) ) {
 
                       //Redirect to a page of your choice
                        $msg = JText::_('FILE_SAVE_AS').' '.$dest;
                   } else {
                          //Redirect and throw an error message
                        $msg = JText::_('ERROR_IN_UPLOAD');
                   }
                } else {
                   //Redirect and notify user file is not right extension
                        $msg = JText::_('FILE_TYPE_INVALID');
                }
 
                $msg = "<script>alert('". $msg ."');</script>";
        }




		
	}
}
?>