<?php defined('_JEXEC') or die('Restricted access'); ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="<?php echo $this->path ?>misc/favicon.ico" type="image/x-icon" />
<title>Blocks | Droomla</title>
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/block/block.css?w" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/node/node.css?w" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/system/admin.css?w" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/system/defaults.css?w" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/system/system.css?w" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/system/system-menus.css?w" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/user/user.css?w" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>themes/garland/style.css?w" />
<link type="text/css" rel="stylesheet" media="print" href="<?php echo $this->path ?>themes/garland/print.css?w" />
<?php echo $this->scripts; ?>

<!--[if lt IE 7]>
      <link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>themes/garland/fix-ie.css" />    <![endif]-->
</head>
<body class="sidebars">

<!-- Layout -->
<div id="header-region" class="clear-block">
   
</div>
<div id="wrapper">
    <div id="container" class="clear-block">
        <div id="header">
            <div id="logo-floater">
                <h1><a href="<?php echo $this->path ?>" title="Droomla"><img src="<?php echo $this->path ?>themes/garland/logo.png" alt="Droomla" id="logo" /><span>Droomla</span></a></h1>
            </div>
        </div>
        <!-- /header -->
        
        <div id="sidebar-left" class="sidebar">
            <div id="block-user-1" class="clear-block block block-user">
                <h2>Admin</h2>
                <div class="content">
                    <ul class="menu">
                        <li class="leaf first"><a href="<?php echo $this->query ?>&q=user/1">My account</a></li>
                        <li class="collapsed"><a href="<?php echo $this->query ?>&q=node/add">Create content</a></li>
                        <li class="expanded active-trail"><a href="<?php echo $this->query ?>&q=admin">Administer</a>
                            <ul class="menu">
                                <li class="collapsed first"><a href="<?php echo $this->query ?>&q=admin/content" title="Manage your site&#039;s content.">Content management</a></li>
                                <li class="expanded active-trail"><a href="<?php echo $this->query ?>&q=admin/build" title="Control how your site looks and feels.">Site building</a>
                                    <ul class="menu">
                                        <li class="leaf first active-trail"><a href="<?php echo $this->query ?>&q=admin/build/block" title="Configure what block content appears in your site&#039;s sidebars and other regions." class="active">Blocks</a></li>
                                        <li class="collapsed"><a href="<?php echo $this->query ?>&q=admin/build/menu" title="Control your site&#039;s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.">Menus</a></li>
                                        <li class="leaf"><a href="<?php echo $this->query ?>&q=admin/build/modules" title="Enable or disable add-on modules for your site.">Modules</a></li>
                                        <li class="leaf last"><a href="<?php echo $this->query ?>&q=admin/build/themes" title="Change which theme your site uses or allows users to set.">Themes</a></li>
                                    </ul>
                                </li>
                                <li class="collapsed"><a href="<?php echo $this->query ?>&q=admin/settings" title="Adjust basic site configuration options.">Site configuration</a></li>
                                <li class="collapsed"><a href="<?php echo $this->query ?>&q=admin/user" title="Manage your site&#039;s users, groups and access to site features.">User management</a></li>
                                <li class="collapsed"><a href="<?php echo $this->query ?>&q=admin/reports" title="View reports from system logs and other status information.">Reports</a></li>
                                <li class="leaf last"><a href="<?php echo $this->query ?>&q=admin/help">Help</a></li>
                            </ul>
                        </li>
                        <li class="leaf last"><a href="<?php echo $this->query ?>&q=logout">Log out</a></li>
                    </ul>
                </div>
            </div>
            
        </div>
        <div id="center">
            <div id="squeeze">
                <div class="right-corner">
                    <div class="left-corner">
                        <div class="breadcrumb"><a href="<?php echo $this->path ?>">Home</a> › <a href="<?php echo $this->query ?>&q=admin">Administer</a> › <a href="<?php echo $this->query ?>&q=admin/build" title="Control how your site looks and feels.">Site building</a></div>
                        <div id="tabs-wrapper" class="clear-block">
                            <h2 class="with-tabs">Blocks</h2>
                            <ul class="tabs primary">
                                <li class="active" ><a href="<?php echo $this->query ?>&q=admin/build/block" class="active">List</a></li>
                                <li ><a href="<?php echo $this->query ?>&q=admin/build/block/add">Add block</a></li>
                            </ul>
                        </div>
                        <ul class="tabs secondary">
                          <li  class="active"><a  class="active" href="<?php echo $this->query ?>&q=admin/build/block">Zen</a></li>
                            <li><a href="<?php echo $this->query ?>&q=admin/build/block/list/garland">Garland (Admin Theme)</a></li>
                          
                        </ul>
                        <div class="help">
                            <p>This page provides a drag-and-drop interface for assigning a block to a region, and for controlling the order of blocks within regions. To change the region or order of a block, grab a drag-and-drop handle under the <em>Block</em> column and drag the block to a new location in the list. (Grab a handle by clicking and holding the mouse while hovering over a handle icon.) Since not all themes implement the same regions, or display regions in the same way, blocks are positioned on a per-theme basis. Remember that your changes will not be saved until you click the <em>Save blocks</em> button at the bottom of the page.</p>
                            <p>Click the <em>configure</em> link next to each block to configure its specific title and visibility settings. Use the <a href="<?php echo $this->query ?>&q=admin/build/block/add">add block page</a> to create a custom block.</p>
                            <div class="more-help-link">[<a href="<?php echo $this->query ?>&q=admin/help/block">more help...</a>]</div>
                        </div>
                        <div class="clear-block">
                           <?php echo $this->maincontent; ?>
                            
                        </div>
                        <div id="footer">
                            <div id="block-system-0" class="clear-block block block-system">
                                <div class="content"><a href="http://drupal.org"><img src="<?php echo $this->path ?>misc/powered-blue-80x15.png" alt="Powered by Drupal, an open source content management system" title="Powered by Drupal, an open source content management system" width="80" height="15" /></a></div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.left-corner, /.right-corner, /#squeeze, /#center -->
        
        <div id="sidebar-right" class="sidebar">
           
        </div>
    </div>
    <!-- /container --> 
</div>
<!-- /layout -->

</body>
</html>