<?php
/**
 * Helper class for Drupal Block module
 * 
 * @package    Droomla
 * @subpackage Modules
 * @link www.droomla.com
 * @license        gpl
 * To display Drupal Blocks inside Joomla!
 */
 
// no direct access
defined('_JEXEC') or die('Restricted access');

class modDrupalBlockHelper
{
    /**
     * Retrieves the hello message
     *
     * @param array $params An object containing the module parameters
     * @access public
     */    
    function getHello( $params )
    {
        return 'Hello, World!';
    }
}
?>
