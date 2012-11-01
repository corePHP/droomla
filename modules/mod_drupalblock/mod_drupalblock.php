<?php
/**
 * Drupal Block Module Entry Point
 * 
 * @package    Droomla
 * @subpackage Modules
 * @link www.droomla.com
 * @license        gpl
 * To display Drupal Blocks inside Joomla!
 */
 
// no direct access
defined( '_JEXEC' ) or die( 'Restricted access' );

$block = Drupal::$_blocks[ $params->get( 'block', false ) ];

Drupal::load_querypath();

$block = @qp( '<html><body>' . $block['content'] . '</body></html>' );

if($params->get( 'tag_id', false )){
	$block->find('ul:first')->attr('id', $params->get( 'tag_id', false ));
}

foreach( $block->find('ul') as $ul ){
	$ul->removeAttr('class', '');
}

$block->top()->find('ul:first')->attr('class', 'menu' . $params->get( 'class_sfx', false ) );

foreach( $block->find('li[class*=expanded]') as $li ){	
	$li->addClass('parent');
}

foreach( $block->top()->find('a') as $a ){	
	$link_text = $a->innerHtml();
	$link = $a->attr('href');
	$link = explode('?', $link);
	$link = array_pop($link);
	
	$link=str_replace('/', '.', $link);
	//print_r($link);
	
	//$params->get( 'itemid', false )
	$link = JRoute::_('index.php?Itemid=' . $params->get( 'itemid', false ). '&' .$link );
	
	$link = str_replace('&amp;', '&', $link);
	$a->attr('href', $link);
	//echo $link;
	$a->html('<span>'.$link_text.'</span>');
}

$output = $block->top()->find('body')->innerHtml();

if (get_magic_quotes_gpc()) {
   $output = stripslashes($output);  
}

echo $output; 