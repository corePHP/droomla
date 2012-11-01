<?php
/**
 * Joomla! 1.5 component droomla
 *
 * @version $Id: droomla.php 2010-10-01 02:59:09 svn $
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

/*
 * Define constants for all pages
 */
define( 'COM_DROOMLA_DIR', 'images'.DS.'droomla'.DS );
define( 'COM_DROOMLA_BASE', JPATH_ROOT.DS.COM_DROOMLA_DIR );
define( 'COM_DROOMLA_BASEURL', JURI::root().str_replace( DS, '/', COM_DROOMLA_DIR ));

// Require the base controller
require_once JPATH_COMPONENT.DS.'controller.php';

// Initialize the controller
$controller = new DroomlaController( );

// Perform the Request task
$controller->execute( JRequest::getCmd('task'));
$controller->redirect();
?>