<?php defined('_JEXEC') or die('Restricted access'); 
/**
 * @package		kago
 * @author		Adam Stephen Docherty
 * @copyright	Copyright (C) 2010 'corePHP' / corephp.com. All rights reserved.
 * @license		GNU/GPL, see LICENSE.txt
 */
 
class JElementBlocklist extends JElement
{
	/**
	* Element name
	*
	* @access       protected
	* @var          string
	*/
	var $_name = 'Blocklist';

	function fetchElement($name, $value, &$node, $control_name)
	{		
		$ctrl  = $control_name .'['. $name .']';
		$blocks = json_decode( Drupal::blocks_get(), true );
		
		$attribs = false;
		
		foreach( $blocks as $k=>$block){
			if( !$block['subject'] ) $blocks[$k]['subject'] = $block['module'];
			if( $k == 'user_1' ) $blocks[$k]['subject'] = 'Navigation';
		}
		
		if( empty( $blocks ) ) return 'No blocks found in Droomla Region - add some in Drupal Admin!';
		
		$html = JHTML::_('select.genericlist',$blocks, $ctrl, $attribs, 'bid', 'subject', $value, $control_name.$name);
		
		foreach( $blocks as $block){
			if( $block['bid'] == $value ) $html .= '<h3>Block Output: '.$block['subject'].'</h3>' . $block['content'];
		}
		
		return $html;
    }
}