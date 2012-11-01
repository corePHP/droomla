<?php defined('_JEXEC') or die('Restricted access'); ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="shortcut icon" href="<?php echo $this->path ?>misc/favicon.ico" type="image/x-icon" />
<title>Droomla - Admin</title>
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/node/node.css?1" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/system/admin.css?1" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/system/defaults.css?1" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/system/system.css?1" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/system/system-menus.css?1" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>modules/user/user.css?1" />
<link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>themes/garland/style.css?1" />
<link type="text/css" rel="stylesheet" media="print" href="<?php echo $this->path ?>themes/garland/print.css?1" />
<!--[if lt IE 7]>
      <link type="text/css" rel="stylesheet" media="all" href="<?php echo $this->path ?>themes/garland/fix-ie.css" />    <![endif]-->
</head>
<body class="sidebar-left">

<!-- Layout -->
<div id="header-region" class="clear-block"></div>
<div id="wrapper">
    <div id="container" class="clear-block">
        <div id="header">
            <div id="logo-floater">
                <h1><a href="<?php echo $this->path ?>" title="Droomla"><img src="<?php echo $this->path ?>themes/garland/logo.png" alt="drupal6" id="logo" /><span>Droomla</span></a></h1>
            </div>
           
        </div>
        <!-- /header -->
        
        <div id="sidebar-left" class="sidebar">
            <div id="block-user-1" class="clear-block block block-user">
                <h2>admin</h2>
                <div class="content">
                    <ul class="menu">
                        <li class="leaf first"><a href="?option=com_droomla&amp;q=user/1">My account</a></li>
                        <li class="collapsed"><a href="?option=com_droomla&amp;q=node/add">Create content</a></li>
                        <li class="expanded active-trail"><a href="?option=com_droomla&amp;q=admin">Administer</a>
                            <ul class="menu">
                                <li class="collapsed first"><a title="Manage your site's content." href="?option=com_droomla&amp;q=admin/content">Content management</a></li>
                                <li class="expanded active-trail"><a title="Control how your site looks and feels." href="?option=com_droomla&amp;q=admin/build">Site building</a>
                                    <ul class="menu">
                                        <li class="leaf first"><a  class="active" title="Configure what block content appears in your site's sidebars and other regions." href="?option=com_droomla&amp;q=admin/build/block">Blocks</a></li>
                                        <li class="collapsed"><a title="Control your site's navigation menu, primary links and secondary links. as well as rename and reorganize menu items." href="?option=com_droomla&amp;q=admin/build/menu">Menus</a></li>
                                        <li class="leaf"><a title="Enable or disable add-on modules for your site." href="?option=com_droomla&amp;q=admin/build/modules">Modules</a></li>
                                        <li class="leaf last active-trail"><a title="Change which theme your site uses or allows users to set." href="?option=com_droomla&amp;q=admin/build/themes">Themes</a></li>
                                    </ul>
                                </li>
                                <li class="collapsed"><a title="Adjust basic site configuration options." href="?option=com_droomla&amp;q=admin/settings">Site configuration</a></li>
                                <li class="collapsed"><a title="Manage your site's users, groups and access to site features." href="?option=com_droomla&amp;q=admin/user">User management</a></li>
                                <li class="collapsed"><a title="View reports from system logs and other status information." href="?option=com_droomla&amp;q=admin/reports">Reports</a></li>
                                <li class="leaf last"><a href="?option=com_droomla&amp;q=admin/help">Help</a></li>
                            </ul>
                        </li>
                        <li class="leaf last"><a href="?option=com_droomla&amp;q=logout">Log out</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div id="center">
            <div id="squeeze">
                <div class="right-corner">
                    <div class="left-corner">
                        <div class="breadcrumb"><a href="<?php echo $this->path ?>">Home</a> › <a href="?option=com_droomla&q=admin">Administer</a> › <a href="?option=com_droomla&q=admin/build" title="Control how your site looks and feels.">Site building</a></div>
                        <?php echo $this->maincontent; ?> </div>
                </div>
            </div>
        </div>
        <!-- /.left-corner, /.right-corner, /#squeeze, /#center --> 
        
    </div>
    <!-- /container --> 
</div>

<!-- /layout -->

</body>
</html>