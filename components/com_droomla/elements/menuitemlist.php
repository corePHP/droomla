<?php defined('_JEXEC') or die('Restricted access'); 
/**
 * @package		kago
 * @author		Adam Stephen Docherty
 * @copyright	Copyright (C) 2010 'corePHP' / corephp.com. All rights reserved.
 * @license		GNU/GPL, see LICENSE.txt
 */
 
class JElementMenuitemlist extends JElement
{
	/**
	* Element name
	*
	* @access       protected
	* @var          string
	*/
	var $_name = 'Menuitemlist';

	function fetchElement($name, $value, &$node, $control_name)
	{		
		$ctrl  = $control_name .'['. $name .']';
		
		$attribs = false;
		
		$db =& JFactory::getDBO();
		$query = "SELECT * FROM #__menu ORDER BY menutype";
		$db->setQuery($query);

		$menus = $db->loadAssocList();
		
		/*[0] =&gt; Array
        (
            [id] =&gt; 1
            [menutype] =&gt; mainmenu
            [name] =&gt; Home
*/

		$output = array();
		$output[]=array(
		'itemid' => 0,
		'name' => '--none--'
		);
		
		foreach( $menus as $menu){
			$output[]=array(
			'itemid' => $menu['id'],
			'name' => $menu['menutype'] .':' . $menu['name']
			);
		}
		
	//	if( empty( $blocks ) ) return 'No blocks found in Droomla Region - add some in Drupal Admin!';
		
		$html = JHTML::_('select.genericlist',$output, $ctrl, $attribs, 'itemid', 'name', $value, $control_name.$name);
		
		
		
		return $html;
    }
}