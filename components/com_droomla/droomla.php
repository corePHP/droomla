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

// Require the base controller
require_once JPATH_COMPONENT.DS.'controller.php';

// Initialize the controller
$controller = new DroomlaController();
$controller->execute( null );

// Redirect if set by the controller
$controller->redirect();
?>