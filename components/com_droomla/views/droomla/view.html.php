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
//require_once( JPATH_COMPONENT . '/helpers/QueryPath/QueryPath.php' );
/**
 * HTML View class for the droomla component
 */
class DroomlaViewDroomla extends JView {
	
	function __construct(){
		
		parent::__construct();
	}
	
	function display() {
        
		$droomla_params	= JComponentHelper::getParams('com_droomla');
		
		//$item_id = JSite::getMenu()->getActive()->id;
		
		$router = JSite::getRouter();
   		$querystr = $router->getVars();
		
		
		$item_id = $querystr['Itemid'];
		
		if(!$item_id){
			$item_id = $droomla_params->get( 'itemid', 1 );
		} else {
			$droomla_params->set( 'itemid', $item_id );
		}
		
		$this->item_id = $item_id;
		
		if( $cache_id = JRequest::getVar( 'jid' ) ){
			return $this->display_javascript( $cache_id );
		}
		
		//$document	= JDocumentHTML::getHeadData();
//	print_r($document);return;
	
		/*unset($document->_scripts['/droomla/v4/includes/js/joomla.javascript.js']);
		unset($document->_scripts['/droomla/v4/media/system/js/mootools.js']);
		unset($document->_scripts['/droomla/v4/media/system/js/modal.js']);*/
		
		//print_r($document);
		
		$application = JFactory::getApplication();	
		
		Drupal::load_querypath();
		
		JHTML::addIncludePath(JPATH_BASE.DS.'components'.DS.'com_content'.DS.'helpers');
		
		//$query_string = $_SERVER['QUERY_STRING'];
		
		$router = JApplication::getRouter('site');
		
		//print_r($router);
		$query_string = JURI::getInstance()->buildQuery( $router->_vars );	
		
		
		
		if( !strstr( $query_string, 'dos_frontend' ) ) $query_string = $query_string . '&dos_client=dos_frontend';
		
		
		$output = Drupal::query( $query_string );
		
		//echo $output;die();
	//	$output = str_replace( '&amp;', '&', $output );
	//	$output = str_replace( '&', '&amp;', $output );
		
	
		$page_data = Drupal::extract_tag( 'page_data', $output );		
		$page_data = json_decode( $page_data );
		
		
		//JRequest::setVar( 'head_title',  $page_data->head_title );
		
		
		
		$scripts = qp( '<html><body>' . $page_data->scripts . '</body></html>' );
			
		$document	= JFactory::getDocument();
		
		foreach( $scripts->find('script') as $script ){
			if( $script->attr('src') ){ //$document->addScript( $script->attr('src') );
				
				$path_file = preg_replace( "/\?.*$/", "", $script->attr('src') );
				$path_file = preg_replace( "/.*com_droomla\/drupal/", "", $path_file );
				$path_file = '/components/com_droomla/drupal' . $path_file;
				
				$javascript_files[] = preg_replace( "/\?.*$/", "", $path_file );
			} else {
				///droomla/v4/components/com_droomla/drupal/
				$script = str_replace( 'components/com_droomla/drupal/?', 'index.php?option=com_droomla&', $script->text());
				
				
				$document->addScriptDeclaration( $script );
			}
		}
		
		$cache_id = $this->process_javascript( $javascript_files );
		
		$document->addScript("index.php?option=com_droomla&jid=" . $cache_id);
		
		$styles = qp( '<html><body>' . $page_data->styles . '</body></html>' );
		
		foreach( $styles->find('body')->children() as $styles ){
			
			$path_file = preg_replace( "/\?.*$/", "", $styles->attr('href') );
			$path_file = preg_replace( "/.*com_droomla\/drupal/", "", $path_file );
			
			$template_override = '/templates/'. $application->setTemplate .'/html/com_droomla/overrides' . $path_file;
			$droomla_override = '/components/com_droomla/overrides' . $path_file;
			$no_override = '/components/com_droomla/drupal' . $path_file;
			
			if(file_exists( JPATH_SITE  . $template_override )){
				$document->addStylesheet( JURI::base( true ) . $template_override );
			} else if(file_exists( JPATH_SITE  . $droomla_override )){
				$document->addStylesheet( JURI::base( true ) . $droomla_override );
			} else {
				
				if( !strstr( $path_file, '/themes/tao/' ) && !strstr( $path_file, '/themes/rubik/' ) ){
					$document->addStylesheet( JURI::base( true ) . $no_override );
				}
			}
		}
		
		$page_content = Drupal::extract_tag( 'page_content', $output );		
		$raw_content = $page_content;
		
		
		$page_content = str_replace( '«', htmlentities('<<'), $page_content );
		$page_content = str_replace( '‹', htmlentities('<'), $page_content );
		$page_content = str_replace( '»', htmlentities('>>'), $page_content );
		$page_content = str_replace( '›', htmlentities('>'), $page_content );
		
		
		$page_content = @qp( '<html><body>' . $page_content . '</body></html>' );
		
		$base_path = JURI::base( true ) .'/';
		
		foreach( $page_content->find('a') as $link ){			
			
			//echo  $link->attr('href');
			$new_link = $link->attr('href');
		
			if( strstr($new_link, 'com_droomla') && !strstr($new_link, '/files/') ){
				parse_str($new_link, $route);
				
				array_shift($route);
				unset($route['dos_client']);
				unset($route['dos_frontend']);
				unset($route['cmd']);
				unset($route['j_template']);
				
				$route['option'] = 'com_droomla';
				
				if(!isset($route['Itemid'])) $route['Itemid'] = $droomla_params->get( 'itemid', 1 );
				$new_link = JRoute::_( 'index.php?' . http_build_query( $route ) );
				
				$new_link = str_replace( '&amp;', '&', $new_link );
				
				$link->attr('href', $new_link );
			}
			
			
		}
		
		
		//die();
		$nodes = array();
		
		foreach( $page_content->top()->find('div[class=dos_node]') as $node ){			
			$data = $node->find( 'script[class=dos_data]' )->text();
			$data = str_replace( '//<![CDATA[', '', $data );
			$data = str_replace( '//]]>', '', $data );
			
			$data = json_decode( $data );
			$data->content = $node->parent()->find( 'div[class=dos_content]' )->innerHtml();
			$node->parent()->remove();
			$nodes[] = $data;			
		}
		
		if($page_content->top()->find('script')->text()){
			foreach( $page_content->top()->find('script') as $script ){						
				echo  $script->text();
				$script_text = str_replace( 'components/com_droomla/drupal/?', 'index.php?option=com_droomla&', $script->text());
				$script_text = str_replace( '$(', 'jQuery(', $script_text );
				$script_text = str_replace( '$.', 'jQuery.', $script_text );
				$script->remove();
				$document->addScriptDeclaration( $script_text );
			}
		}
		
		$page_content = $page_content->top()->html();
		//print_r($nodes);die();
		$page_content = str_replace(
		"<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\" \"http://www.w3.org/TR/REC-html40/loose.dtd\">\n<html><body>", '', $page_content);
		$page_content = str_replace(
		"</body></html>", '', $page_content);

		
		$page_content = str_replace( '</form>', '
		<input type="hidden" name="Itemid" value="'.$item_id.'" />
		<input type="hidden" name="view" value="droomla" />
		</form>
		', $page_content );
		//echo $page_content;die();
		$output = false;
		
		$page_tabs = Drupal::convert_links( $page_data->tabs, 'droomla', $droomla_params->get( 'itemid', 1 ) );
		
		$user = JFactory::getUser();
		$this->is_admin = false;
		
		if($user->usertype == "Super Administrator" || $user->usertype == "Administrator") $this->is_admin = true;
		
		//echo strstr($page_content, 'form-textarea');
		
		if( (strstr($page_content, 'form-textarea') && $droomla_params->get('editor_frontend', 0)) 
		|| ( strstr($page_content, 'form-textarea') && $this->is_admin) ){
			$j_editor = file_get_contents( str_replace('administrator/', '', JURI::base()) . 'index.php?option=com_droomla&view=editor&tmpl=component');
			
			
			
			$j_editor = json_decode( $j_editor, true );
			//print_r($j_editor);die();
			if(is_array($j_editor) && !empty($j_editor)){
				$page_content = str_replace('form-textarea','mceEditor form-textarea', $page_content);
			$page_content =  $j_editor[0] . $page_content;
			
			} 
		}
		$this->build_breadcrumbs( $page_data->breadcrumb, $page_data->head_title );
		
		if( empty( $nodes ) ){
			
			echo $page_tabs . $page_content;
		} else {
			
			
			$lang = JFactory::getLanguage();		
			$lang->load( 'com_content', JPATH_SITE );
			
			if( strstr($page_content, 'class="pager"') || count($nodes) > 1 ){
				$output .= $this->render_frontpage( $nodes, $page_content );
				
				
				
				return;
				//$output .= $this->render_node( $node );
			} else {
				foreach( $nodes as $node ){
					$output .= $this->render_node( $node );
				}
			}
			
			/*if(JRequest::getVar('q')){
				foreach( $nodes as $node ){
					$output .= $this->render_node( $node );
				}
				unset($nodes);
			} else {
				
				$output .= $this->render_frontpage( $nodes );
				
				unset($nodes);
			}*/
			
			echo  $page_tabs . $output . $page_content;
		}
		
		return;
		
	}
	
	function build_breadcrumbs( $response=false, $active_crumb ){
		
		$application = JFactory::getApplication();
		$document = JFactory::getDocument();
		$active_crumb= explode('|', $active_crumb);
		
		$active_crumb= $active_crumb[0];
		
		if( $response ){
		
			$base_path = JURI::base( true ) .'/';
			$pathway = $application->getPathWay();
			
			
			array_shift( $response );
			
			//print_r(count($response));
			
			if( count($response) > 1 ) array_pop( $response );
			
			
			
			$title = JSite::getMenu()->getActive()->name;
			
		//	print_r($response);
			if(!empty($response))
			foreach( $response as $link ){
				
				 preg_match("/href=\"([^\"]*)\"/",$link,  $new_link); 
				  preg_match("/(>)(\w.*)(<)/ismU",$link,  $text); 
				 
				 $new_link =  $new_link[1];
				$new_link = str_replace( Drupal::$_drupal_uri .'?', Drupal::$_droomla_uri .'&', $new_link );
				$new_link = str_replace( 'view=droomla&', '', $new_link);		
				$new_link = str_replace( '?', '?view=droomla&', $new_link);
			//	$new_link = JRoute::_( str_replace( $base_path, '', $new_link ) );
			//	$new_link = str_replace( '&amp;', '&', $new_link);
				//echo str_replace( $base_path, '', $new_link );
				//if(strstr( $new_link, 'view=' )){ 
				//echo JRoute::_( str_replace( $base_path, '', $new_link ));
				
				if(!strstr($new_link, 'Itemid')){
					$new_link = $new_link . '&Itemid=' . $this->item_id;
				}
				
				$pathway->addItem( $text[2] , JRoute::_( str_replace( $base_path, '', $new_link ) ) );
				//}
				$title .= ' - ' . html_entity_decode($text[2], ENT_COMPAT, "UTF-8");
			}
				$pathway->addItem( $active_crumb, false );
				
				 $title .= ' - ' . html_entity_decode($active_crumb, ENT_COMPAT, "UTF-8");
				 
				
				$document->setTitle($title);
				
		} 
			
			
			
			return;
			
		
	}
	
	function render_frontpage( $nodes, $page_content )
	{
		global $mainframe, $option;
		
		require_once (JPATH_SITE . '/components/com_content/view.php');
		require_once (JPATH_SITE . '/components/com_content/helpers/query.php');
		require_once (JPATH_SITE . '/components/com_content/helpers/route.php');
		//JLoader::import('joomla.application.component.model');
		JLoader::import( 'frontpage', JPATH_SITE . '/components/com_content/models' );
		
		$model = JModel::getInstance( 'Frontpage', 'ContentModel' );
		
		//ContentModelFrontpage
		// Initialize variables
		$user		=& JFactory::getUser();
		$document	=& JFactory::getDocument();

		// Request variables
		$id			= JRequest::getVar('id', null, '', 'int');
		$limit		= JRequest::getVar('limit', 5, '', 'int');
		$limitstart	= JRequest::getVar('limitstart', 0, '', 'int');

		// Get the page/component configuration
		//$params = &$mainframe->getParams();
		
		$params	= JComponentHelper::getParams('com_content');
		
		
		//print_r($params);die();
		// parameters
		$intro			= $params->def('num_intro_articles',	count($nodes));
		$leading		= $params->def('num_leading_articles',	0);
		$links			= $params->def('num_links', 			4);

		$descrip		= $params->def('show_description', 		1);
		$descrip_image	= $params->def('show_description_image',1);
/*show_noauth=0
show_title=1
link_titles=0
show_intro=1
show_section=0
link_section=0
show_category=1
link_category=1
show_author=1
show_create_date=1
show_modify_date=1
show_item_navigation=0
show_readmore=1
show_vote=0
show_icons=1
show_pdf_icon=1
show_print_icon=1
show_email_icon=1
show_hits=1
feed_summary=0
filter_tags=
filter_attritbutes=
*/
		$params->set('show_title', 	1);
		$params->set('link_titles', 	1);
		$params->set('show_author', 	1);
		$params->set('show_create_date', 	1);
		$params->set('show_readmore', 	1);
		$params->set('show_intro', 	1);
		$params->def('num_columns', 1);
		$params->set('num_links', 0);
		$params->set('show_page_title', 0);
		$params->set('show_category', 0);
		$params->set('show_pagination_results', 1);
		$params->set('show_pagination', 1);
		


		$limit = $intro + $leading + $links;
		JRequest::setVar('limit', (int) $limit);

		//set data model
		
		$items = $this->convert_nodes( $nodes );
		
		
		
		//$items = $model->getData();
		$total = $model->getTotal();

		// Create a user access object for the user
		$access				= new stdClass();
		$access->canEdit	= $user->authorize('com_content', 'edit', 'content', 'all');
		$access->canEditOwn	= $user->authorize('com_content', 'edit', 'content', 'own');
		$access->canPublish	= $user->authorize('com_content', 'publish', 'content', 'all');

		//add alternate feed link
		if($params->get('show_feed_link', 1) == 1)
		{
			$link	= '&format=feed&limitstart=';
			$attribs = array('type' => 'application/rss+xml', 'title' => 'RSS 2.0');
			$document->addHeadLink(JRoute::_($link.'&type=rss'), 'alternate', 'rel', $attribs);
			$attribs = array('type' => 'application/atom+xml', 'title' => 'Atom 1.0');
			$document->addHeadLink(JRoute::_($link.'&type=atom'), 'alternate', 'rel', $attribs);
		}

		$menus	= &JSite::getMenu();
		$menu	= $menus->getActive();

		// because the application sets a default page title, we need to get it
		// right from the menu item itself
		if (is_object( $menu )) {
			$menu_params = new JParameter( $menu->params );
			if (!$menu_params->get( 'page_title')) {
				$params->set('page_title',	 htmlspecialchars_decode($mainframe->getCfg('sitename' )));
			}
		} else {
			$params->set('page_title',	 htmlspecialchars_decode($mainframe->getCfg('sitename' )));
		}
		
		//$document->setTitle( $params->get( 'page_title' ) );


		$application = JFactory::getApplication();
		$user = JFactory::getUser();
		
		$this->addTemplatePath( JPATH_SITE . '/components/com_content/views/frontpage/tmpl/' );
		if(class_exists('T3Hook')){
			$this->addTemplatePath( JPATH_SITE . '/plugins/system/jat3/base-themes/default/html/com_content/frontpage/' );
		}
		$this->addTemplatePath( JPATH_SITE . '/templates/'. $application->setTemplate .'/html/com_content/frontpage/' );
		$this->addTemplatePath( JPATH_SITE . '/templates/'. $application->setTemplate .'/html/com_droomla/frontpage/' );
		///Applications/MAMP/htdocs/droomla/v8/plugins/system/jat3/base-themes/default/html/com_content/frontpage/

		$this->setLayout( 'default' );

		jimport('joomla.html.pagination');
		//$this->pagination = new JPagination($total, $limitstart, $limit - $links);
		$this->pagination = new droomla_pagination( $page_content );
		$this->pagination->limitstart = 0;
		
		//$this->pagination = new JPagination($total, $limitstart, $limit - $links);
		//echo $this->pagination->getPagesLinks();die();
		
		$this->assign('total',			count($nodes));

		$this->assignRef('user',		$user);
		$this->assignRef('access',		$access);
		$this->assignRef('params',		$params);
		$this->assignRef('items',		$items);

		parent::display($tpl);
	}

	function convert_nodes( $nodes ){
		/*[type] => node
            [node_id] => 18
            [classes] => node node-type-blog node-promoted node-teaser
            [user_picture] => 
            [page] => 
            [node_url] => /droomla/v8/components/com_droomla/drupal/?q=asdfasdfadsf
            [title] => asdfasdfadsf
            [unpublished] => 
            [unpublished_text] => Unpublished
            [display_submitted] => 1
            [terms] => 
            [name] => admin
            [date] => Wed, 12/01/2010 - 23:28
            [links] => <ul class="links inline"><li class="blog_usernames_blog first"><a href="/droomla/v8/components/com_droomla/drupal/?q=blog.1" title="Read admin&#039;s latest blog entries.">admin&#039;s blog</a></li>
<li class="node_read_more last"><a href="/droomla/v8/components/com_droomla/drupal/?q=asdfasdfadsf" title="Read the rest of asdfasdfadsf.">Read more</a></li>
</ul>
            [content] => 
<p>asdfasdfasd</p>
*/

		$droomla_params	= JComponentHelper::getParams('com_droomla');
		
		foreach( $nodes as $node ){
			
			
			
			$created = str_replace(',','',$node->date);
			$created = str_replace('-','',$created);
			$created = strtotime($created);
			$created = date('Y-m-d H:i:s', $created);
			
			$item = new stdClass();
			
			//if( strstr( $node->links, 'node_read_more' ) ){
				$item->readmore = Drupal::convert_link( $node->node_url, $droomla_params->get( 'itemid', 1 ) );
				//echo $node->node_url; die();
			//}
			
			$item->id = $node->node_id;  
            $item->title = html_entity_decode($node->title, ENT_COMPAT, "UTF-8");
            $item->alias = $node->title;
            $item->title_alias = $node->title;  
            $item->introtext = $node->content . Drupal::convert_links( $node->links, 'droomla', $droomla_params->get( 'itemid', 1 ) );  
            $item->fulltext = '';
            $item->sectionid = $droomla_params->get('secid');
            $item->state = 1;
            $item->catid = $droomla_params->get('catid');
            $item->created = $created;
            $item->created_by = 0;
            $item->created_by_alias = 0;
            $item->modified = $node->date;
            $item->modified_by = 0;
            $item->checked_out = 0;
            $item->checked_out_time = '0000-00-00 00:00:00';
            $item->publish_up = $node->date;
            $item->publish_down = '0000-00-00 00:00:00';
            $item->images = 0;
            $item->attribs = '
				show_title=
				link_titles=
				show_intro=
				show_section=
				link_section=
				show_category=
				link_category=
				show_vote=
				show_author=
				show_create_date=
				show_modify_date=
				show_pdf_icon=0
				show_print_icon=0
				show_email_icon=0
				language=
				keyref=
				readmore=
			';
            $item->urls = 0;
            $item->metakey = 0;
            $item->metadesc = 0; 
            $item->access = 0;
            $item->slug = 0;
            $item->catslug = 0;
            
            $item->author = strip_tags($node->name);
            $item->usertype = 0;
            $item->groups = 'Public';
            $item->author_email = 0;
            $item->category = 0;
            $item->section = 0;
            $item->s_ordering = 0;
            $item->cc_ordering = 0;
            $item->a_ordering = 0;
            $item->f_ordering = 0;
			
			$items[] = $item;
		}
		
		return $items;
	}
	
	function getItem($index = 0, &$params)
	{
		global $mainframe;

		// Initialize some variables
		$user		=& JFactory::getUser();
		$dispatcher	=& JDispatcher::getInstance();

		$SiteName	= $mainframe->getCfg('sitename');

		$task		= JRequest::getCmd('task');

		$linkOn		= null;
		$linkText	= null;

		$item =& $this->items[$index];
		$item->text = $item->introtext;

		// Get the page/component configuration and article parameters
		$item->params = clone($params);
		$aparams = new JParameter($item->attribs);

		// Merge article parameters into the page configuration
		$item->params->merge($aparams);

		// Process the content preparation plugins
		JPluginHelper::importPlugin('content');
		$results = $dispatcher->trigger('onPrepareContent', array (& $item, & $item->params, 0));
		
		//[show_modify_date]
		$item->params->set('show_modify_date', 0);
		
		// Build the link and text of the readmore button
		if (($item->params->get('show_readmore') && @ $item->readmore) || $item->params->get('link_titles'))
		{
			// checks if the item is a public or registered/special item
			if ($item->access <= $user->get('aid', 0))
			{
				$item->readmore_link = JRoute::_($item->readmore);
				$item->readmore_register = false;
			}
			else
			{
				$item->readmore_link = JRoute::_("index.php?option=com_user&view=login");
				$item->readmore_register = true;
			}
		}


		$item->event = new stdClass();
		$results = $dispatcher->trigger('onAfterDisplayTitle', array (& $item, & $item->params,0));
		$item->event->afterDisplayTitle = trim(implode("\n", $results));

		$results = $dispatcher->trigger('onBeforeDisplayContent', array (& $item, & $item->params, 0));
		$item->event->beforeDisplayContent = trim(implode("\n", $results));

		$results = $dispatcher->trigger('onAfterDisplayContent', array (& $item, & $item->params, 0));
		$item->event->afterDisplayContent = trim(implode("\n", $results));

//print_r($item);die();
		return $item;
	}
	
	function render_node( $node, $return_class=false ){

/*[type] => node
    [node_id] => 2
    [classes] => node node-type-story node-promoted node-teaser
    [user_picture] => 
    [page] => 
    [node_url] => /droomla/v4/components/com_droomla/drupal/?q=node/2
    [title] => my cool story
    [unpublished] => 
    [unpublished_text] => Unpublished
    [display_submitted] => 1
    [terms] => 
    [name] => admin
    [date] => Wed, 10/27/2010 - 15:29
    [links] => 
    [content] => 
*/

		//embedd the article default layout in a view
		
		
		$application = JFactory::getApplication();
		$user = JFactory::getUser();	
		$article = new stdClass();
		$lang = JFactory::getLanguage();
		
		$lang->load( 'com_content', JPATH_SITE );
		
		$dispatcher	= JDispatcher::getInstance();
		$droomla_params	= JComponentHelper::getParams('com_droomla');
		
		$params = new JParameter( '
			show_noauth=0
			show_title=1
			link_titles=1
			show_intro=1
			show_section=0
			link_section=0
			show_category=1
			link_category=1
			show_author=1
			show_create_date=1
			show_modify_date=1
			show_item_navigation=1
			show_readmore=1
			show_vote=0
			show_icons=0
			show_pdf_icon=0
			show_print_icon=0
			show_email_icon=0
			show_hits=0
			feed_summary=0
			filter_tags=
			filter_attritbutes=
		');
		
		//populate the article object
		
		$article->id = $node->node_id;
		
		$article->text = $node->content . Drupal::convert_links( $node->links, 'droomla', $droomla_params->get( 'itemid', 1 ) );
		
		$title = $node->title;
		//$title = urldecode($title);
		$title = stripslashes($title);
		$title_raw = "The first entry for adam's blog!";
		//echo $title._;
		//echo $title_raw._;
		$title = html_entity_decode($title, ENT_COMPAT, "UTF-8");
		//$title = str_replace("'", '', $title);
		//echo $title;
		//echo $this->escape('The first entry for adam\'s blog')._;
		
		//echo $title;
		//$title = str_replace("\n", "", $title);
		//$title = str_replace("\r", "", $title);

		//echo $title;
		//$title = "The first entry for adam's blog!";
		//$title = $this->escape($title);
		//$title = htmlspecialchars_decode($node->title);
		
		//echo $node->content;die();
		
		$article->title = $title;
			//$article->title = html_entity_decode($node->title);
		$article->author = strip_tags($node->name);
		$article->created = $node->date;
		
		$base_path = JURI::base( true ) .'/';
		
		$new_link = $node->node_url;
		$new_link = str_replace( Drupal::$_drupal_uri .'?', Drupal::$_droomla_uri .'&', $new_link );
		$new_link = str_replace( 'view=droomla', '', $new_link);		
		$new_link = str_replace( '?', '?view=droomla&', $new_link);
		$new_link = JRoute::_( str_replace( $base_path, '', $new_link ) );
		$new_link = str_replace( '&amp;', '&', $new_link);
			
		$article->readmore_link = $new_link;
		//cat38
		$article->sectionid = $droomla_params->get('secid');
		$article->catid = $droomla_params->get('catid');
		$article->created = str_replace(',','',$article->created);
		$article->created = str_replace('-','',$article->created);
		$article->created = strtotime($article->created);
		$article->created = date('Y-m-d H:i:s', $article->created);
		
		/*
		 * Handle display events
		 */
		 JPluginHelper::importPlugin('content');
		 
		$article->event = new stdClass();
		$results = $dispatcher->trigger('onAfterDisplayTitle', array (&$article, &$params, $limitstart));
		$article->event->afterDisplayTitle = trim(implode("\n", $results));
//print_r($results);
		$results = $dispatcher->trigger('onBeforeDisplayContent', array (&$article, &$params, $limitstart));
		$article->event->beforeDisplayContent = trim(implode("\n", $results));

		$results = $dispatcher->trigger('onAfterDisplayContent', array (&$article, &$params, $limitstart));
		$article->event->afterDisplayContent = trim(implode("\n", $results));
		
		unset($article->catid);
		
		if($return_class){
			return $article;
		}
		
		$this->addTemplatePath( JPATH_SITE . '/components/com_content/views/article/tmpl/' );
		$this->addTemplatePath( JPATH_SITE . '/templates/'. $application->setTemplate .'/html/com_content/article/' );
		
		$this->setLayout( 'default' );
		
		$this->assignRef('article', $article);
		$this->assignRef('params' , $params);
		$this->assignRef('user'   , $user);
		$this->assignRef('access' , $access);
		$this->assignRef('print', $print);
		
		return parent::loadTemplate();
	}
	
	
	
	
	function process_javascript( $files ){
		
		jimport('joomla.cache.cache');
		jimport('joomla.cache.callback');
		
		$cache = JCache::getInstance( 'callback', array(
			//this will be the folder name of your cache
			//inside the "cachebase" folder
			'defaultgroup' => 'drupal_javascript', ///
			'cachebase' => JPATH_BASE . '/cache/',
			//how long to store the data in cache (seconds
			'lifetime' => ( 60 ), 
			//'lifetime' => ( 5*60*60 ),
			'language' => 'en-GB',
			'storage' => 'file'
		));
		
		$cache_id = md5( json_encode($files) );		
		
		$app =& JFactory::getApplication();
		
		$cache->setCaching( true );
		
		if ($app->_name == 'administrator' ) $cache->setCaching( false );
		
		$javascript = $cache->get( array( $this, '_process_javascript' ), array( $files ), $cache_id );
		
		return $cache_id;
	}
	
	function _process_javascript( $files ){
		return json_encode( $files );
	}
	
	function display_javascript( $cache_id )
	{				
		jimport('joomla.cache.cache');
		jimport('joomla.cache.callback');
		
		$cache = JCache::getInstance( 'callback', array(
			//this will be the folder name of your cache
			//inside the "cachebase" folder
			'defaultgroup' => 'drupal_javascript', ///
			'cachebase' => JPATH_BASE . '/cache/',
			//how long to store the data in cache (seconds
			'lifetime' => ( 1 ), 
			//'lifetime' => ( 5*60*60 ),
			'language' => 'en-GB',
			'storage' => 'file'
		));
		
		$files = json_decode( $cache->get( array( $this, '_process_javascript' ), array( $files ), $cache_id ), true );
		
		//print_r($files);
		$offset = 10;
		
		header('Content-type: text/javascript');
		header("Cache-Control: max-age={$offset}, must-revalidate");
		header('Expires: '.gmdate( 'D, d M Y H:i:s', time() + $offset ) . ' GMT');
		
		$js = false;
		
		if(is_array($files)){
			foreach( $files as $file){
				
				$contents = file_get_contents( JPATH_SITE . $file );
				
				if( !strstr( $file, 'jquery.js' ) && !strstr( $file, 'jquery.form.js' ) ){
					
					$contents = str_replace( '$(', 'jQuery(', $contents );
					$contents = str_replace( '$.', 'jQuery.', $contents );
				} else {
					
				}
				
				if( !strstr( $file, '/themes/tao/' ) && !strstr( $file, '/themes/rubik/' ) ){
					$js .= $contents;
				}
			}
			
			$js .= "\n jQuery.noConflict();";
		}
	
		exit($js);
	}
}


class droomla_pagination{
	
	public $limitstart = 1;
	
	function __construct( $paging ){
		
		if( !strstr($paging, 'pager') ) return false;
		
		$item = new stdClass();
		
		$application = JFactory::getApplication();
		
		$paging = str_replace('?dos_client=dos_frontend&amp;cmd=query&amp;j_template='.$application->setTemplate, '', $paging);
		
		
		//http://localhost:8888/droomla/v8/index.php/droomla/node/1?dos_client=dos_frontend&cmd=query&j_template=ja_events
		
		$tpl_pagination_path = JPATH_SITE . '/templates/'. $application->setTemplate .'/html/pagination.php';
		
		if(file_exists($tpl_pagination_path)){
			require_once( $tpl_pagination_path );
		} else {
			require_once( JPATH_SITE . 'libraries/joomla/html/pagination.php' );
		}
		
		$paging = qp( $paging );
		
		$paging->find('div.item-list')->addClass('pagination')->removeClass('item-list');
		
		if( $paging->find('li.pager-first')->text() ){		
			$link = $paging->top()->find('li.pager-first')->find('a:first')->attr('href');
			
			$item->text = JText::_( 'Start' );
			$item->link = $link;
			
			$start_active = 1;
			$start_data = pagination_item_active( $item );
			
			$link = $paging->top()->find('li.pager-previous')->find('a:first')->attr('href');
			
			$item->text = JText::_( 'Prev' );
			$item->link = $link;
			
			$previous_active = 1;
			$previous_data = pagination_item_active( $item );
		} else {		
			$item->text = JText::_( 'Start' );
			$start_active = 0;
			$start_data = pagination_item_inactive( $item );
			
			$item->text = JText::_( 'Prev' );
			$previous_active = 0;
			$previous_data = pagination_item_inactive( $item );		
		}
		
		if( $paging->top()->find('li.pager-last')->text() ){
			
			$link = $paging->top()->find('li.pager-last')->find('a:first')->attr('href');
			
			$item->text = JText::_( 'End' );
			$item->link = $link;
			
			$end_active = 1;
			$end_data = pagination_item_active( $item );
			
			$link = $paging->top()->find('li.pager-next')->find('a:first')->attr('href');
			
			$item->text = JText::_( 'Next' );
			$item->link = $link;
			
			$next_active = 1;
			$next_data = pagination_item_active( $item );
		} else {
			$item->text = JText::_( 'End' );
			$end_active = 0;
			$end_data = pagination_item_inactive( $item );
			
			$item->text = JText::_( 'Next' );
			$next_active = 0;
			$next_data = pagination_item_inactive( $item );
		}
		
		$paging->top()->find('li.pager-first')->remove();
		$paging->top()->find('li.pager-previous')->remove();
		$paging->top()->find('li.pager-next')->remove();
		$paging->top()->find('li.pager-last')->remove();
		
		$item = new stdClass();
		
		foreach( $paging->top()->find('li') as $li ){
				
			if( $li->hasClass( 'pager-current' ) ){
				
				$page = $li->text();				
				$item->text = $page-1;				
				$this->current_page = $item->text;
				$pages[ $page ] = array(
					'active' => 0,
					'data' => pagination_item_inactive( $item )
				);
				
			} else {
				$page = $li->find('a:first')->text();				
				$item->text = $page-1;
				
				$link = $li->attr('href');
				
				$item->link = $link;
				
				$pages[ $page ] = array(
					'active' => 1,
					'data' => pagination_item_active( $item )
				);
			}
		}
		
		$this->page_count = count( $pages );
		$list = array(
			'all' => array(
				'active' => 0,
				'data' => false
			),
			'start' => array(
				'active' => $start_active,
				'data' => $start_data
			),
			'previous' => array(
				'active' => $previous_active,
				'data' => $previous_data
			),
			'pages' => $pages,
			'next' => array(
				'active' => $next_active,
				'data' => $next_data
			),
			'end' => array(
				'active' => $end_active,
				'data' => $end_data
			)
		
		);
		$this->paging = pagination_list_render($list);
	}
	
	function getPagesCounter(){
		return $this->current_page;
	}
	
	function get(){
		return $this->page_count;
	}
	
	function getPagesLinks(){
		
		
		return $this->paging;
	}
}