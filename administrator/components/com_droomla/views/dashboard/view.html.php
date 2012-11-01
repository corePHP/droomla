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


/*JConfig Object
(
    [offline] =&gt; 0
    [editor] =&gt; tinymce
    [list_limit] =&gt; 20
    [helpurl] =&gt; http://help.joomla.org
    [debug] =&gt; 0
    [debug_lang] =&gt; 0
    [sef] =&gt; 1
    [sef_rewrite] =&gt; 1
    [sef_suffix] =&gt; 0
    [feed_limit] =&gt; 10
    [feed_email] =&gt; author
    [secret] =&gt; qGIl0T7RdplDJ0R2
    [gzip] =&gt; 0
    [error_reporting] =&gt; -1
    [xmlrpc_server] =&gt; 0
    [log_path] =&gt; /Applications/MAMP/htdocs/droomla/v9/logs
    [tmp_path] =&gt; /Applications/MAMP/htdocs/droomla/v9/tmp
    [live_site] =&gt; 
    [force_ssl] =&gt; 0
    [offset] =&gt; 0
    [caching] =&gt; 0
    [cachetime] =&gt; 15
    [cache_handler] =&gt; file
    [memcache_settings] =&gt; Array
        (
        )

    [ftp_enable] =&gt; 0
    [ftp_host] =&gt; 127.0.0.1
    [ftp_port] =&gt; 21
    [ftp_user] =&gt; 
    [ftp_pass] =&gt; 
    [ftp_root] =&gt; 
    [dbtype] =&gt; mysql
    [host] =&gt; localhost
    [user] =&gt; root
    [db] =&gt; droomla_v9
    [dbprefix] =&gt; jos_
    [mailer] =&gt; mail
    [mailfrom] =&gt; asdfasdf@asd.com
    [fromname] =&gt; Droomla V9
    [sendmail] =&gt; /usr/sbin/sendmail
    [smtpauth] =&gt; 0
    [smtpsecure] =&gt; none
    [smtpport] =&gt; 25
    [smtpuser] =&gt; 
    [smtppass] =&gt; 
    [smtphost] =&gt; localhost
    [MetaAuthor] =&gt; 1
    [MetaTitle] =&gt; 1
    [lifetime] =&gt; 15
    [session_handler] =&gt; database
    [password] =&gt; root
    [sitename] =&gt; Droomla V9
    [MetaDesc] =&gt; Joomla! - the dynamic portal engine and content management system
    [MetaKeys] =&gt; joomla, Joomla
    [offline_message] =&gt; This site is down for maintenance. Please check back again soon.
)

*/


/**
 * HTML View class for the droomla component
 */
class DroomlaViewDashboard extends JView {
		
	function display() {
		
		$config = new JConfig();
		
		JError::raiseNotice( 200, 'DO NOT MESS WITH THEMES OR CLEAN URLS IN THE DRUPAL ADMIN UNLESS YOU KNOW WHAT YOU ARE DOING -
		 THEMES AND CLEAN URLS ARE HANDLED BY JOOMLA!' );
		 
		 JError::raiseNotice( 200, 'IF YOU ARE LOGGED IN THE JOOMLA FRONTEND AND THEN LOGIN TO THE JOOMLA BACKEND WITH THE SAME USER YOU WILL BE LOGGED OUT OF THE FRONTEND (FOR DRUPAL STUFF) AND WILL HAVE TO LOG IN AGAIN' );
		
		 JError::raiseNotice( 200, 'IF YOU WISH TO "SPLIT SUMMARY AT CURSOR" IN DRUPAL TEXT FIELDS YOU MUST FIRST HIDE JCE BY USING THE "SHOW/HIDE" TOGGLE.' );
		 JError::raiseNotice( 200, 'IT IS POSSIBLE TO LOSE TEXT WHEN SPLITTING OR JOINING FROM SUMMARY SO YOU SHOULD ALWAYS BACK UP YOUR INPUT BEFORE SPLITTING OR JOINING SUMMARIES!' );
		
		$this->check_php_version( '5.2.6' );
		$this->check_joomla_version( '1.5.15' );
		$this->check_curl();
		
		//if( $config->sef_suffix ) JError::raiseWarning( 200, 'SEF Suffix enabled. This can cause issues and should be disabled in Joomla! Global Settings' );
		
		if( strstr( $config->password, ':' ) ){
			JError::raiseWarning( 200, 'Database Password contains colon (:) Droomla will not work until colon is removed! You must uninstall Droomla and reinstall when after you change the password.' );
		}
		
		if( strstr( $config->user, ':' ) ){
			JError::raiseWarning( 200, 'Database Username contains colon (:) Droomla will not work until colon is removed! You must uninstall Droomla and reinstall when after you change the username.' );
		}
		
		//password
		Drupal::load_querypath();
		
		$cmp_xml = qp( JPATH_ADMINISTRATOR . '/components/com_droomla/droomla.xml' );
		
		$version = ' v'.$cmp_xml->find('install')->find('version')->text();
		
		JToolBarHelper::title(JText::_('Droomla') . $version, 'droomla.png');
		JToolBarHelper::preferences('com_droomla');
		
		$view	= JRequest::getVar( 'view', '', '', 'string', JREQUEST_ALLOWRAW );
		
		JSubMenuHelper::addEntry( JText::_( 'Droomla Dashboard' ), 'index.php?option=com_droomla&view=dashboard',($view == 'dashboard'));
		JSubMenuHelper::addEntry( JText::_( 'Drupal Administration' ), 'index.php?option=com_droomla',($view == ''));
		
		parent::display( 'dashboard' );
	}
	
	public function check_php_version( $min_version ){
		
		if ( strnatcmp( phpversion(), $min_version ) >= 0 ){}else{
			JError::raiseWarning( 200, 'Server PHP version out of date - must be upgraded > than ' . $min_version );		
		}
		
		return true;
	}
	
	public function check_joomla_version( $min_version ){
		jimport('joomla.version');
		$version = new JVersion();
		if ( strnatcmp( $version->getShortVersion(), $min_version ) >= 0 ){}else{
			JError::raiseWarning( 200, 'Joomla! version out of date - must be upgraded > than ' . $min_version );		
		}
		
		return true;
	}
	
	public function check_curl(){
		
		if ( !function_exists('curl_version') ){
			JError::raiseWarning( 200, 'You must install CURL on your server for Droomla to work! (Contact Server Administrator)' );		
		}
		
		return true;
	}
}