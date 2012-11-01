<?php defined( '_JEXEC' ) or die( 'Restricted access' );

function com_install()
{	
	header( 'Location: ' . JURI::base() . 'index.php?option=com_droomla&view=install' );	
}