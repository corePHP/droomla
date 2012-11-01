<?php
/**
 * Joomla! 1.5 component droomla
 *
 * @version $Id: router.php 2010-10-01 02:59:09 svn $
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
 * Function to convert a system URL to a SEF URL
 */
function DroomlaBuildRoute(&$query) {
 $segments = array();
       /*if(isset($query['view']))
       {
                $segments[] = $query['view'];
                unset( $query['view'] );
       }*/
	   
	   unset( $query['view'] );
	   
       if(isset($query['q']))
       {
                $segments[] = $query['q'];
                unset( $query['q'] );
				
				 $segments[] = '';
       };
	   
	   if(isset($query['page']))
       {
                $segments[] = $query['page'];
                unset( $query['page'] );
				
				 $segments[] = '';
       };
	   
	  
	   
       return $segments;

}
/*
 * Function to convert a SEF URL back to a system URL
 */
function DroomlaParseRoute(&$segments) {
 $vars = array();
      
	  $vars['view'] = 'droomla';
	  $vars['q'] = $segments[0];
	 if(isset($segments[1])) $vars['page'] = $segments[1];
	 // $vars['a'] = $segments[1];
	  /* switch($segments[0])
       {
               case 'categories':
                       $vars['view'] = 'categories';
                       break;
               case 'category':
                       $vars['view'] = 'category';
                       $id = explode( ':', $segments[1] );
                       $vars['id'] = (int) $id[0];
                       break;
               case 'article':
                       $vars['view'] = 'article';
                       $id = explode( ':', $segments[1] );
                       $vars['id'] = (int) $id[0];
                       break;
       }*/
       return $vars;

}
?>