-- phpMyAdmin SQL Dump
-- version 2.11.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 05, 2010 at 11:09 PM
-- Server version: 5.0.41
-- PHP Version: 5.2.6

--
-- Database: `drupal_v6`
--

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_access`
--

CREATE TABLE IF NOT EXISTS `#__dos_access` (
  `aid` int(11) NOT NULL auto_increment,
  `mask` varchar(255) NOT NULL default '',
  `type` varchar(255) NOT NULL default '',
  `status` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_access`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_accesslog`
--

CREATE TABLE IF NOT EXISTS `#__dos_accesslog` (
  `aid` int(11) NOT NULL auto_increment,
  `sid` varchar(64) NOT NULL default '',
  `title` varchar(255) default NULL,
  `path` varchar(255) default NULL,
  `url` text,
  `hostname` varchar(128) default NULL,
  `uid` int(10) unsigned default '0',
  `timer` int(10) unsigned NOT NULL default '0',
  `timestamp` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`aid`),
  KEY `accesslog_timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_accesslog`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_actions`
--

CREATE TABLE IF NOT EXISTS `#__dos_actions` (
  `aid` varchar(255) NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  `callback` varchar(255) NOT NULL default '',
  `parameters` longtext NOT NULL,
  `description` varchar(255) NOT NULL default '0',
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_actions`
--

INSERT INTO `#__dos_actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES('comment_publish_action', 'comment', 'comment_publish_action', '', 'Publish comment');
INSERT INTO `#__dos_actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES('comment_unpublish_action', 'comment', 'comment_unpublish_action', '', 'Unpublish comment');
INSERT INTO `#__dos_actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES('node_publish_action', 'node', 'node_publish_action', '', 'Publish post');
INSERT INTO `#__dos_actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES('node_unpublish_action', 'node', 'node_unpublish_action', '', 'Unpublish post');
INSERT INTO `#__dos_actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES('node_make_sticky_action', 'node', 'node_make_sticky_action', '', 'Make post sticky');
INSERT INTO `#__dos_actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES('node_make_unsticky_action', 'node', 'node_make_unsticky_action', '', 'Make post unsticky');
INSERT INTO `#__dos_actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES('node_promote_action', 'node', 'node_promote_action', '', 'Promote post to front page');
INSERT INTO `#__dos_actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES('node_unpromote_action', 'node', 'node_unpromote_action', '', 'Remove post from front page');
INSERT INTO `#__dos_actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES('node_save_action', 'node', 'node_save_action', '', 'Save post');
INSERT INTO `#__dos_actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES('user_block_user_action', 'user', 'user_block_user_action', '', 'Block current user');
INSERT INTO `#__dos_actions` (`aid`, `type`, `callback`, `parameters`, `description`) VALUES('user_block_ip_action', 'user', 'user_block_ip_action', '', 'Ban IP address of current user');

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_actions_aid`
--

CREATE TABLE IF NOT EXISTS `#__dos_actions_aid` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_actions_aid`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_aggregator_category`
--

CREATE TABLE IF NOT EXISTS `#__dos_aggregator_category` (
  `cid` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `description` longtext NOT NULL,
  `block` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_aggregator_category`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_aggregator_category_feed`
--

CREATE TABLE IF NOT EXISTS `#__dos_aggregator_category_feed` (
  `fid` int(11) NOT NULL default '0',
  `cid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cid`,`fid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_aggregator_category_feed`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_aggregator_category_item`
--

CREATE TABLE IF NOT EXISTS `#__dos_aggregator_category_item` (
  `iid` int(11) NOT NULL default '0',
  `cid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cid`,`iid`),
  KEY `iid` (`iid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_aggregator_category_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_aggregator_feed`
--

CREATE TABLE IF NOT EXISTS `#__dos_aggregator_feed` (
  `fid` int(11) NOT NULL auto_increment,
  `title` varchar(255) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  `refresh` int(11) NOT NULL default '0',
  `checked` int(11) NOT NULL default '0',
  `link` varchar(255) NOT NULL default '',
  `description` longtext NOT NULL,
  `image` longtext NOT NULL,
  `etag` varchar(255) NOT NULL default '',
  `modified` int(11) NOT NULL default '0',
  `block` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `title` (`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_aggregator_feed`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_aggregator_item`
--

CREATE TABLE IF NOT EXISTS `#__dos_aggregator_item` (
  `iid` int(11) NOT NULL auto_increment,
  `fid` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `link` varchar(255) NOT NULL default '',
  `author` varchar(255) NOT NULL default '',
  `description` longtext NOT NULL,
  `timestamp` int(11) default NULL,
  `guid` varchar(255) default NULL,
  PRIMARY KEY  (`iid`),
  KEY `fid` (`fid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_aggregator_item`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_authmap`
--

CREATE TABLE IF NOT EXISTS `#__dos_authmap` (
  `aid` int(10) unsigned NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `authname` varchar(128) NOT NULL default '',
  `module` varchar(128) NOT NULL default '',
  PRIMARY KEY  (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_authmap`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_batch`
--

CREATE TABLE IF NOT EXISTS `#__dos_batch` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `token` varchar(64) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longtext,
  PRIMARY KEY  (`bid`),
  KEY `token` (`token`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `#__dos_batch`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_blocks`
--

CREATE TABLE IF NOT EXISTS `#__dos_blocks` (
  `bid` int(11) NOT NULL auto_increment,
  `module` varchar(64) NOT NULL default '',
  `delta` varchar(32) NOT NULL default '0',
  `theme` varchar(64) NOT NULL default '',
  `status` tinyint(4) NOT NULL default '0',
  `weight` tinyint(4) NOT NULL default '0',
  `region` varchar(64) NOT NULL default '',
  `custom` tinyint(4) NOT NULL default '0',
  `throttle` tinyint(4) NOT NULL default '0',
  `visibility` tinyint(4) NOT NULL default '0',
  `pages` text NOT NULL,
  `title` varchar(64) NOT NULL default '',
  `cache` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Dumping data for table `#__dos_blocks`
--

INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(1, 'user', '0', 'garland', 1, 0, 'left', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(2, 'user', '1', 'garland', 1, 0, 'left', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(3, 'system', '0', 'garland', 1, 10, 'footer', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(4, 'system', '0', 'zen', 1, 0, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(5, 'user', '0', 'zen', 1, -3, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(6, 'user', '1', 'zen', 1, -5, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(7, 'comment', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', 1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(8, 'menu', 'primary-links', 'garland', 0, 0, '', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(9, 'menu', 'secondary-links', 'garland', 0, 0, '', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(10, 'node', '0', 'garland', 0, 0, '', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(11, 'user', '2', 'garland', 0, 0, '', 0, 0, 0, '', '', 1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(12, 'user', '3', 'garland', 0, 0, '', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(13, 'comment', '0', 'zen', 1, -1, 'droomla', 0, 0, 0, '', '', 1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(14, 'menu', 'primary-links', 'zen', 1, -4, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(15, 'menu', 'secondary-links', 'zen', 1, 3, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(16, 'node', '0', 'zen', 1, 1, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(17, 'user', '2', 'zen', 1, 2, 'droomla', 0, 0, 0, '', '', 1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(18, 'user', '3', 'zen', 1, -2, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(19, 'comment', '0', 'rubik', 1, -5, 'droomla', 0, 0, 0, '', '', 1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(20, 'menu', 'primary-links', 'rubik', 1, -9, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(21, 'menu', 'secondary-links', 'rubik', 1, 4, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(22, 'node', '0', 'rubik', 1, 2, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(23, 'system', '0', 'rubik', 1, 0, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(24, 'user', '0', 'rubik', 1, -7, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(25, 'user', '1', 'rubik', 1, -8, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(26, 'user', '2', 'rubik', 1, 3, 'droomla', 0, 0, 0, '', '', 1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(27, 'user', '3', 'rubik', 1, -6, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(28, 'menu', 'admin', 'rubik', 1, -4, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(29, 'admin', 'create', 'rubik', 1, -1, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(30, 'admin', 'theme', 'rubik', 1, 1, 'droomla', 0, 0, 0, '', '', 1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(31, 'admin', 'account', 'rubik', 1, -2, 'droomla', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(32, 'admin', 'menu', 'rubik', 1, -3, 'droomla', 0, 0, 0, '', '', 1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(33, 'blog', '0', 'rubik', 1, 7, 'droomla', 0, 0, 0, '', '', 1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(34, 'search', '0', 'rubik', 0, 0, '', 0, 0, 0, '', '', -1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(35, 'forum', '0', 'rubik', 1, 5, 'droomla', 0, 0, 0, '', '', 1);
INSERT INTO `#__dos_blocks` (`bid`, `module`, `delta`, `theme`, `status`, `weight`, `region`, `custom`, `throttle`, `visibility`, `pages`, `title`, `cache`) VALUES(36, 'forum', '1', 'rubik', 1, 6, 'droomla', 0, 0, 0, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_blocks_roles`
--

CREATE TABLE IF NOT EXISTS `#__dos_blocks_roles` (
  `module` varchar(64) NOT NULL,
  `delta` varchar(32) NOT NULL,
  `rid` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_blocks_roles`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_blogapi_files`
--

CREATE TABLE IF NOT EXISTS `#__dos_blogapi_files` (
  `fid` int(11) NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL default '0',
  `filepath` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_blogapi_files`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_book`
--

CREATE TABLE IF NOT EXISTS `#__dos_book` (
  `mlid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `bid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mlid`),
  UNIQUE KEY `nid` (`nid`),
  KEY `bid` (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_book`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_boxes`
--

CREATE TABLE IF NOT EXISTS `#__dos_boxes` (
  `bid` int(10) unsigned NOT NULL auto_increment,
  `body` longtext,
  `info` varchar(128) NOT NULL default '',
  `format` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_boxes`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_cache`
--

CREATE TABLE IF NOT EXISTS `#__dos_cache` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_cache`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_cache_block`
--

CREATE TABLE IF NOT EXISTS `#__dos_cache_block` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_cache_block`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_cache_filter`
--

CREATE TABLE IF NOT EXISTS `#__dos_cache_filter` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_cache_filter`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_cache_form`
--

CREATE TABLE IF NOT EXISTS `#__dos_cache_form` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_cache_form`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_cache_menu`
--

CREATE TABLE IF NOT EXISTS `#__dos_cache_menu` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_cache_menu`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_cache_page`
--

CREATE TABLE IF NOT EXISTS `#__dos_cache_page` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_cache_page`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_cache_update`
--

CREATE TABLE IF NOT EXISTS `#__dos_cache_update` (
  `cid` varchar(255) NOT NULL default '',
  `data` longblob,
  `expire` int(11) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `headers` text,
  `serialized` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_cache_update`
--

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_comments`
--

CREATE TABLE IF NOT EXISTS `#__dos_comments` (
  `cid` int(11) NOT NULL auto_increment,
  `pid` int(11) NOT NULL default '0',
  `nid` int(11) NOT NULL default '0',
  `uid` int(11) NOT NULL default '0',
  `subject` varchar(64) NOT NULL default '',
  `comment` longtext NOT NULL,
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  `status` tinyint(3) unsigned NOT NULL default '0',
  `format` smallint(6) NOT NULL default '0',
  `thread` varchar(255) NOT NULL,
  `name` varchar(60) default NULL,
  `mail` varchar(64) default NULL,
  `homepage` varchar(255) default NULL,
  PRIMARY KEY  (`cid`),
  KEY `pid` (`pid`),
  KEY `nid` (`nid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `#__dos_comments`
--

INSERT INTO `#__dos_comments` (`cid`, `pid`, `nid`, `uid`, `subject`, `comment`, `hostname`, `timestamp`, `status`, `format`, `thread`, `name`, `mail`, `homepage`) VALUES(1, 0, 3, 1, 'Marvin is cool!', 'And Droomla too!', '::1', 1289000993, 0, 1, '01/', 'admin', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_contact`
--

CREATE TABLE IF NOT EXISTS `#__dos_contact` (
  `cid` int(10) unsigned NOT NULL auto_increment,
  `category` varchar(255) NOT NULL default '',
  `recipients` longtext NOT NULL,
  `reply` longtext NOT NULL,
  `weight` tinyint(4) NOT NULL default '0',
  `selected` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`cid`),
  UNIQUE KEY `category` (`category`),
  KEY `list` (`weight`,`category`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `#__dos_contact`
--

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_files`
--

CREATE TABLE IF NOT EXISTS `#__dos_files` (
  `fid` int(10) unsigned NOT NULL auto_increment,
  `uid` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL default '',
  `filepath` varchar(255) NOT NULL default '',
  `filemime` varchar(255) NOT NULL default '',
  `filesize` int(10) unsigned NOT NULL default '0',
  `status` int(11) NOT NULL default '0',
  `timestamp` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_files`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_filters`
--

CREATE TABLE IF NOT EXISTS `#__dos_filters` (
  `fid` int(11) NOT NULL auto_increment,
  `format` int(11) NOT NULL default '0',
  `module` varchar(64) NOT NULL default '',
  `delta` tinyint(4) NOT NULL default '0',
  `weight` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  UNIQUE KEY `fmd` (`format`,`module`,`delta`),
  KEY `list` (`format`,`weight`,`module`,`delta`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `#__dos_filters`
--

INSERT INTO `#__dos_filters` (`fid`, `format`, `module`, `delta`, `weight`) VALUES(1, 1, 'filter', 2, 0);
INSERT INTO `#__dos_filters` (`fid`, `format`, `module`, `delta`, `weight`) VALUES(2, 1, 'filter', 0, 1);
INSERT INTO `#__dos_filters` (`fid`, `format`, `module`, `delta`, `weight`) VALUES(3, 1, 'filter', 1, 2);
INSERT INTO `#__dos_filters` (`fid`, `format`, `module`, `delta`, `weight`) VALUES(4, 1, 'filter', 3, 10);
INSERT INTO `#__dos_filters` (`fid`, `format`, `module`, `delta`, `weight`) VALUES(5, 2, 'filter', 2, 0);
INSERT INTO `#__dos_filters` (`fid`, `format`, `module`, `delta`, `weight`) VALUES(6, 2, 'filter', 1, 1);
INSERT INTO `#__dos_filters` (`fid`, `format`, `module`, `delta`, `weight`) VALUES(7, 2, 'filter', 3, 10);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_filter_formats`
--

CREATE TABLE IF NOT EXISTS `#__dos_filter_formats` (
  `format` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `roles` varchar(255) NOT NULL default '',
  `cache` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`format`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `#__dos_filter_formats`
--

INSERT INTO `#__dos_filter_formats` (`format`, `name`, `roles`, `cache`) VALUES(1, 'Filtered HTML', ',1,2,', 1);
INSERT INTO `#__dos_filter_formats` (`format`, `name`, `roles`, `cache`) VALUES(2, 'Full HTML', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_flood`
--

CREATE TABLE IF NOT EXISTS `#__dos_flood` (
  `fid` int(11) NOT NULL auto_increment,
  `event` varchar(64) NOT NULL default '',
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`fid`),
  KEY `allow` (`event`,`hostname`,`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_flood`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_forum`
--

CREATE TABLE IF NOT EXISTS `#__dos_forum` (
  `nid` int(10) unsigned NOT NULL default '0',
  `vid` int(10) unsigned NOT NULL default '0',
  `tid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`),
  KEY `tid` (`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_forum`
--

INSERT INTO `#__dos_forum` (`nid`, `vid`, `tid`) VALUES(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_history`
--

CREATE TABLE IF NOT EXISTS `#__dos_history` (
  `uid` int(11) NOT NULL default '0',
  `nid` int(11) NOT NULL default '0',
  `timestamp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_history`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_menu_custom`
--

CREATE TABLE IF NOT EXISTS `#__dos_menu_custom` (
  `menu_name` varchar(32) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `description` text,
  PRIMARY KEY  (`menu_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_menu_custom`
--

INSERT INTO `#__dos_menu_custom` (`menu_name`, `title`, `description`) VALUES('navigation', 'Navigation', 'The navigation menu is provided by Drupal and is the main interactive menu for any site. It is usually the only menu that contains personalized links for authenticated users, and is often not even visible to anonymous users.');
INSERT INTO `#__dos_menu_custom` (`menu_name`, `title`, `description`) VALUES('primary-links', 'Primary links', 'Primary links are often used at the theme layer to show the major sections of a site. A typical representation for primary links would be tabs along the top.');
INSERT INTO `#__dos_menu_custom` (`menu_name`, `title`, `description`) VALUES('secondary-links', 'Secondary links', 'Secondary links are often used for pages like legal notices, contact details, and other secondary navigation items that play a lesser role than primary links');
INSERT INTO `#__dos_menu_custom` (`menu_name`, `title`, `description`) VALUES('admin', 'Admin', 'Administrative links.');

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_menu_links`
--

CREATE TABLE IF NOT EXISTS `#__dos_menu_links` (
  `menu_name` varchar(32) NOT NULL default '',
  `mlid` int(10) unsigned NOT NULL auto_increment,
  `plid` int(10) unsigned NOT NULL default '0',
  `link_path` varchar(255) NOT NULL default '',
  `router_path` varchar(255) NOT NULL default '',
  `link_title` varchar(255) NOT NULL default '',
  `options` text,
  `module` varchar(255) NOT NULL default 'system',
  `hidden` smallint(6) NOT NULL default '0',
  `external` smallint(6) NOT NULL default '0',
  `has_children` smallint(6) NOT NULL default '0',
  `expanded` smallint(6) NOT NULL default '0',
  `weight` int(11) NOT NULL default '0',
  `depth` smallint(6) NOT NULL default '0',
  `customized` smallint(6) NOT NULL default '0',
  `p1` int(10) unsigned NOT NULL default '0',
  `p2` int(10) unsigned NOT NULL default '0',
  `p3` int(10) unsigned NOT NULL default '0',
  `p4` int(10) unsigned NOT NULL default '0',
  `p5` int(10) unsigned NOT NULL default '0',
  `p6` int(10) unsigned NOT NULL default '0',
  `p7` int(10) unsigned NOT NULL default '0',
  `p8` int(10) unsigned NOT NULL default '0',
  `p9` int(10) unsigned NOT NULL default '0',
  `updated` smallint(6) NOT NULL default '0',
  PRIMARY KEY  (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=271 ;

--
-- Dumping data for table `#__dos_menu_links`
--

INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 1, 0, 'batch', 'batch', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 3, 0, 'node', 'node', 'Content', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 4, 0, 'logout', 'logout', 'Log out', 'a:0:{}', 'system', 1, 0, 0, 0, 10, 1, 1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 5, 0, 'rss.xml', 'rss.xml', 'RSS feed', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 6, 0, 'user', 'user', 'User account', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 7, 0, 'node/%', 'node/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 191, 0, 'admin/build/menu-customize/%/delete', 'admin/build/menu-customize/%/delete', 'Delete menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 191, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 9, 0, 'filter/tips', 'filter/tips', 'Compose tips', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 11, 0, 'node/add', 'node/add', 'Create content', 'a:0:{}', 'system', 0, 0, 1, 1, 1, 1, 1, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 12, 0, 'comment/delete', 'comment/delete', 'Delete comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 13, 0, 'comment/edit', 'comment/edit', 'Edit comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 14, 0, 'system/files', 'system/files', 'File download', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 14, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 190, 123, 'admin/settings/actions/delete/%', 'admin/settings/actions/delete/%', 'Delete action', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:17:"Delete an action.";}}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 120, 123, 190, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 189, 0, 'admin/content/node-type/story/delete', 'admin/content/node-type/story/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 189, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 187, 116, 'admin/content/node-type/story', 'admin/content/node-type/story', 'Story', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 116, 187, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 188, 0, 'admin/content/node-type/page/delete', 'admin/content/node-type/page/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 188, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 186, 147, 'admin/reports/status/sql', 'admin/reports/status/sql', 'SQL', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 118, 147, 186, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 19, 0, 'user/autocomplete', 'user/autocomplete', 'User autocomplete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 19, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 185, 147, 'admin/reports/status/run-cron', 'admin/reports/status/run-cron', 'Run cron', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 118, 147, 185, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 21, 0, 'user/%', 'user/%', 'My account', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 1, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 183, 141, 'admin/content/node-settings/rebuild', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 116, 141, 183, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 184, 123, 'admin/settings/actions/orphan', 'admin/settings/actions/orphan', 'Remove orphans', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 120, 123, 184, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 182, 116, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Page', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 116, 182, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 181, 147, 'admin/reports/status/php', 'admin/reports/status/php', 'PHP', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 118, 147, 181, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 179, 148, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List terms', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 116, 148, 179, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 180, 125, 'admin/reports/updates/check', 'admin/reports/updates/check', 'Manual update check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 118, 125, 180, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 177, 144, 'admin/user/roles/edit', 'admin/user/roles/edit', 'Edit role', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 121, 144, 177, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 178, 122, 'admin/user/rules/edit', 'admin/user/rules/edit', 'Edit rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 121, 122, 178, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 176, 118, 'admin/reports/event/%', 'admin/reports/event/%', 'Details', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 118, 176, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 174, 135, 'admin/settings/filters/delete', 'admin/settings/filters/delete', 'Delete input format', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 120, 135, 174, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 175, 122, 'admin/user/rules/delete', 'admin/user/rules/delete', 'Delete rule', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 121, 122, 175, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 173, 126, 'admin/build/block/delete', 'admin/build/block/delete', 'Delete block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 119, 126, 173, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 172, 131, 'admin/settings/date-time/lookup', 'admin/settings/date-time/lookup', 'Date and time lookup', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 120, 131, 172, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 31, 0, 'node/%/delete', 'node/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 1, 1, 0, 31, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 32, 21, 'user/%/delete', 'user/%/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 21, 32, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 171, 136, 'admin/settings/logging/dblog', 'admin/settings/logging/dblog', 'Database logging', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:169:"Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.";}}', 'system', 0, 0, 0, 0, 0, 4, 0, 114, 120, 136, 171, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 169, 126, 'admin/build/block/configure', 'admin/build/block/configure', 'Configure block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 119, 126, 169, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 170, 119, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Customize menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 119, 170, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 168, 123, 'admin/settings/actions/configure', 'admin/settings/actions/configure', 'Configure an advanced action', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 120, 123, 168, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 166, 135, 'admin/settings/filters/%', 'admin/settings/filters/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 120, 135, 166, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 167, 127, 'admin/settings/clean-urls/check', 'admin/settings/clean-urls/check', 'Clean URL check', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 120, 127, 167, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 163, 117, 'admin/help/taxonomy', 'admin/help/taxonomy', 'taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 163, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 164, 117, 'admin/help/update', 'admin/help/update', 'update', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 164, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 165, 117, 'admin/help/user', 'admin/help/user', 'user', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 165, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 161, 117, 'admin/help/node', 'admin/help/node', 'node', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 161, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 162, 117, 'admin/help/system', 'admin/help/system', 'system', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 162, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 159, 117, 'admin/help/help', 'admin/help/help', 'help', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 159, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 160, 117, 'admin/help/menu', 'admin/help/menu', 'menu', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 160, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 157, 117, 'admin/help/dblog', 'admin/help/dblog', 'dblog', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 157, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 158, 117, 'admin/help/filter', 'admin/help/filter', 'filter', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 158, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 155, 117, 'admin/help/color', 'admin/help/color', 'color', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 155, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 156, 117, 'admin/help/comment', 'admin/help/comment', 'comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 156, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 153, 121, 'admin/user/user', 'admin/user/user', 'Users', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:26:"List, add, and edit users.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 121, 153, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 154, 117, 'admin/help/block', 'admin/help/block', 'block', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 154, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 152, 121, 'admin/user/settings', 'admin/user/settings', 'User settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Configure default behavior of users, including registration requirements, e-mails, and user pictures.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 121, 152, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 44, 0, 'comment/reply/%', 'comment/reply/%', 'Reply to comment', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 44, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 151, 118, 'admin/reports/page-not-found', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:36:"View ''page not found'' errors (404s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 118, 151, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 150, 118, 'admin/reports/access-denied', 'admin/reports/access-denied', 'Top ''access denied'' errors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:35:"View ''access denied'' errors (403s).";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 118, 150, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 149, 119, 'admin/build/themes', 'admin/build/themes', 'Themes', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:57:"Change which theme your site uses or allows users to set.";}}', 'system', 1, 0, 0, 0, 0, 3, 1, 114, 119, 149, 0, 0, 0, 0, 0, 0, 0);INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 148, 116, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Taxonomy', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:67:"Manage tagging, categorization, and classification of your content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 116, 148, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 147, 118, 'admin/reports/status', 'admin/reports/status', 'Status report', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Get a status report about your site''s operation and any detected problems.";}}', 'system', 0, 0, 0, 0, 10, 3, 0, 114, 118, 147, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 146, 120, 'admin/settings/site-maintenance', 'admin/settings/site-maintenance', 'Site maintenance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:63:"Take the site off-line for maintenance or bring it back online.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 146, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 145, 120, 'admin/settings/site-information', 'admin/settings/site-information', 'Site information', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:107:"Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 145, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 144, 121, 'admin/user/roles', 'admin/user/roles', 'Roles', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:30:"List, edit, or add user roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 121, 144, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 143, 118, 'admin/reports/dblog', 'admin/reports/dblog', 'Recent log entries', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View events that have recently been logged.";}}', 'system', 0, 0, 0, 0, -1, 3, 0, 114, 118, 143, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 142, 116, 'admin/content/rss-publishing', 'admin/content/rss-publishing', 'RSS publishing', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:92:"Configure the number of items per feed and whether feeds should be titles/teasers/full-text.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 116, 142, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 141, 116, 'admin/content/node-settings', 'admin/content/node-settings', 'Post settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:126:"Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 116, 141, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 140, 121, 'admin/user/permissions', 'admin/user/permissions', 'Permissions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:64:"Determine access to features by selecting permissions for roles.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 121, 140, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 139, 120, 'admin/settings/performance', 'admin/settings/performance', 'Performance', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:101:"Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 139, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 138, 119, 'admin/build/modules', 'admin/build/modules', 'Modules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:47:"Enable or disable add-on modules for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 119, 138, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 137, 119, 'admin/build/menu', 'admin/build/menu', 'Menus', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:116:"Control your site''s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 119, 137, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 136, 120, 'admin/settings/logging', 'admin/settings/logging', 'Logging and alerts', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:156:"Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destination, such as syslog, database, email, ...etc.";}}', 'system', 0, 0, 1, 0, 0, 3, 0, 114, 120, 136, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 135, 120, 'admin/settings/filters', 'admin/settings/filters', 'Input formats', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:127:"Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 135, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 134, 120, 'admin/settings/image-toolkit', 'admin/settings/image-toolkit', 'Image toolkit', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:74:"Choose which image toolkit to use if you have installed optional toolkits.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 134, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 133, 120, 'admin/settings/file-system', 'admin/settings/file-system', 'File system', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:68:"Tell Drupal where to store uploaded files and how they are accessed.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 133, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 81, 0, 'user/reset/%/%/%', 'user/reset/%/%/%', 'Reset password', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 81, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 83, 0, 'node/%/revisions/%/delete', 'node/%/revisions/%/delete', 'Delete earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 83, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 84, 0, 'node/%/revisions/%/revert', 'node/%/revisions/%/revert', 'Revert to earlier revision', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 84, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 85, 0, 'node/%/revisions/%/view', 'node/%/revisions/%/view', 'Revisions', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 85, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 132, 120, 'admin/settings/error-reporting', 'admin/settings/error-reporting', 'Error reporting', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:93:"Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 132, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 131, 120, 'admin/settings/date-time', 'admin/settings/date-time', 'Date and time', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:89:"Settings for how Drupal displays date and time, as well as the system''s default timezone.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 131, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 130, 116, 'admin/content/types', 'admin/content/types', 'Content types', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Manage posts by content type, including default status, front page promotion, etc.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 116, 130, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 129, 116, 'admin/content/node', 'admin/content/node', 'Content', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View, edit, and delete your site''s content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 116, 129, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 92, 0, 'taxonomy/autocomplete', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 92, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 128, 116, 'admin/content/comment', 'admin/content/comment', 'Comments', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"List and edit site comments and the comment moderation queue.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 116, 128, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 127, 120, 'admin/settings/clean-urls', 'admin/settings/clean-urls', 'Clean URLs', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"Enable or disable clean URLs for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 127, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 95, 0, 'taxonomy/term/%', 'taxonomy/term/%', 'Taxonomy term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 95, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 126, 119, 'admin/build/block', 'admin/build/block', 'Blocks', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:79:"Configure what block content appears in your site''s sidebars and other regions.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 119, 126, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 125, 118, 'admin/reports/updates', 'admin/reports/updates', 'Available updates', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:82:"Get a status report about available updates for your installed modules and themes.";}}', 'system', 0, 0, 0, 0, 10, 3, 0, 114, 118, 125, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 123, 120, 'admin/settings/actions', 'admin/settings/actions', 'Actions', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:41:"Manage the actions defined for your site.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 123, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 124, 120, 'admin/settings/admin', 'admin/settings/admin', 'Administration tools', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:39:"Settings for site administration tools.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 124, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 122, 121, 'admin/user/rules', 'admin/user/rules', 'Access rules', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:80:"List and create rules to disallow usernames, e-mail addresses, and IP addresses.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 121, 122, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 121, 114, 'admin/user', 'admin/user', 'User management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"Manage your site''s users, groups and access to site features.";}}', 'system', 0, 0, 1, 0, 0, 2, 0, 114, 121, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 120, 114, 'admin/settings', 'admin/settings', 'Site configuration', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:40:"Adjust basic site configuration options.";}}', 'system', 0, 0, 1, 0, -5, 2, 0, 114, 120, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 106, 11, 'node/add/page', 'node/add/page', 'Page', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 106, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 107, 11, 'node/add/story', 'node/add/story', 'Story', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 107, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 119, 114, 'admin/build', 'admin/build', 'Site building', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:38:"Control how your site looks and feels.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 114, 119, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 118, 114, 'admin/reports', 'admin/reports', 'Reports', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:59:"View reports from system logs and other status information.";}}', 'system', 0, 0, 1, 0, 5, 2, 0, 114, 118, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 117, 114, 'admin/help', 'admin/help', 'Help', 'a:0:{}', 'system', 0, 0, 0, 0, 9, 2, 0, 114, 117, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 116, 114, 'admin/content', 'admin/content', 'Content management', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:27:"Manage your site''s content.";}}', 'system', 0, 0, 1, 0, -10, 2, 0, 114, 116, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 114, 0, 'admin', 'admin', 'Administer', 'a:0:{}', 'system', 0, 0, 1, 0, 9, 1, 0, 114, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 115, 114, 'admin/compact', 'admin/compact', 'Compact mode', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 114, 115, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 192, 148, 'admin/content/taxonomy/edit/term', 'admin/content/taxonomy/edit/term', 'Edit term', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 116, 148, 192, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 193, 126, 'admin/build/block/list/js', 'admin/build/block/list/js', 'JavaScript List Form', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 119, 126, 193, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 194, 138, 'admin/build/modules/list/confirm', 'admin/build/modules/list/confirm', 'List', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 119, 138, 194, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 195, 138, 'admin/build/modules/uninstall/confirm', 'admin/build/modules/uninstall/confirm', 'Uninstall', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 119, 138, 195, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 196, 137, 'admin/build/menu/item/%/delete', 'admin/build/menu/item/%/delete', 'Delete menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 119, 137, 196, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 197, 137, 'admin/build/menu/item/%/edit', 'admin/build/menu/item/%/edit', 'Edit menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 119, 137, 197, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 198, 148, 'admin/content/taxonomy/edit/vocabulary/%', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 116, 148, 198, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 199, 137, 'admin/build/menu/item/%/reset', 'admin/build/menu/item/%/reset', 'Reset menu item', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 119, 137, 199, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 200, 0, 'upload/js', 'upload/js', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 200, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 201, 120, 'admin/settings/uploads', 'admin/settings/uploads', 'File uploads', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:45:"Control how files may be attached to content.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 201, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 202, 119, 'admin/build/path', 'admin/build/path', 'URL aliases', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:46:"Change your site''s URL paths by aliasing them.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 119, 202, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 203, 117, 'admin/help/path', 'admin/help/path', 'path', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 203, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 204, 117, 'admin/help/pathauto', 'admin/help/pathauto', 'pathauto', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 204, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 205, 117, 'admin/help/token', 'admin/help/token', 'token', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 205, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 206, 117, 'admin/help/upload', 'admin/help/upload', 'upload', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 206, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 207, 202, 'admin/build/path/delete', 'admin/build/path/delete', 'Delete alias', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 119, 202, 207, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 208, 202, 'admin/build/path/edit', 'admin/build/path/edit', 'Edit alias', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 119, 202, 208, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 209, 0, 'blog', 'blog', 'Blogs', 'a:0:{}', 'system', 0, 0, 1, 1, 0, 1, 1, 209, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 210, 0, 'book', 'book', 'Books', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 1, 210, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 211, 0, 'contact', 'contact', 'Contact', 'a:0:{}', 'system', 1, 0, 0, 0, 0, 1, 1, 211, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 212, 0, 'aggregator', 'aggregator', 'Feed aggregator', 'a:0:{}', 'system', 0, 0, 0, 1, 5, 1, 1, 212, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 213, 0, 'forum', 'forum', 'Forums', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 1, 213, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 214, 0, 'search', 'search', 'Search', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 1, 1, 214, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 215, 209, 'blog/feed', 'blog/feed', 'Blogs', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 2, 0, 209, 215, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 217, 209, 'blog/%', 'blog/%', 'My blog', 'a:0:{}', 'system', 0, 0, 0, 0, 0, 2, 0, 209, 217, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 219, 0, 'blogapi/rsd', 'blogapi/rsd', 'RSD', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 219, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 225, 118, 'admin/reports/settings', 'admin/reports/settings', 'Access log settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:50:"Control details about what and how your site logs.";}}', 'system', 0, 0, 0, 0, 3, 3, 0, 114, 118, 225, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 226, 120, 'admin/settings/blogapi', 'admin/settings/blogapi', 'Blog API', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:67:"Configure the content types available to external blogging clients.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 226, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 227, 11, 'node/add/blog', 'node/add/blog', 'Blog entry', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:78:"A <em>blog entry</em> is a single post to an online journal, or <em>blog</em>.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 227, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 228, 217, 'blog/%/feed', 'blog/%/feed', 'Blogs', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 209, 217, 228, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 229, 11, 'node/add/book', 'node/add/book', 'Book page', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:283:"A <em>book page</em> is a page of content, organized into a collection of related entries collectively known as a <em>book</em>. A <em>book page</em> automatically displays links to adjacent pages, providing a simple navigation system for organizing and reviewing structured content.";}}', 'system', 1, 0, 0, 0, 0, 2, 1, 11, 229, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 231, 119, 'admin/build/contact', 'admin/build/contact', 'Contact form', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:71:"Create a system contact form and set up categories for the form to use.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 119, 231, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('navigation', 233, 11, 'node/add/forum', 'node/add/forum', 'Forum topic', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:85:"A <em>forum topic</em> is the initial post to a new discussion thread within a forum.";}}', 'system', 0, 0, 0, 0, 0, 2, 0, 11, 233, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 234, 116, 'admin/content/forum', 'admin/content/forum', 'Forums', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:61:"Control forums and their hierarchy and change forum settings.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 116, 234, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 235, 118, 'admin/reports/hits', 'admin/reports/hits', 'Recent hits', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:43:"View pages that have recently been visited.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 118, 235, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 236, 120, 'admin/settings/search', 'admin/settings/search', 'Search settings', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:66:"Configure relevance settings for search and other indexing options";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 120, 236, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 237, 118, 'admin/reports/pages', 'admin/reports/pages', 'Top pages', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:41:"View pages that have been hit frequently.";}}', 'system', 0, 0, 0, 0, 1, 3, 0, 114, 118, 237, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 238, 118, 'admin/reports/referrers', 'admin/reports/referrers', 'Top referrers', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:19:"View top referrers.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 118, 238, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 239, 118, 'admin/reports/search', 'admin/reports/search', 'Top search phrases', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:33:"View most popular search phrases.";}}', 'system', 0, 0, 0, 0, 0, 3, 0, 114, 118, 239, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 240, 118, 'admin/reports/visitors', 'admin/reports/visitors', 'Top visitors', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:34:"View visitors that hit many pages.";}}', 'system', 0, 0, 0, 0, 2, 3, 0, 114, 118, 240, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 242, 117, 'admin/help/blog', 'admin/help/blog', 'blog', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 242, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 243, 117, 'admin/help/blogapi', 'admin/help/blogapi', 'blogapi', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 243, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 245, 117, 'admin/help/contact', 'admin/help/contact', 'contact', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 245, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 246, 117, 'admin/help/forum', 'admin/help/forum', 'forum', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 246, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 247, 117, 'admin/help/search', 'admin/help/search', 'search', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 247, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 248, 117, 'admin/help/statistics', 'admin/help/statistics', 'statistics', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 248, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 249, 117, 'admin/help/syslog', 'admin/help/syslog', 'syslog', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 117, 249, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 251, 116, 'admin/content/node-type/blog', 'admin/content/node-type/blog', 'Blog entry', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 116, 251, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 252, 116, 'admin/content/node-type/book', 'admin/content/node-type/book', 'Book page', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 116, 252, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 253, 236, 'admin/settings/search/wipe', 'admin/settings/search/wipe', 'Clear index', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 120, 236, 253, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 254, 118, 'admin/reports/access/%', 'admin/reports/access/%', 'Details', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:16:"View access log.";}}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 118, 254, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 255, 116, 'admin/content/node-type/forum', 'admin/content/node-type/forum', 'Forum topic', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 3, 0, 114, 116, 255, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 258, 136, 'admin/settings/logging/syslog', 'admin/settings/logging/syslog', 'Syslog', 'a:1:{s:10:"attributes";a:1:{s:5:"title";s:262:"Settings for syslog logging. Syslog is an operating system administrative logging tool used in systems management and security auditing. Most suited to medium and large sites, syslog provides filtering tools that allow messages to be routed by type and severity.";}}', 'system', 0, 0, 0, 0, 0, 4, 0, 114, 120, 136, 258, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 259, 0, 'admin/content/node-type/book/delete', 'admin/content/node-type/book/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 259, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 260, 0, 'admin/content/node-type/blog/delete', 'admin/content/node-type/blog/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 260, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 261, 0, 'admin/content/node-type/forum/delete', 'admin/content/node-type/forum/delete', 'Delete', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 1, 0, 261, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 262, 231, 'admin/build/contact/delete/%', 'admin/build/contact/delete/%', 'Delete contact', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 119, 231, 262, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 263, 231, 'admin/build/contact/edit/%', 'admin/build/contact/edit/%', 'Edit contact category', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 119, 231, 263, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 264, 234, 'admin/content/forum/edit/%', 'admin/content/forum/edit/%', '', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 116, 234, 264, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 268, 234, 'admin/content/forum/edit/container/%', 'admin/content/forum/edit/container/%', 'Edit container', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 116, 234, 268, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_menu_links` (`menu_name`, `mlid`, `plid`, `link_path`, `router_path`, `link_title`, `options`, `module`, `hidden`, `external`, `has_children`, `expanded`, `weight`, `depth`, `customized`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `updated`) VALUES('admin', 270, 234, 'admin/content/forum/edit/forum/%', 'admin/content/forum/edit/forum/%', 'Edit forum', 'a:0:{}', 'system', -1, 0, 0, 0, 0, 4, 0, 114, 116, 234, 270, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_menu_router`
--

CREATE TABLE IF NOT EXISTS `#__dos_menu_router` (
  `path` varchar(255) NOT NULL default '',
  `load_functions` text NOT NULL,
  `to_arg_functions` text NOT NULL,
  `access_callback` varchar(255) NOT NULL default '',
  `access_arguments` text,
  `page_callback` varchar(255) NOT NULL default '',
  `page_arguments` text,
  `fit` int(11) NOT NULL default '0',
  `number_parts` smallint(6) NOT NULL default '0',
  `tab_parent` varchar(255) NOT NULL default '',
  `tab_root` varchar(255) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `title_callback` varchar(255) NOT NULL default '',
  `title_arguments` varchar(255) NOT NULL default '',
  `type` int(11) NOT NULL default '0',
  `block_callback` varchar(255) NOT NULL default '',
  `description` text NOT NULL,
  `position` varchar(255) NOT NULL default '',
  `weight` int(11) NOT NULL default '0',
  `file` mediumtext,
  PRIMARY KEY  (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_menu_router`
--

INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_page_default', 'a:0:{}', 1, 1, '', 'node', 'Content', 't', '', 4, '', '', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('rss.xml', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'node_feed', 'a:0:{}', 1, 1, '', 'rss.xml', 'RSS feed', 't', '', 4, '', '', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('blog', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'blog_page_last', 'a:0:{}', 1, 1, '', 'blog', 'Blogs', 't', '', 20, '', '', '', 0, 'modules/blog/blog.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('contact', '', '', 'user_access', 'a:1:{i:0;s:29:"access site-wide contact form";}', 'contact_site_page', 'a:0:{}', 1, 1, '', 'contact', 'Contact', 't', '', 20, '', '', '', 0, 'modules/contact/contact.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('forum', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'forum_page', 'a:0:{}', 1, 1, '', 'forum', 'Forums', 't', '', 20, '', '', '', 0, 'modules/forum/forum.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('logout', '', '', 'user_is_logged_in', 'a:0:{}', 'user_logout', 'a:0:{}', 1, 1, '', 'logout', 'Log out', 't', '', 6, '', '', '', 10, 'modules/user/user.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('search', '', '', 'user_access', 'a:1:{i:0;s:14:"search content";}', 'search_view', 'a:0:{}', 1, 1, '', 'search', 'Search', 't', '', 20, '', '', '', 0, 'modules/search/search.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('batch', '', '', '1', 'a:0:{}', 'system_batch_page', 'a:0:{}', 1, 1, '', 'batch', '', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user', '', '', '1', 'a:0:{}', 'user_page', 'a:0:{}', 1, 1, '', 'user', 'User account', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 1, 1, '', 'admin', 'Administer', 't', '', 6, '', '', '', 9, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user/login', '', '', 'user_is_anonymous', 'a:0:{}', 'user_page', 'a:0:{}', 3, 2, 'user', 'user', 'Log in', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('upload/js', '', '', 'user_access', 'a:1:{i:0;s:12:"upload files";}', 'upload_js', 'a:0:{}', 3, 2, '', 'upload/js', '', 't', '', 4, '', '', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('blogapi/rsd', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'blogapi_rsd', 'a:0:{}', 3, 2, '', 'blogapi/rsd', 'RSD', 't', '', 4, '', '', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('taxonomy/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_autocomplete', 'a:0:{}', 3, 2, '', 'taxonomy/autocomplete', 'Autocomplete taxonomy', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('blog/feed', '', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'blog_feed_last', 'a:0:{}', 3, 2, '', 'blog/feed', 'Blogs', 't', '', 4, '', '', '', 0, 'modules/blog/blog.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/by-module', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_by_module', 'a:0:{}', 3, 2, 'admin', 'admin', 'By module', 't', '', 128, '', '', '', 2, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/by-task', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_main_admin_page', 'a:0:{}', 3, 2, 'admin', 'admin', 'By task', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('filter/tips', '', '', '1', 'a:0:{}', 'filter_tips_long', 'a:0:{}', 3, 2, '', 'filter/tips', 'Compose tips', 't', '', 20, '', '', '', 0, 'modules/filter/filter.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/add', '', '', '_node_add_access', 'a:0:{}', 'node_add_page', 'a:0:{}', 3, 2, '', 'node/add', 'Create content', 't', '', 6, '', '', '', 1, 'modules/node/node.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('comment/delete', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_delete', 'a:0:{}', 3, 2, '', 'comment/delete', 'Delete comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('comment/edit', '', '', 'user_access', 'a:1:{i:0;s:13:"post comments";}', 'comment_edit', 'a:0:{}', 3, 2, '', 'comment/edit', 'Edit comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('system/files', '', '', '1', 'a:1:{i:0;s:19:"view uploaded files";}', 'file_download', 'a:0:{}', 3, 2, '', 'system/files', 'File download', 't', '', 4, '', '', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/compact', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'system_admin_compact_page', 'a:0:{}', 3, 2, '', 'admin/compact', 'Compact mode', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user/register', '', '', 'user_register_access', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:13:"user_register";}', 3, 2, 'user', 'user', 'Create new account', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_main', 'a:0:{}', 3, 2, '', 'admin/help', 'Help', 't', '', 6, '', '', '', 9, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user/password', '', '', 'user_is_anonymous', 'a:0:{}', 'drupal_get_form', 'a:1:{i:0;s:9:"user_pass";}', 3, 2, 'user', 'user', 'Request new password', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user/autocomplete', '', '', 'user_access', 'a:1:{i:0;s:20:"access user profiles";}', 'user_autocomplete', 'a:0:{}', 3, 2, '', 'user/autocomplete', 'User autocomplete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('blog/%', 'a:1:{i:1;s:22:"user_uid_optional_load";}', 'a:1:{i:1;s:24:"user_uid_optional_to_arg";}', 'blog_page_user_access', 'a:1:{i:0;i:1;}', 'blog_page_user', 'a:1:{i:0;i:1;}', 2, 2, '', 'blog/%', 'My blog', 't', '', 6, '', '', '', 0, 'modules/blog/blog.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/%', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'node/%', '', 'node_page_title', 'a:1:{i:0;i:1;}', 4, '', '', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/reports', 'Reports', 't', '', 6, '', 'View reports from system logs and other status information.', 'left', 5, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content', '', '', 'admin_landing_page_access', 'a:1:{i:0;s:13:"admin/content";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/content', 'Content management', 't', '', 6, '', 'Manage your site''s content.', 'left', -10, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build', '', '', 'admin_landing_page_access', 'a:1:{i:0;s:11:"admin/build";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/build', 'Site building', 't', '', 6, '', 'Control how your site looks and feels.', 'right', -10, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings', '', '', 'admin_landing_page_access', 'a:1:{i:0;s:14:"admin/settings";}', 'system_settings_overview', 'a:0:{}', 3, 2, '', 'admin/settings', 'Site configuration', 't', '', 6, '', 'Adjust basic site configuration options.', 'right', -5, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user/%', 'a:1:{i:1;s:22:"user_uid_optional_load";}', 'a:1:{i:1;s:24:"user_uid_optional_to_arg";}', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 2, 2, '', 'user/%', 'My account', 'user_page_title', 'a:1:{i:0;i:1;}', 6, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user', '', '', 'admin_landing_page_access', 'a:1:{i:0;s:10:"admin/user";}', 'system_admin_menu_block_page', 'a:0:{}', 3, 2, '', 'admin/user', 'User management', 't', '', 6, '', 'Manage your site''s users, groups and access to site features.', 'left', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/%/view', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:1;}', 'node_page_view', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'View', 't', '', 136, '', '', '', -10, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user/%/view', 'a:1:{i:1;s:9:"user_load";}', '', 'user_view_access', 'a:1:{i:0;i:1;}', 'user_view', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'View', 't', '', 136, '', '', '', -10, 'modules/user/user.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/actions', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 7, 3, '', 'admin/settings/actions', 'Actions', 't', '', 6, '', 'Manage the actions defined for your site.', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('taxonomy/term/%', 'a:1:{i:2;N;}', '', 'user_access', 'a:1:{i:0;s:14:"access content";}', 'taxonomy_term_page', 'a:1:{i:0;i:2;}', 6, 3, '', 'taxonomy/term/%', 'Taxonomy term', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/%/track', 'a:1:{i:1;s:9:"node_load";}', '', 'user_access', 'a:1:{i:0;s:17:"access statistics";}', 'statistics_node_tracker', 'a:0:{}', 5, 3, 'node/%', 'node/%', 'Track', 't', '', 128, '', '', '', 2, 'modules/statistics/statistics.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/rules', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 7, 3, '', 'admin/user/rules', 'Access rules', 't', '', 6, '', 'List and create rules to disallow usernames, e-mail addresses, and IP addresses.', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/updates', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', 7, 3, '', 'admin/reports/updates', 'Available updates', 't', '', 6, '', 'Get a status report about available updates for your installed modules and themes.', '', 10, 'modules/update/update.report.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/block', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 7, 3, '', 'admin/build/block', 'Blocks', 't', '', 6, '', 'Configure what block content appears in your site''s sidebars and other regions.', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/blogapi', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:22:"blogapi_admin_settings";}', 7, 3, '', 'admin/settings/blogapi', 'Blog API', 't', '', 6, '', 'Configure the content types available to external blogging clients.', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('blog/%/feed', 'a:1:{i:1;s:9:"user_load";}', '', 'blog_page_user_access', 'a:1:{i:0;i:1;}', 'blog_feed_user', 'a:1:{i:0;i:1;}', 5, 3, '', 'blog/%/feed', 'Blogs', 't', '', 4, '', '', '', 0, 'modules/blog/blog.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/comment', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 7, 3, '', 'admin/content/comment', 'Comments', 't', '', 6, '', 'List and edit site comments and the comment moderation queue.', '', 0, 'modules/comment/comment.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user/%/contact', 'a:1:{i:1;s:9:"user_load";}', '', '_contact_user_tab_access', 'a:1:{i:0;i:1;}', 'contact_user_page', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'Contact', 't', '', 128, '', '', '', 2, 'modules/contact/contact.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/contact', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'contact_admin_categories', 'a:0:{}', 7, 3, '', 'admin/build/contact', 'Contact form', 't', '', 6, '', 'Create a system contact form and set up categories for the form to use.', '', 0, 'modules/contact/contact.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/types', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'node_overview_types', 'a:0:{}', 7, 3, '', 'admin/content/types', 'Content types', 't', '', 6, '', 'Manage posts by content type, including default status, front page promotion, etc.', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/%/delete', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"delete";i:1;i:1;}', 'drupal_get_form', 'a:2:{i:0;s:19:"node_delete_confirm";i:1;i:1;}', 5, 3, '', 'node/%/delete', 'Delete', 't', '', 4, '', '', '', 1, 'modules/node/node.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user/%/delete', 'a:1:{i:1;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:2:{i:0;s:19:"user_confirm_delete";i:1;i:1;}', 5, 3, '', 'user/%/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/%/edit', 'a:1:{i:1;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:6:"update";i:1;i:1;}', 'node_page_edit', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Edit', 't', '', 128, '', '', '', 1, 'modules/node/node.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/logging', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_logging_overview', 'a:0:{}', 7, 3, '', 'admin/settings/logging', 'Logging and alerts', 't', '', 6, '', 'Settings for logging and alerts modules. Various modules can route Drupal''s system events to different destination, such as syslog, database, email, ...etc.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/hits', '', '', 'user_access', 'a:1:{i:0;s:17:"access statistics";}', 'statistics_recent_hits', 'a:0:{}', 7, 3, '', 'admin/reports/hits', 'Recent hits', 't', '', 6, '', 'View pages that have recently been visited.', '', 0, 'modules/statistics/statistics.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/dblog', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_overview', 'a:0:{}', 7, 3, '', 'admin/reports/dblog', 'Recent log entries', 't', '', 6, '', 'View events that have recently been logged.', '', -1, 'modules/dblog/dblog.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('comment/reply/%', 'a:1:{i:2;s:9:"node_load";}', '', 'node_access', 'a:2:{i:0;s:4:"view";i:1;i:2;}', 'comment_reply', 'a:1:{i:0;i:2;}', 6, 3, '', 'comment/reply/%', 'Reply to comment', 't', '', 4, '', '', '', 0, 'modules/comment/comment.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/%/revisions', 'a:1:{i:1;s:9:"node_load";}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_revision_overview', 'a:1:{i:0;i:1;}', 5, 3, 'node/%', 'node/%', 'Revisions', 't', '', 128, '', '', '', 2, 'modules/node/node.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/status', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_status', 'a:0:{}', 7, 3, '', 'admin/reports/status', 'Status report', 't', '', 6, '', 'Get a status report about your site''s operation and any detected problems.', '', 10, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/pages', '', '', 'user_access', 'a:1:{i:0;s:17:"access statistics";}', 'statistics_top_pages', 'a:0:{}', 7, 3, '', 'admin/reports/pages', 'Top pages', 't', '', 6, '', 'View pages that have been hit frequently.', '', 1, 'modules/statistics/statistics.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/referrers', '', '', 'user_access', 'a:1:{i:0;s:17:"access statistics";}', 'statistics_top_referrers', 'a:0:{}', 7, 3, '', 'admin/reports/referrers', 'Top referrers', 't', '', 6, '', 'View top referrers.', '', 0, 'modules/statistics/statistics.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/visitors', '', '', 'user_access', 'a:1:{i:0;s:17:"access statistics";}', 'statistics_top_visitors', 'a:0:{}', 7, 3, '', 'admin/reports/visitors', 'Top visitors', 't', '', 6, '', 'View visitors that hit many pages.', '', 2, 'modules/statistics/statistics.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/path', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_overview', 'a:0:{}', 7, 3, '', 'admin/build/path', 'URL aliases', 't', '', 6, '', 'Change your site''s URL paths by aliasing them.', '', 0, 'modules/path/path.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/block', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/block', 'block', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/blog', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/blog', 'blog', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/blogapi', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/blogapi', 'blogapi', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/color', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/color', 'color', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/comment', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/comment', 'comment', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/contact', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/contact', 'contact', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/dblog', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/dblog', 'dblog', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/filter', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/filter', 'filter', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/forum', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/forum', 'forum', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/help', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/help', 'help', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/menu', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/menu', 'menu', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/node', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/node', 'node', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/path', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/path', 'path', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/pathauto', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/pathauto', 'pathauto', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/search', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/search', 'search', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/statistics', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/statistics', 'statistics', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/syslog', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/syslog', 'syslog', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/system', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/system', 'system', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/taxonomy', 'taxonomy', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/token', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/token', 'token', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/update', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/update', 'update', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/upload', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/upload', 'upload', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/help/user', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'help_page', 'a:1:{i:0;i:2;}', 7, 3, '', 'admin/help/user', 'user', 't', '', 4, '', '', '', 0, 'modules/help/help.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:34:"statistics_access_logging_settings";}', 7, 3, '', 'admin/reports/settings', 'Access log settings', 't', '', 6, '', 'Control details about what and how your site logs.', '', 3, 'modules/statistics/statistics.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/clean-urls', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_clean_url_settings";}', 7, 3, '', 'admin/settings/clean-urls', 'Clean URLs', 't', '', 6, '', 'Enable or disable clean URLs for your site.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 7, 3, '', 'admin/content/node', 'Content', 't', '', 6, '', 'View, edit, and delete your site''s content.', '', 0, 'modules/node/node.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/date-time', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_date_time_settings";}', 7, 3, '', 'admin/settings/date-time', 'Date and time', 't', '', 6, '', 'Settings for how Drupal displays date and time, as well as the system''s default timezone.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user/%/edit', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 5, 3, 'user/%', 'user/%', 'Edit', 't', '', 128, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/error-reporting', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:31:"system_error_reporting_settings";}', 7, 3, '', 'admin/settings/error-reporting', 'Error reporting', 't', '', 6, '', 'Control how Drupal deals with errors including 403/404 errors as well as PHP error reporting.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/file-system', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_file_system_settings";}', 7, 3, '', 'admin/settings/file-system', 'File system', 't', '', 6, '', 'Tell Drupal where to store uploaded files and how they are accessed.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/uploads', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"upload_admin_settings";}', 7, 3, '', 'admin/settings/uploads', 'File uploads', 't', '', 6, '', 'Control how files may be attached to content.', '', 0, 'modules/upload/upload.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/forum', '', '', 'user_access', 'a:1:{i:0;s:17:"administer forums";}', 'drupal_get_form', 'a:1:{i:0;s:14:"forum_overview";}', 7, 3, '', 'admin/content/forum', 'Forums', 't', '', 6, '', 'Control forums and their hierarchy and change forum settings.', '', 0, 'modules/forum/forum.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/image-toolkit', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:29:"system_image_toolkit_settings";}', 7, 3, '', 'admin/settings/image-toolkit', 'Image toolkit', 't', '', 6, '', 'Choose which image toolkit to use if you have installed optional toolkits.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/filters', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 7, 3, '', 'admin/settings/filters', 'Input formats', 't', '', 6, '', 'Configure how content input by users is filtered, including allowed HTML tags. Also allows enabling of module-provided filters.', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/menu', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 7, 3, '', 'admin/build/menu', 'Menus', 't', '', 6, '', 'Control your site''s navigation menu, primary links and secondary links. as well as rename and reorganize menu items.', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/modules', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 7, 3, '', 'admin/build/modules', 'Modules', 't', '', 6, '', 'Enable or disable add-on modules for your site.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/performance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_performance_settings";}', 7, 3, '', 'admin/settings/performance', 'Performance', 't', '', 6, '', 'Enable or disable page caching for anonymous users and set CSS and JS bandwidth optimization options.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/permissions', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_perm";}', 7, 3, '', 'admin/user/permissions', 'Permissions', 't', '', 6, '', 'Determine access to features by selecting permissions for roles.', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_configure";}', 7, 3, '', 'admin/content/node-settings', 'Post settings', 't', '', 6, '', 'Control posting behavior, such as teaser length, requiring previews before posting, and the number of posts on the front page.', '', 0, 'modules/node/node.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/rss-publishing', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:25:"system_rss_feeds_settings";}', 7, 3, '', 'admin/content/rss-publishing', 'RSS publishing', 't', '', 6, '', 'Configure the number of items per feed and whether feeds should be titles/teasers/full-text.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/roles', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_new_role";}', 7, 3, '', 'admin/user/roles', 'Roles', 't', '', 6, '', 'List, edit, or add user roles.', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/search', '', '', 'user_access', 'a:1:{i:0;s:17:"administer search";}', 'drupal_get_form', 'a:1:{i:0;s:21:"search_admin_settings";}', 7, 3, '', 'admin/settings/search', 'Search settings', 't', '', 6, '', 'Configure relevance settings for search and other indexing options', '', 0, 'modules/search/search.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/site-information', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_information_settings";}', 7, 3, '', 'admin/settings/site-information', 'Site information', 't', '', 6, '', 'Change basic site information, such as the site name, slogan, e-mail address, mission, front page and more.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/site-maintenance', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:32:"system_site_maintenance_settings";}', 7, 3, '', 'admin/settings/site-maintenance', 'Site maintenance', 't', '', 6, '', 'Take the site off-line for maintenance or bring it back online.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/taxonomy', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 7, 3, '', 'admin/content/taxonomy', 'Taxonomy', 't', '', 6, '', 'Manage tagging, categorization, and classification of your content.', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/themes', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 7, 3, '', 'admin/build/themes', 'Themes', 't', '', 6, '', 'Change which theme your site uses or allows users to set.', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/access-denied', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:13:"access denied";}', 7, 3, '', 'admin/reports/access-denied', 'Top ''access denied'' errors', 't', '', 6, '', 'View ''access denied'' errors (403s).', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/page-not-found', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:14:"page not found";}', 7, 3, '', 'admin/reports/page-not-found', 'Top ''page not found'' errors', 't', '', 6, '', 'View ''page not found'' errors (404s).', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/settings', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'drupal_get_form', 'a:1:{i:0;s:19:"user_admin_settings";}', 7, 3, '', 'admin/user/settings', 'User settings', 't', '', 6, '', 'Configure default behavior of users, including registration requirements, e-mails, and user pictures.', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/user', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 7, 3, '', 'admin/user/user', 'Users', 't', '', 6, '', 'List, add, and edit users.', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/admin', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:19:"admin_settings_form";}', 7, 3, '', 'admin/settings/admin', 'Administration tools', 't', '', 6, '', 'Settings for site administration tools.', '', 0, 'modules/admin/admin.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/add/blog', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:4:"blog";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/blog', 'Blog entry', 'check_plain', '', 6, '', 'A <em>blog entry</em> is a single post to an online journal, or <em>blog</em>.', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/add/book', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:4:"book";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/book', 'Book page', 'check_plain', '', 6, '', 'A <em>book page</em> is a page of content, organized into a collection of related entries collectively known as a <em>book</em>. A <em>book page</em> automatically displays links to adjacent pages, providing a simple navigation system for organizing and reviewing structured content.', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/add/forum', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:5:"forum";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/forum', 'Forum topic', 'check_plain', '', 6, '', 'A <em>forum topic</em> is the initial post to a new discussion thread within a forum.', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/add/page', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:4:"page";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/page', 'Page', 'check_plain', '', 6, '', 'A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/add/story', '', '', 'node_access', 'a:2:{i:0;s:6:"create";i:1;s:5:"story";}', 'node_add', 'a:1:{i:0;i:2;}', 7, 3, '', 'node/add/story', 'Story', 'check_plain', '', 6, '', 'A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/search', '', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_top', 'a:1:{i:0;s:6:"search";}', 7, 3, '', 'admin/reports/search', 'Top search phrases', 't', '', 6, '', 'View most popular search phrases.', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('search/node/%', 'a:1:{i:2;N;}', 'a:1:{i:2;s:16:"menu_tail_to_arg";}', '_search_menu', 'a:1:{i:0;s:4:"node";}', 'search_view', 'a:1:{i:0;s:4:"node";}', 6, 3, 'search', 'search', '', 'module_invoke', 'a:4:{i:0;s:4:"node";i:1;s:6:"search";i:2;s:4:"name";i:3;b:1;}', 128, '', '', '', 0, 'modules/search/search.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('search/user/%', 'a:1:{i:2;N;}', 'a:1:{i:2;s:16:"menu_tail_to_arg";}', '_search_menu', 'a:1:{i:0;s:4:"user";}', 'search_view', 'a:1:{i:0;s:4:"user";}', 6, 3, 'search', 'search', '', 'module_invoke', 'a:4:{i:0;s:4:"user";i:1;s:6:"search";i:2;s:4:"name";i:3;b:1;}', 128, '', '', '', 0, 'modules/search/search.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/block/list', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display', 'a:0:{}', 15, 4, 'admin/build/block', 'admin/build/block', 'List', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/forum/list', '', '', 'user_access', 'a:1:{i:0;s:17:"administer forums";}', 'drupal_get_form', 'a:1:{i:0;s:14:"forum_overview";}', 15, 4, 'admin/content/forum', 'admin/content/forum', 'List', 't', '', 136, '', '', '', -10, 'modules/forum/forum.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node/overview', '', '', 'user_access', 'a:1:{i:0;s:16:"administer nodes";}', 'drupal_get_form', 'a:1:{i:0;s:18:"node_admin_content";}', 15, 4, 'admin/content/node', 'admin/content/node', 'List', 't', '', 136, '', '', '', -10, 'modules/node/node.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/types/list', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'node_overview_types', 'a:0:{}', 15, 4, 'admin/content/types', 'admin/content/types', 'List', 't', '', 136, '', '', '', -10, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/path/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_overview', 'a:0:{}', 15, 4, 'admin/build/path', 'admin/build/path', 'List', 't', '', 136, '', '', '', -10, 'modules/path/path.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/modules/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'List', 't', '', 136, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/taxonomy/list', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:30:"taxonomy_overview_vocabularies";}', 15, 4, 'admin/content/taxonomy', 'admin/content/taxonomy', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/rules/list', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/user/list', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:4:"list";}', 15, 4, 'admin/user/user', 'admin/user/user', 'List', 't', '', 136, '', '', '', -10, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/filters/list', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:21:"filter_admin_overview";}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'List', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/comment/new', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:0:{}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Published comments', 't', '', 136, '', '', '', -10, 'modules/comment/comment.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user/%/edit/account', 'a:1:{i:1;a:1:{s:18:"user_category_load";a:2:{i:0;s:4:"%map";i:1;s:6:"%index";}}}', '', 'user_edit_access', 'a:1:{i:0;i:1;}', 'user_edit', 'a:1:{i:0;i:1;}', 11, 4, 'user/%/edit', 'user/%', 'Account', 't', '', 136, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/themes/select', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:2:{i:0;s:18:"system_themes_form";i:1;N;}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'List', 't', '', 136, '', 'Select the default theme.', '', -1, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/menu/list', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_overview_page', 'a:0:{}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'List menus', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/themes/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 15, 4, 'admin/build/themes', 'admin/build/themes', 'Configure', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/contact/list', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'contact_admin_categories', 'a:0:{}', 15, 4, 'admin/build/contact', 'admin/build/contact', 'List', 't', '', 136, '', '', '', 0, 'modules/contact/contact.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/actions/manage', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_manage', 'a:0:{}', 15, 4, 'admin/settings/actions', 'admin/settings/actions', 'Manage actions', 't', '', 136, '', 'Manage the actions defined for your site.', '', -2, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/modules/uninstall', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 15, 4, 'admin/build/modules', 'admin/build/modules', 'Uninstall', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/path/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_edit', 'a:0:{}', 15, 4, 'admin/build/path', 'admin/build/path', 'Add alias', 't', '', 128, '', '', '', 0, 'modules/path/path.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/filters/add', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:0:{}', 15, 4, 'admin/settings/filters', 'admin/settings/filters', 'Add input format', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/rules/add', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_add', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Add rule', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/user/create', '', '', 'user_access', 'a:1:{i:0;s:16:"administer users";}', 'user_admin', 'a:1:{i:0;s:6:"create";}', 15, 4, 'admin/user/user', 'admin/user/user', 'Add user', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/comment/approval', '', '', 'user_access', 'a:1:{i:0;s:19:"administer comments";}', 'comment_admin', 'a:1:{i:0;s:8:"approval";}', 15, 4, 'admin/content/comment', 'admin/content/comment', 'Approval queue', 't', '', 128, '', '', '', 0, 'modules/comment/comment.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/rules/check', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_check', 'a:0:{}', 15, 4, 'admin/user/rules', 'admin/user/rules', 'Check rules', 't', '', 128, '', '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/updates/list', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_status', 'a:0:{}', 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'List', 't', '', 136, '', '', '', 0, 'modules/update/update.report.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/actions/orphan', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'system_actions_remove_orphans', 'a:0:{}', 15, 4, '', 'admin/settings/actions/orphan', 'Remove orphans', 't', '', 4, '', '', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/block/add', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:20:"block_add_block_form";}', 15, 4, 'admin/build/block', 'admin/build/block', 'Add block', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/contact/add', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:2:{i:0;s:18:"contact_admin_edit";i:1;i:3;}', 15, 4, 'admin/build/contact', 'admin/build/contact', 'Add category', 't', '', 128, '', '', '', 1, 'modules/contact/contact.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/types/add', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:1:{i:0;s:14:"node_type_form";}', 15, 4, 'admin/content/types', 'admin/content/types', 'Add content type', 't', '', 128, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/menu/add', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:14:"menu_edit_menu";i:1;s:3:"add";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Add menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/path/pathauto', '', '', 'user_access', 'a:1:{i:0;s:19:"administer pathauto";}', 'drupal_get_form', 'a:1:{i:0;s:23:"pathauto_admin_settings";}', 15, 4, 'admin/build/path', 'admin/build/path', 'Automated alias settings', 't', '', 128, '', '', '', 10, 'modules/pathauto/pathauto.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/clean-urls/check', '', '', '1', 'a:0:{}', 'drupal_json', 'a:1:{i:0;a:1:{s:6:"status";b:1;}}', 15, 4, '', 'admin/settings/clean-urls/check', 'Clean URL check', 't', '', 4, '', '', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/actions/configure', '', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_actions_configure";}', 15, 4, '', 'admin/settings/actions/configure', 'Configure an advanced action', 't', '', 4, '', '', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/date-time/lookup', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_date_time_lookup', 'a:0:{}', 15, 4, '', 'admin/settings/date-time/lookup', 'Date and time lookup', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/path/delete_bulk', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'drupal_get_form', 'a:1:{i:0;s:21:"pathauto_admin_delete";}', 15, 4, 'admin/build/path', 'admin/build/path', 'Delete aliases', 't', '', 128, '', '', '', 30, 'modules/pathauto/pathauto.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/path/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'path_admin_edit', 'a:0:{}', 15, 4, '', 'admin/build/path/edit', 'Edit alias', 't', '', 4, '', '', '', 0, 'modules/path/path.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/roles/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:15:"user_admin_role";}', 15, 4, '', 'admin/user/roles/edit', 'Edit role', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/rules/edit', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'user_admin_access_edit', 'a:0:{}', 15, 4, '', 'admin/user/rules/edit', 'Edit rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/updates/check', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'update_manual_status', 'a:0:{}', 15, 4, '', 'admin/reports/updates/check', 'Manual update check', 't', '', 4, '', '', '', 0, 'modules/update/update.fetch.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/status/php', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_php', 'a:0:{}', 15, 4, '', 'admin/reports/status/php', 'PHP', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-settings/rebuild', '', '', 'user_access', 'a:1:{i:0;s:27:"access administration pages";}', 'drupal_get_form', 'a:1:{i:0;s:30:"node_configure_rebuild_confirm";}', 15, 4, '', 'admin/content/node-settings/rebuild', 'Rebuild permissions', 't', '', 4, '', '', '', 0, 'modules/node/node.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/status/run-cron', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_run_cron', 'a:0:{}', 15, 4, '', 'admin/reports/status/run-cron', 'Run cron', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/status/sql', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'system_sql', 'a:0:{}', 15, 4, '', 'admin/reports/status/sql', 'SQL', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/contact/settings', '', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:1:{i:0;s:22:"contact_admin_settings";}', 15, 4, 'admin/build/contact', 'admin/build/contact', 'Settings', 't', '', 128, '', '', '', 2, 'modules/contact/contact.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/menu/settings', '', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:1:{i:0;s:14:"menu_configure";}', 15, 4, 'admin/build/menu', 'admin/build/menu', 'Settings', 't', '', 128, '', '', '', 5, 'modules/menu/menu.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/updates/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:15:"update_settings";}', 15, 4, 'admin/reports/updates', 'admin/reports/updates', 'Settings', 't', '', 128, '', '', '', 0, 'modules/update/update.settings.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user/%/track/navigation', 'a:1:{i:1;s:9:"user_load";}', '', 'user_access', 'a:1:{i:0;s:17:"access statistics";}', 'statistics_user_tracker', 'a:0:{}', 11, 4, 'user/%', 'user/%', 'Track page visits', 't', '', 128, '', '', '', 2, 'modules/statistics/statistics.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/blog', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":15:{s:4:"name";s:10:"Blog entry";s:6:"module";s:4:"blog";s:11:"description";s:78:"A <em>blog entry</em> is a single post to an online journal, or <em>blog</em>.";s:4:"type";s:4:"blog";s:9:"has_title";b:1;s:11:"title_label";s:5:"Title";s:8:"has_body";b:1;s:10:"body_label";s:4:"Body";s:4:"help";s:0:"";s:14:"min_word_count";i:0;s:6:"custom";b:0;s:8:"modified";b:0;s:6:"locked";b:1;s:9:"orig_type";s:4:"blog";s:6:"is_new";b:1;}}', 15, 4, '', 'admin/content/node-type/blog', 'Blog entry', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/book', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"book";s:4:"name";s:9:"Book page";s:6:"module";s:4:"node";s:11:"description";s:283:"A <em>book page</em> is a page of content, organized into a collection of related entries collectively known as a <em>book</em>. A <em>book page</em> automatically displays links to adjacent pages, providing a simple navigation system for organizing and reviewing structured content.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"book";}}', 15, 4, '', 'admin/content/node-type/book', 'Book page', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/search/wipe', '', '', 'user_access', 'a:1:{i:0;s:17:"administer search";}', 'drupal_get_form', 'a:1:{i:0;s:19:"search_wipe_confirm";}', 15, 4, '', 'admin/settings/search/wipe', 'Clear index', 't', '', 4, '', '', '', 0, 'modules/search/search.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/block/configure', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:21:"block_admin_configure";}', 15, 4, '', 'admin/build/block/configure', 'Configure block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/path/delete', '', '', 'user_access', 'a:1:{i:0;s:22:"administer url aliases";}', 'drupal_get_form', 'a:1:{i:0;s:25:"path_admin_delete_confirm";}', 15, 4, '', 'admin/build/path/delete', 'Delete alias', 't', '', 4, '', '', '', 0, 'modules/path/path.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/block/delete', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'drupal_get_form', 'a:1:{i:0;s:16:"block_box_delete";}', 15, 4, '', 'admin/build/block/delete', 'Delete block', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/filters/delete', '', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'drupal_get_form', 'a:1:{i:0;s:19:"filter_admin_delete";}', 15, 4, '', 'admin/settings/filters/delete', 'Delete input format', 't', '', 4, '', '', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/user/rules/delete', '', '', 'user_access', 'a:1:{i:0;s:22:"administer permissions";}', 'drupal_get_form', 'a:1:{i:0;s:32:"user_admin_access_delete_confirm";}', 15, 4, '', 'admin/user/rules/delete', 'Delete rule', 't', '', 4, '', '', '', 0, 'modules/user/user.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/event/%', 'a:1:{i:3;N;}', '', 'user_access', 'a:1:{i:0;s:19:"access site reports";}', 'dblog_event', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/reports/event/%', 'Details', 't', '', 4, '', '', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/forum', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":15:{s:4:"name";s:11:"Forum topic";s:6:"module";s:5:"forum";s:11:"description";s:85:"A <em>forum topic</em> is the initial post to a new discussion thread within a forum.";s:11:"title_label";s:7:"Subject";s:4:"type";s:5:"forum";s:9:"has_title";b:1;s:8:"has_body";b:1;s:10:"body_label";s:4:"Body";s:4:"help";s:0:"";s:14:"min_word_count";i:0;s:6:"custom";b:0;s:8:"modified";b:0;s:6:"locked";b:1;s:9:"orig_type";s:5:"forum";s:6:"is_new";b:1;}}', 15, 4, '', 'admin/content/node-type/forum', 'Forum topic', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/taxonomy/%', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 14, 4, '', 'admin/content/taxonomy/%', 'List terms', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/page', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 15, 4, '', 'admin/content/node-type/page', 'Page', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/forum/settings', '', '', 'user_access', 'a:1:{i:0;s:17:"administer forums";}', 'drupal_get_form', 'a:1:{i:0;s:20:"forum_admin_settings";}', 15, 4, 'admin/content/forum', 'admin/content/forum', 'Settings', 't', '', 128, '', '', '', 5, 'modules/forum/forum.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/story', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:5:"Story";s:6:"module";s:4:"node";s:11:"description";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}', 15, 4, '', 'admin/content/node-type/story', 'Story', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/logging/syslog', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"syslog_admin_settings";}', 15, 4, '', 'admin/settings/logging/syslog', 'Syslog', 't', '', 6, '', 'Settings for syslog logging. Syslog is an operating system administrative logging tool used in systems management and security auditing. Most suited to medium and large sites, syslog provides filtering tools that allow messages to be routed by type and severity.', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/logging/dblog', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:20:"dblog_admin_settings";}', 15, 4, '', 'admin/settings/logging/dblog', 'Database logging', 't', '', 6, '', 'Settings for logging to the Drupal database logs. This is the most common method for small to medium sites on shared hosting. The logs are viewable from the admin pages.', '', 0, 'modules/dblog/dblog.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/reports/access/%', 'a:1:{i:3;N;}', '', 'user_access', 'a:1:{i:0;s:17:"access statistics";}', 'statistics_access_log', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/reports/access/%', 'Details', 't', '', 4, '', 'View access log.', '', 0, 'modules/statistics/statistics.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/admin/rebuild', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:22:"admin_settings_rebuild";}', 15, 4, 'admin/settings/admin', 'admin/settings/admin', 'Rebuild', 't', '', 128, '', 'Wipe and rebuild the administrative menu.', '', 10, 'modules/admin/admin.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/admin/settings', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:19:"admin_settings_form";}', 15, 4, 'admin/settings/admin', 'admin/settings/admin', 'Settings', 't', '', 136, '', 'Settings for site administration tools.', '', 0, 'modules/admin/admin.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/filters/%', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 14, 4, '', 'admin/settings/filters/%', '', 'filter_admin_format_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/admin/theme', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:27:"system_admin_theme_settings";}', 15, 4, 'admin/settings/admin', 'admin/settings/admin', 'Administration theme', 't', '', 128, 'system_admin_theme_settings', 'Settings for how your administrative pages should look.', 'left', 10, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/menu-customize/%', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 14, 4, '', 'admin/build/menu-customize/%', 'Customize menu', 'menu_overview_title', 'a:1:{i:0;i:3;}', 4, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/blog/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":15:{s:4:"name";s:10:"Blog entry";s:6:"module";s:4:"blog";s:11:"description";s:78:"A <em>blog entry</em> is a single post to an online journal, or <em>blog</em>.";s:4:"type";s:4:"blog";s:9:"has_title";b:1;s:11:"title_label";s:5:"Title";s:8:"has_body";b:1;s:10:"body_label";s:4:"Body";s:4:"help";s:0:"";s:14:"min_word_count";i:0;s:6:"custom";b:0;s:8:"modified";b:0;s:6:"locked";b:1;s:9:"orig_type";s:4:"blog";s:6:"is_new";b:1;}}', 31, 5, 'admin/content/node-type/blog', 'admin/content/node-type/blog', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/book/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"book";s:4:"name";s:9:"Book page";s:6:"module";s:4:"node";s:11:"description";s:283:"A <em>book page</em> is a page of content, organized into a collection of related entries collectively known as a <em>book</em>. A <em>book page</em> automatically displays links to adjacent pages, providing a simple navigation system for organizing and reviewing structured content.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"book";}}', 31, 5, 'admin/content/node-type/book', 'admin/content/node-type/book', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/forum/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":15:{s:4:"name";s:11:"Forum topic";s:6:"module";s:5:"forum";s:11:"description";s:85:"A <em>forum topic</em> is the initial post to a new discussion thread within a forum.";s:11:"title_label";s:7:"Subject";s:4:"type";s:5:"forum";s:9:"has_title";b:1;s:8:"has_body";b:1;s:10:"body_label";s:4:"Body";s:4:"help";s:0:"";s:14:"min_word_count";i:0;s:6:"custom";b:0;s:8:"modified";b:0;s:6:"locked";b:1;s:9:"orig_type";s:5:"forum";s:6:"is_new";b:1;}}', 31, 5, 'admin/content/node-type/forum', 'admin/content/node-type/forum', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/page/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 31, 5, 'admin/content/node-type/page', 'admin/content/node-type/page', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/story/edit', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:14:"node_type_form";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:5:"Story";s:6:"module";s:4:"node";s:11:"description";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}', 31, 5, 'admin/content/node-type/story', 'admin/content/node-type/story', 'Edit', 't', '', 136, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/themes/settings/global', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:21:"system_theme_settings";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Global settings', 't', '', 136, '', '', '', -1, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/taxonomy/%/list', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:2:{i:0;s:23:"taxonomy_overview_terms";i:1;i:3;}', 29, 5, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'List', 't', '', 136, '', '', '', -10, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/filters/%/edit', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_format_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Edit', 't', '', 136, '', '', '', 0, 'modules/filter/filter.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/menu-customize/%/list', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:18:"menu_overview_form";i:1;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'List items', 't', '', 136, '', '', '', -10, 'modules/menu/menu.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/modules/list/confirm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:14:"system_modules";}', 31, 5, '', 'admin/build/modules/list/confirm', 'List', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/modules/uninstall/confirm', '', '', 'user_access', 'a:1:{i:0;s:29:"administer site configuration";}', 'drupal_get_form', 'a:1:{i:0;s:24:"system_modules_uninstall";}', 31, 5, '', 'admin/build/modules/uninstall/confirm', 'Uninstall', 't', '', 4, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/themes/settings/cube', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:27:"themes/rubik/cube/cube.info";s:4:"name";s:4:"cube";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:4:"Cube";s:11:"description";s:44:"Spaces-aware front-end theme based on Rubik.";s:10:"base theme";s:5:"rubik";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:6:"screen";a:1:{s:9:"style.css";s:27:"themes/rubik/cube/style.css";}}s:7:"regions";a:4:{s:6:"header";s:6:"Header";s:7:"content";s:7:"Content";s:4:"left";s:4:"Left";s:5:"right";s:5:"Right";}s:9:"designkit";a:2:{s:5:"color";a:1:{s:10:"background";s:7:"#0088cc";}s:4:"logo";a:2:{s:4:"logo";s:23:"imagecache_scale:200x50";s:5:"print";s:24:"imagecache_scale:600x150";}}s:7:"layouts";a:5:{s:7:"default";a:3:{s:4:"name";s:7:"Default";s:11:"description";s:23:"Simple one column page.";s:8:"template";s:4:"page";}s:7:"sidebar";a:5:{s:4:"name";s:7:"Sidebar";s:11:"description";s:26:"Main content with sidebar.";s:10:"stylesheet";s:18:"layout-sidebar.css";s:8:"template";s:14:"layout-sidebar";s:7:"regions";a:2:{i:0;s:7:"content";i:1;s:5:"right";}}s:5:"split";a:5:{s:4:"name";s:5:"Split";s:11:"description";s:12:"50/50 split.";s:10:"stylesheet";s:16:"layout-split.css";s:8:"template";s:14:"layout-sidebar";s:7:"regions";a:2:{i:0;s:7:"content";i:1;s:5:"right";}}s:7:"columns";a:5:{s:4:"name";s:7:"Columns";s:11:"description";s:20:"Three column layout.";s:10:"stylesheet";s:18:"layout-columns.css";s:8:"template";s:14:"layout-columns";s:7:"regions";a:4:{i:0;s:6:"header";i:1;s:7:"content";i:2;s:4:"left";i:3;s:5:"right";}}s:6:"offset";a:5:{s:4:"name";s:15:"Offset sidebars";s:11:"description";s:38:"Main content with two offset sidebars.";s:10:"stylesheet";s:17:"layout-offset.css";s:8:"template";s:13:"layout-offset";s:7:"regions";a:4:{i:0;s:6:"header";i:1;s:7:"content";i:2;s:4:"left";i:3;s:5:"right";}}}s:9:"datestamp";s:10:"1285701991";s:7:"project";s:5:"rubik";s:18:"project status url";s:39:"http://code.developmentseed.org/fserver";s:7:"version";s:13:"6.x-3.0-beta2";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/rubik/cube/script.js";}s:10:"screenshot";s:32:"themes/rubik/cube/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:6:"screen";a:1:{s:9:"style.css";s:27:"themes/rubik/cube/style.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:5:"rubik";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:4:"cube";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Cube', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/themes/settings/rubik', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":14:{s:8:"filename";s:23:"themes/rubik/rubik.info";s:4:"name";s:5:"rubik";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:15:{s:4:"name";s:5:"Rubik";s:11:"description";s:18:"Clean admin theme.";s:10:"base theme";s:3:"tao";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:1:{s:7:"droomla";s:13:"Joomla Region";}s:7:"scripts";a:1:{s:11:"js/rubik.js";s:24:"themes/rubik/js/rubik.js";}s:11:"stylesheets";a:1:{s:6:"screen";a:3:{s:8:"core.css";s:21:"themes/rubik/core.css";s:9:"icons.css";s:22:"themes/rubik/icons.css";s:9:"style.css";s:22:"themes/rubik/style.css";}}s:9:"datestamp";s:10:"1285701991";s:7:"project";s:5:"rubik";s:18:"project status url";s:39:"http://code.developmentseed.org/fserver";s:7:"version";s:13:"6.x-3.0-beta2";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:27:"themes/rubik/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:6:"screen";a:3:{s:8:"core.css";s:21:"themes/rubik/core.css";s:9:"icons.css";s:22:"themes/rubik/icons.css";s:9:"style.css";s:22:"themes/rubik/style.css";}}s:7:"scripts";a:1:{s:11:"js/rubik.js";s:24:"themes/rubik/js/rubik.js";}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:3:"tao";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:5:"rubik";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Rubik', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/themes/settings/tao', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:19:"themes/tao/tao.info";s:4:"name";s:3:"tao";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"core";s:3:"6.x";s:11:"description";s:149:"Tao is a base theme that is all about going with the flow. It takes care of key reset and utility tasks so that sub-themes can get on with their job.";s:6:"engine";s:11:"phptemplate";s:4:"name";s:3:"Tao";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:7:"scripts";a:1:{s:9:"js/tao.js";s:20:"themes/tao/js/tao.js";}s:11:"stylesheets";a:3:{s:6:"screen";a:3:{s:9:"reset.css";s:20:"themes/tao/reset.css";s:10:"drupal.css";s:21:"themes/tao/drupal.css";s:8:"base.css";s:19:"themes/tao/base.css";}s:5:"print";a:3:{s:9:"reset.css";s:20:"themes/tao/reset.css";s:8:"base.css";s:19:"themes/tao/base.css";s:9:"print.css";s:20:"themes/tao/print.css";}s:3:"all";a:20:{s:9:"admin.css";s:20:"themes/tao/admin.css";s:9:"block.css";s:20:"themes/tao/block.css";s:8:"book.css";s:19:"themes/tao/book.css";s:11:"comment.css";s:22:"themes/tao/comment.css";s:9:"dblog.css";s:20:"themes/tao/dblog.css";s:12:"defaults.css";s:23:"themes/tao/defaults.css";s:9:"forum.css";s:20:"themes/tao/forum.css";s:8:"help.css";s:19:"themes/tao/help.css";s:15:"maintenance.css";s:26:"themes/tao/maintenance.css";s:8:"node.css";s:19:"themes/tao/node.css";s:10:"openid.css";s:21:"themes/tao/openid.css";s:8:"poll.css";s:19:"themes/tao/poll.css";s:11:"profile.css";s:22:"themes/tao/profile.css";s:10:"search.css";s:21:"themes/tao/search.css";s:10:"system.css";s:21:"themes/tao/system.css";s:16:"system-menus.css";s:27:"themes/tao/system-menus.css";s:12:"taxonomy.css";s:23:"themes/tao/taxonomy.css";s:11:"tracker.css";s:22:"themes/tao/tracker.css";s:10:"update.css";s:21:"themes/tao/update.css";s:8:"user.css";s:19:"themes/tao/user.css";}}s:7:"version";s:7:"6.x-3.2";s:7:"project";s:3:"tao";s:9:"datestamp";s:10:"1287680788";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:25:"themes/tao/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:3:{s:6:"screen";a:3:{s:9:"reset.css";s:20:"themes/tao/reset.css";s:10:"drupal.css";s:21:"themes/tao/drupal.css";s:8:"base.css";s:19:"themes/tao/base.css";}s:5:"print";a:3:{s:9:"reset.css";s:20:"themes/tao/reset.css";s:8:"base.css";s:19:"themes/tao/base.css";s:9:"print.css";s:20:"themes/tao/print.css";}s:3:"all";a:20:{s:9:"admin.css";s:20:"themes/tao/admin.css";s:9:"block.css";s:20:"themes/tao/block.css";s:8:"book.css";s:19:"themes/tao/book.css";s:11:"comment.css";s:22:"themes/tao/comment.css";s:9:"dblog.css";s:20:"themes/tao/dblog.css";s:12:"defaults.css";s:23:"themes/tao/defaults.css";s:9:"forum.css";s:20:"themes/tao/forum.css";s:8:"help.css";s:19:"themes/tao/help.css";s:15:"maintenance.css";s:26:"themes/tao/maintenance.css";s:8:"node.css";s:19:"themes/tao/node.css";s:10:"openid.css";s:21:"themes/tao/openid.css";s:8:"poll.css";s:19:"themes/tao/poll.css";s:11:"profile.css";s:22:"themes/tao/profile.css";s:10:"search.css";s:21:"themes/tao/search.css";s:10:"system.css";s:21:"themes/tao/system.css";s:16:"system-menus.css";s:27:"themes/tao/system-menus.css";s:12:"taxonomy.css";s:23:"themes/tao/taxonomy.css";s:11:"tracker.css";s:22:"themes/tao/tracker.css";s:10:"update.css";s:21:"themes/tao/update.css";s:8:"user.css";s:19:"themes/tao/user.css";}}s:7:"scripts";a:1:{s:9:"js/tao.js";s:20:"themes/tao/js/tao.js";}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:3:"tao";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Tao', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/themes/settings/zen', '', '', '_system_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:19:"themes/zen/zen.info";s:4:"name";s:3:"zen";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:15:{s:4:"name";s:3:"Zen";s:11:"description";s:189:"Zen sub-themes are the ultimate starting themes for Drupal 6. Read the <a href="http://drupal.org/node/226507">online docs</a> or the included README-FIRST.txt on how to create a sub-theme.";s:10:"screenshot";s:39:"themes/zen/zen-internals/screenshot.png";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:10:{s:7:"droomla";s:13:"Joomla Region";s:13:"sidebar_first";s:13:"First sidebar";s:14:"sidebar_second";s:14:"Second sidebar";s:10:"navigation";s:14:"Navigation bar";s:9:"highlight";s:19:"Highlighted content";s:11:"content_top";s:11:"Content top";s:14:"content_bottom";s:14:"Content bottom";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:12:"page_closure";s:12:"Page closure";}s:8:"features";a:10:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:7:"mission";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:6:"search";i:7;s:7:"favicon";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:8:"settings";a:9:{s:17:"zen_block_editing";s:1:"1";s:14:"zen_breadcrumb";s:3:"yes";s:24:"zen_breadcrumb_separator";s:3:" - ";s:19:"zen_breadcrumb_home";s:1:"1";s:23:"zen_breadcrumb_trailing";s:1:"1";s:20:"zen_breadcrumb_title";s:1:"0";s:10:"zen_layout";s:18:"zen-columns-liquid";s:20:"zen_rebuild_registry";s:1:"0";s:14:"zen_wireframes";s:1:"0";}s:7:"plugins";a:1:{s:6:"panels";a:1:{s:7:"layouts";s:7:"layouts";}}s:7:"version";s:7:"6.x-2.0";s:7:"project";s:3:"zen";s:9:"datestamp";s:10:"1277583313";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:20:"themes/zen/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:20:"themes/zen/script.js";}s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:20:"themes/zen/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'drupal_get_form', 'a:2:{i:0;s:21:"system_theme_settings";i:1;s:3:"zen";}', 31, 5, 'admin/build/themes/settings', 'admin/build/themes', 'Zen', 't', '', 128, '', '', '', 0, 'modules/system/system.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/menu-customize/%/add', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:3:"add";i:2;N;i:3;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Add item', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/filters/%/configure', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_configure_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Configure', 't', '', 128, '', '', '', 1, 'modules/filter/filter.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/block/list/cube', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:27:"themes/rubik/cube/cube.info";s:4:"name";s:4:"cube";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:17:{s:4:"name";s:4:"Cube";s:11:"description";s:44:"Spaces-aware front-end theme based on Rubik.";s:10:"base theme";s:5:"rubik";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:6:"screen";a:1:{s:9:"style.css";s:27:"themes/rubik/cube/style.css";}}s:7:"regions";a:4:{s:6:"header";s:6:"Header";s:7:"content";s:7:"Content";s:4:"left";s:4:"Left";s:5:"right";s:5:"Right";}s:9:"designkit";a:2:{s:5:"color";a:1:{s:10:"background";s:7:"#0088cc";}s:4:"logo";a:2:{s:4:"logo";s:23:"imagecache_scale:200x50";s:5:"print";s:24:"imagecache_scale:600x150";}}s:7:"layouts";a:5:{s:7:"default";a:3:{s:4:"name";s:7:"Default";s:11:"description";s:23:"Simple one column page.";s:8:"template";s:4:"page";}s:7:"sidebar";a:5:{s:4:"name";s:7:"Sidebar";s:11:"description";s:26:"Main content with sidebar.";s:10:"stylesheet";s:18:"layout-sidebar.css";s:8:"template";s:14:"layout-sidebar";s:7:"regions";a:2:{i:0;s:7:"content";i:1;s:5:"right";}}s:5:"split";a:5:{s:4:"name";s:5:"Split";s:11:"description";s:12:"50/50 split.";s:10:"stylesheet";s:16:"layout-split.css";s:8:"template";s:14:"layout-sidebar";s:7:"regions";a:2:{i:0;s:7:"content";i:1;s:5:"right";}}s:7:"columns";a:5:{s:4:"name";s:7:"Columns";s:11:"description";s:20:"Three column layout.";s:10:"stylesheet";s:18:"layout-columns.css";s:8:"template";s:14:"layout-columns";s:7:"regions";a:4:{i:0;s:6:"header";i:1;s:7:"content";i:2;s:4:"left";i:3;s:5:"right";}}s:6:"offset";a:5:{s:4:"name";s:15:"Offset sidebars";s:11:"description";s:38:"Main content with two offset sidebars.";s:10:"stylesheet";s:17:"layout-offset.css";s:8:"template";s:13:"layout-offset";s:7:"regions";a:4:{i:0;s:6:"header";i:1;s:7:"content";i:2;s:4:"left";i:3;s:5:"right";}}}s:9:"datestamp";s:10:"1285701991";s:7:"project";s:5:"rubik";s:18:"project status url";s:39:"http://code.developmentseed.org/fserver";s:7:"version";s:13:"6.x-3.0-beta2";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/rubik/cube/script.js";}s:10:"screenshot";s:32:"themes/rubik/cube/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:6:"screen";a:1:{s:9:"style.css";s:27:"themes/rubik/cube/style.css";}}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:5:"rubik";}}', 'block_admin_display', 'a:1:{i:0;s:4:"cube";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Cube', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/book/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"book";s:4:"name";s:9:"Book page";s:6:"module";s:4:"node";s:11:"description";s:283:"A <em>book page</em> is a page of content, organized into a collection of related entries collectively known as a <em>book</em>. A <em>book page</em> automatically displays links to adjacent pages, providing a simple navigation system for organizing and reviewing structured content.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"book";}}', 31, 5, '', 'admin/content/node-type/book/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/page/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:4:"page";s:4:"name";s:4:"Page";s:6:"module";s:4:"node";s:11:"description";s:296:"A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:4:"page";}}', 31, 5, '', 'admin/content/node-type/page/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/story/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":14:{s:4:"type";s:5:"story";s:4:"name";s:5:"Story";s:6:"module";s:4:"node";s:11:"description";s:392:"A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.";s:4:"help";s:0:"";s:9:"has_title";s:1:"1";s:11:"title_label";s:5:"Title";s:8:"has_body";s:1:"1";s:10:"body_label";s:4:"Body";s:14:"min_word_count";s:1:"0";s:6:"custom";s:1:"1";s:8:"modified";s:1:"1";s:6:"locked";s:1:"0";s:9:"orig_type";s:5:"story";}}', 31, 5, '', 'admin/content/node-type/story/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/blog/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":15:{s:4:"name";s:10:"Blog entry";s:6:"module";s:4:"blog";s:11:"description";s:78:"A <em>blog entry</em> is a single post to an online journal, or <em>blog</em>.";s:4:"type";s:4:"blog";s:9:"has_title";b:1;s:11:"title_label";s:5:"Title";s:8:"has_body";b:1;s:10:"body_label";s:4:"Body";s:4:"help";s:0:"";s:14:"min_word_count";i:0;s:6:"custom";b:0;s:8:"modified";b:0;s:6:"locked";b:1;s:9:"orig_type";s:4:"blog";s:6:"is_new";b:1;}}', 31, 5, '', 'admin/content/node-type/blog/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/node-type/forum/delete', '', '', 'user_access', 'a:1:{i:0;s:24:"administer content types";}', 'drupal_get_form', 'a:2:{i:0;s:24:"node_type_delete_confirm";i:1;O:8:"stdClass":15:{s:4:"name";s:11:"Forum topic";s:6:"module";s:5:"forum";s:11:"description";s:85:"A <em>forum topic</em> is the initial post to a new discussion thread within a forum.";s:11:"title_label";s:7:"Subject";s:4:"type";s:5:"forum";s:9:"has_title";b:1;s:8:"has_body";b:1;s:10:"body_label";s:4:"Body";s:4:"help";s:0:"";s:14:"min_word_count";i:0;s:6:"custom";b:0;s:8:"modified";b:0;s:6:"locked";b:1;s:9:"orig_type";s:5:"forum";s:6:"is_new";b:1;}}', 31, 5, '', 'admin/content/node-type/forum/delete', 'Delete', 't', '', 4, '', '', '', 0, 'modules/node/content_types.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/menu-customize/%/edit', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:3:{i:0;s:14:"menu_edit_menu";i:1;s:4:"edit";i:2;i:3;}', 29, 5, 'admin/build/menu-customize/%', 'admin/build/menu-customize/%', 'Edit menu', 't', '', 128, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/taxonomy/edit/term', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_term_edit', 'a:0:{}', 31, 5, '', 'admin/content/taxonomy/edit/term', 'Edit term', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/block/list/js', '', '', 'user_access', 'a:1:{i:0;s:17:"administer blocks";}', 'block_admin_display_js', 'a:0:{}', 31, 5, '', 'admin/build/block/list/js', 'JavaScript List Form', 't', '', 4, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/filters/%/order', 'a:1:{i:3;s:18:"filter_format_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer filters";}', 'filter_admin_order_page', 'a:1:{i:0;i:3;}', 29, 5, 'admin/settings/filters/%', 'admin/settings/filters/%', 'Rearrange', 't', '', 128, '', '', '', 2, 'modules/filter/filter.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('user/reset/%/%/%', 'a:3:{i:2;N;i:3;N;i:4;N;}', '', '1', 'a:0:{}', 'drupal_get_form', 'a:4:{i:0;s:15:"user_pass_reset";i:1;i:2;i:2;i:3;i:3;i:4;}', 24, 5, '', 'user/reset/%/%/%', 'Reset password', 't', '', 4, '', '', '', 0, 'modules/user/user.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/block/list/rubik', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":14:{s:8:"filename";s:23:"themes/rubik/rubik.info";s:4:"name";s:5:"rubik";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"1";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:15:{s:4:"name";s:5:"Rubik";s:11:"description";s:18:"Clean admin theme.";s:10:"base theme";s:3:"tao";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:1:{s:7:"droomla";s:13:"Joomla Region";}s:7:"scripts";a:1:{s:11:"js/rubik.js";s:24:"themes/rubik/js/rubik.js";}s:11:"stylesheets";a:1:{s:6:"screen";a:3:{s:8:"core.css";s:21:"themes/rubik/core.css";s:9:"icons.css";s:22:"themes/rubik/icons.css";s:9:"style.css";s:22:"themes/rubik/style.css";}}s:9:"datestamp";s:10:"1285701991";s:7:"project";s:5:"rubik";s:18:"project status url";s:39:"http://code.developmentseed.org/fserver";s:7:"version";s:13:"6.x-3.0-beta2";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:27:"themes/rubik/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:6:"screen";a:3:{s:8:"core.css";s:21:"themes/rubik/core.css";s:9:"icons.css";s:22:"themes/rubik/icons.css";s:9:"style.css";s:22:"themes/rubik/style.css";}}s:7:"scripts";a:1:{s:11:"js/rubik.js";s:24:"themes/rubik/js/rubik.js";}s:6:"engine";s:11:"phptemplate";s:10:"base_theme";s:3:"tao";}}', 'block_admin_display', 'a:1:{i:0;s:5:"rubik";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Rubik', 't', '', 136, '', '', '', -10, 'modules/block/block.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/block/list/tao', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":13:{s:8:"filename";s:19:"themes/tao/tao.info";s:4:"name";s:3:"tao";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:13:{s:4:"core";s:3:"6.x";s:11:"description";s:149:"Tao is a base theme that is all about going with the flow. It takes care of key reset and utility tasks so that sub-themes can get on with their job.";s:6:"engine";s:11:"phptemplate";s:4:"name";s:3:"Tao";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:7:"scripts";a:1:{s:9:"js/tao.js";s:20:"themes/tao/js/tao.js";}s:11:"stylesheets";a:3:{s:6:"screen";a:3:{s:9:"reset.css";s:20:"themes/tao/reset.css";s:10:"drupal.css";s:21:"themes/tao/drupal.css";s:8:"base.css";s:19:"themes/tao/base.css";}s:5:"print";a:3:{s:9:"reset.css";s:20:"themes/tao/reset.css";s:8:"base.css";s:19:"themes/tao/base.css";s:9:"print.css";s:20:"themes/tao/print.css";}s:3:"all";a:20:{s:9:"admin.css";s:20:"themes/tao/admin.css";s:9:"block.css";s:20:"themes/tao/block.css";s:8:"book.css";s:19:"themes/tao/book.css";s:11:"comment.css";s:22:"themes/tao/comment.css";s:9:"dblog.css";s:20:"themes/tao/dblog.css";s:12:"defaults.css";s:23:"themes/tao/defaults.css";s:9:"forum.css";s:20:"themes/tao/forum.css";s:8:"help.css";s:19:"themes/tao/help.css";s:15:"maintenance.css";s:26:"themes/tao/maintenance.css";s:8:"node.css";s:19:"themes/tao/node.css";s:10:"openid.css";s:21:"themes/tao/openid.css";s:8:"poll.css";s:19:"themes/tao/poll.css";s:11:"profile.css";s:22:"themes/tao/profile.css";s:10:"search.css";s:21:"themes/tao/search.css";s:10:"system.css";s:21:"themes/tao/system.css";s:16:"system-menus.css";s:27:"themes/tao/system-menus.css";s:12:"taxonomy.css";s:23:"themes/tao/taxonomy.css";s:11:"tracker.css";s:22:"themes/tao/tracker.css";s:10:"update.css";s:21:"themes/tao/update.css";s:8:"user.css";s:19:"themes/tao/user.css";}}s:7:"version";s:7:"6.x-3.2";s:7:"project";s:3:"tao";s:9:"datestamp";s:10:"1287680788";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:25:"themes/tao/screenshot.png";s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:3:{s:6:"screen";a:3:{s:9:"reset.css";s:20:"themes/tao/reset.css";s:10:"drupal.css";s:21:"themes/tao/drupal.css";s:8:"base.css";s:19:"themes/tao/base.css";}s:5:"print";a:3:{s:9:"reset.css";s:20:"themes/tao/reset.css";s:8:"base.css";s:19:"themes/tao/base.css";s:9:"print.css";s:20:"themes/tao/print.css";}s:3:"all";a:20:{s:9:"admin.css";s:20:"themes/tao/admin.css";s:9:"block.css";s:20:"themes/tao/block.css";s:8:"book.css";s:19:"themes/tao/book.css";s:11:"comment.css";s:22:"themes/tao/comment.css";s:9:"dblog.css";s:20:"themes/tao/dblog.css";s:12:"defaults.css";s:23:"themes/tao/defaults.css";s:9:"forum.css";s:20:"themes/tao/forum.css";s:8:"help.css";s:19:"themes/tao/help.css";s:15:"maintenance.css";s:26:"themes/tao/maintenance.css";s:8:"node.css";s:19:"themes/tao/node.css";s:10:"openid.css";s:21:"themes/tao/openid.css";s:8:"poll.css";s:19:"themes/tao/poll.css";s:11:"profile.css";s:22:"themes/tao/profile.css";s:10:"search.css";s:21:"themes/tao/search.css";s:10:"system.css";s:21:"themes/tao/system.css";s:16:"system-menus.css";s:27:"themes/tao/system-menus.css";s:12:"taxonomy.css";s:23:"themes/tao/taxonomy.css";s:11:"tracker.css";s:22:"themes/tao/tracker.css";s:10:"update.css";s:21:"themes/tao/update.css";s:8:"user.css";s:19:"themes/tao/user.css";}}s:7:"scripts";a:1:{s:9:"js/tao.js";s:20:"themes/tao/js/tao.js";}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:3:"tao";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Tao', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/block/list/zen', '', '', '_block_themes_access', 'a:1:{i:0;O:8:"stdClass":12:{s:8:"filename";s:19:"themes/zen/zen.info";s:4:"name";s:3:"zen";s:4:"type";s:5:"theme";s:5:"owner";s:45:"themes/engines/phptemplate/phptemplate.engine";s:6:"status";s:1:"0";s:8:"throttle";s:1:"0";s:9:"bootstrap";s:1:"0";s:14:"schema_version";s:2:"-1";s:6:"weight";s:1:"0";s:4:"info";a:15:{s:4:"name";s:3:"Zen";s:11:"description";s:189:"Zen sub-themes are the ultimate starting themes for Drupal 6. Read the <a href="http://drupal.org/node/226507">online docs</a> or the included README-FIRST.txt on how to create a sub-theme.";s:10:"screenshot";s:39:"themes/zen/zen-internals/screenshot.png";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:10:{s:7:"droomla";s:13:"Joomla Region";s:13:"sidebar_first";s:13:"First sidebar";s:14:"sidebar_second";s:14:"Second sidebar";s:10:"navigation";s:14:"Navigation bar";s:9:"highlight";s:19:"Highlighted content";s:11:"content_top";s:11:"Content top";s:14:"content_bottom";s:14:"Content bottom";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:12:"page_closure";s:12:"Page closure";}s:8:"features";a:10:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:7:"mission";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:6:"search";i:7;s:7:"favicon";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:8:"settings";a:9:{s:17:"zen_block_editing";s:1:"1";s:14:"zen_breadcrumb";s:3:"yes";s:24:"zen_breadcrumb_separator";s:3:" - ";s:19:"zen_breadcrumb_home";s:1:"1";s:23:"zen_breadcrumb_trailing";s:1:"1";s:20:"zen_breadcrumb_title";s:1:"0";s:10:"zen_layout";s:18:"zen-columns-liquid";s:20:"zen_rebuild_registry";s:1:"0";s:14:"zen_wireframes";s:1:"0";}s:7:"plugins";a:1:{s:6:"panels";a:1:{s:7:"layouts";s:7:"layouts";}}s:7:"version";s:7:"6.x-2.0";s:7:"project";s:3:"zen";s:9:"datestamp";s:10:"1277583313";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:20:"themes/zen/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:20:"themes/zen/script.js";}s:3:"php";s:5:"4.3.5";}s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:20:"themes/zen/style.css";}}s:6:"engine";s:11:"phptemplate";}}', 'block_admin_display', 'a:1:{i:0;s:3:"zen";}', 31, 5, 'admin/build/block/list', 'admin/build/block', 'Zen', 't', '', 128, '', '', '', 0, 'modules/block/block.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/forum/edit/%', 'a:1:{i:4;s:15:"forum_term_load";}', '', 'user_access', 'a:1:{i:0;s:17:"administer forums";}', 'forum_form_main', 'a:0:{}', 30, 5, '', 'admin/content/forum/edit/%', '', 't', '', 4, '', '', '', 0, 'modules/forum/forum.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/forum/add/container', '', '', 'user_access', 'a:1:{i:0;s:17:"administer forums";}', 'forum_form_main', 'a:1:{i:0;s:9:"container";}', 31, 5, 'admin/content/forum', 'admin/content/forum', 'Add container', 't', '', 128, '', '', '', 0, 'modules/forum/forum.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/forum/add/forum', '', '', 'user_access', 'a:1:{i:0;s:17:"administer forums";}', 'forum_form_main', 'a:1:{i:0;s:5:"forum";}', 31, 5, 'admin/content/forum', 'admin/content/forum', 'Add forum', 't', '', 128, '', '', '', 0, 'modules/forum/forum.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/taxonomy/add/vocabulary', '', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'drupal_get_form', 'a:1:{i:0;s:24:"taxonomy_form_vocabulary";}', 31, 5, 'admin/content/taxonomy', 'admin/content/taxonomy', 'Add vocabulary', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/settings/actions/delete/%', 'a:1:{i:4;s:12:"actions_load";}', '', 'user_access', 'a:1:{i:0;s:18:"administer actions";}', 'drupal_get_form', 'a:2:{i:0;s:26:"system_actions_delete_form";i:1;i:4;}', 30, 5, '', 'admin/settings/actions/delete/%', 'Delete action', 't', '', 4, '', 'Delete an action.', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/contact/delete/%', 'a:1:{i:4;s:12:"contact_load";}', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:2:{i:0;s:20:"contact_admin_delete";i:1;i:4;}', 30, 5, '', 'admin/build/contact/delete/%', 'Delete contact', 't', '', 4, '', '', '', 0, 'modules/contact/contact.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/menu-customize/%/delete', 'a:1:{i:3;s:9:"menu_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_delete_menu_page', 'a:1:{i:0;i:3;}', 29, 5, '', 'admin/build/menu-customize/%/delete', 'Delete menu', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/contact/edit/%', 'a:1:{i:4;s:12:"contact_load";}', '', 'user_access', 'a:1:{i:0;s:33:"administer site-wide contact form";}', 'drupal_get_form', 'a:3:{i:0;s:18:"contact_admin_edit";i:1;i:3;i:2;i:4;}', 30, 5, '', 'admin/build/contact/edit/%', 'Edit contact category', 't', '', 4, '', '', '', 0, 'modules/contact/contact.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/%/revisions/%/view', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:1:{i:0;i:1;}', 'node_show', 'a:3:{i:0;i:1;i:1;N;i:2;b:1;}', 21, 5, '', 'node/%/revisions/%/view', 'Revisions', 't', '', 4, '', '', '', 0, '');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/%/revisions/%/delete', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"delete";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_delete_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/delete', 'Delete earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('node/%/revisions/%/revert', 'a:2:{i:1;a:1:{s:9:"node_load";a:1:{i:0;i:3;}}i:3;N;}', '', '_node_revision_access', 'a:2:{i:0;i:1;i:1;s:6:"update";}', 'drupal_get_form', 'a:2:{i:0;s:28:"node_revision_revert_confirm";i:1;i:1;}', 21, 5, '', 'node/%/revisions/%/revert', 'Revert to earlier revision', 't', '', 4, '', '', '', 0, 'modules/node/node.pages.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/taxonomy/%/add/term', 'a:1:{i:3;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_add_term_page', 'a:1:{i:0;i:3;}', 59, 6, 'admin/content/taxonomy/%', 'admin/content/taxonomy/%', 'Add term', 't', '', 128, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/menu/item/%/delete', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'menu_item_delete_page', 'a:1:{i:0;i:4;}', 61, 6, '', 'admin/build/menu/item/%/delete', 'Delete menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/forum/edit/container/%', 'a:1:{i:5;s:15:"forum_term_load";}', '', 'user_access', 'a:1:{i:0;s:17:"administer forums";}', 'forum_form_main', 'a:2:{i:0;s:9:"container";i:1;i:5;}', 62, 6, '', 'admin/content/forum/edit/container/%', 'Edit container', 't', '', 4, '', '', '', 0, 'modules/forum/forum.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/forum/edit/forum/%', 'a:1:{i:5;s:15:"forum_term_load";}', '', 'user_access', 'a:1:{i:0;s:17:"administer forums";}', 'forum_form_main', 'a:2:{i:0;s:5:"forum";i:1;i:5;}', 62, 6, '', 'admin/content/forum/edit/forum/%', 'Edit forum', 't', '', 4, '', '', '', 0, 'modules/forum/forum.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/menu/item/%/edit', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:4:{i:0;s:14:"menu_edit_item";i:1;s:4:"edit";i:2;i:4;i:3;N;}', 61, 6, '', 'admin/build/menu/item/%/edit', 'Edit menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/content/taxonomy/edit/vocabulary/%', 'a:1:{i:5;s:24:"taxonomy_vocabulary_load";}', '', 'user_access', 'a:1:{i:0;s:19:"administer taxonomy";}', 'taxonomy_admin_vocabulary_edit', 'a:1:{i:0;i:5;}', 62, 6, '', 'admin/content/taxonomy/edit/vocabulary/%', 'Edit vocabulary', 't', '', 4, '', '', '', 0, 'modules/taxonomy/taxonomy.admin.inc');
INSERT INTO `#__dos_menu_router` (`path`, `load_functions`, `to_arg_functions`, `access_callback`, `access_arguments`, `page_callback`, `page_arguments`, `fit`, `number_parts`, `tab_parent`, `tab_root`, `title`, `title_callback`, `title_arguments`, `type`, `block_callback`, `description`, `position`, `weight`, `file`) VALUES('admin/build/menu/item/%/reset', 'a:1:{i:4;s:14:"menu_link_load";}', '', 'user_access', 'a:1:{i:0;s:15:"administer menu";}', 'drupal_get_form', 'a:2:{i:0;s:23:"menu_reset_item_confirm";i:1;i:4;}', 61, 6, '', 'admin/build/menu/item/%/reset', 'Reset menu item', 't', '', 4, '', '', '', 0, 'modules/menu/menu.admin.inc');

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_node`
--

CREATE TABLE IF NOT EXISTS `#__dos_node` (
  `nid` int(10) unsigned NOT NULL auto_increment,
  `vid` int(10) unsigned NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  `language` varchar(12) NOT NULL default '',
  `title` varchar(255) NOT NULL default '',
  `uid` int(11) NOT NULL default '0',
  `status` int(11) NOT NULL default '1',
  `created` int(11) NOT NULL default '0',
  `changed` int(11) NOT NULL default '0',
  `comment` int(11) NOT NULL default '0',
  `promote` int(11) NOT NULL default '0',
  `moderate` int(11) NOT NULL default '0',
  `sticky` int(11) NOT NULL default '0',
  `tnid` int(10) unsigned NOT NULL default '0',
  `translate` int(11) NOT NULL default '0',
  PRIMARY KEY  (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_moderate` (`moderate`),
  KEY `node_promote_status` (`promote`,`status`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `#__dos_node`
--

INSERT INTO `#__dos_node` (`nid`, `vid`, `type`, `language`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `moderate`, `sticky`, `tnid`, `translate`) VALUES(1, 1, 'story', '', 'Welcome to Droomla!', 1, 1, 1287963782, 1288881657, 2, 1, 0, 0, 0, 0);
INSERT INTO `#__dos_node` (`nid`, `vid`, `type`, `language`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `moderate`, `sticky`, `tnid`, `translate`) VALUES(2, 2, 'blog', '', 'Marvin the Paranoid Android', 1, 1, 1288999788, 1289000382, 2, 1, 0, 0, 0, 0);
INSERT INTO `#__dos_node` (`nid`, `vid`, `type`, `language`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `moderate`, `sticky`, `tnid`, `translate`) VALUES(3, 3, 'forum', '', 'Marvin!', 1, 1, 1289000909, 1289000954, 2, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_node` (`nid`, `vid`, `type`, `language`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `moderate`, `sticky`, `tnid`, `translate`) VALUES(4, 4, 'book', '', 'This is a book page!', 1, 1, 1289001068, 1289001068, 2, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_node` (`nid`, `vid`, `type`, `language`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `moderate`, `sticky`, `tnid`, `translate`) VALUES(5, 5, 'page', '', 'And this is a plain old page...', 1, 1, 1289001192, 1289001192, 0, 0, 0, 0, 0, 0);
INSERT INTO `#__dos_node` (`nid`, `vid`, `type`, `language`, `title`, `uid`, `status`, `created`, `changed`, `comment`, `promote`, `moderate`, `sticky`, `tnid`, `translate`) VALUES(6, 6, 'page', '', 'This is a book', 1, 1, 1289002470, 1289002470, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_node_access`
--

CREATE TABLE IF NOT EXISTS `#__dos_node_access` (
  `nid` int(10) unsigned NOT NULL default '0',
  `gid` int(10) unsigned NOT NULL default '0',
  `realm` varchar(255) NOT NULL default '',
  `grant_view` tinyint(3) unsigned NOT NULL default '0',
  `grant_update` tinyint(3) unsigned NOT NULL default '0',
  `grant_delete` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`,`gid`,`realm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_node_access`
--

INSERT INTO `#__dos_node_access` (`nid`, `gid`, `realm`, `grant_view`, `grant_update`, `grant_delete`) VALUES(0, 0, 'all', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_node_comment_statistics`
--

CREATE TABLE IF NOT EXISTS `#__dos_node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL default '0',
  `last_comment_timestamp` int(11) NOT NULL default '0',
  `last_comment_name` varchar(60) default NULL,
  `last_comment_uid` int(11) NOT NULL default '0',
  `comment_count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_node_comment_statistics`
--

INSERT INTO `#__dos_node_comment_statistics` (`nid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) VALUES(1, 1287963782, NULL, 1, 0);
INSERT INTO `#__dos_node_comment_statistics` (`nid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) VALUES(2, 1288999788, NULL, 1, 0);
INSERT INTO `#__dos_node_comment_statistics` (`nid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) VALUES(3, 1289000993, '', 1, 1);
INSERT INTO `#__dos_node_comment_statistics` (`nid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) VALUES(4, 1289001068, NULL, 1, 0);
INSERT INTO `#__dos_node_comment_statistics` (`nid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) VALUES(5, 1289001192, NULL, 1, 0);
INSERT INTO `#__dos_node_comment_statistics` (`nid`, `last_comment_timestamp`, `last_comment_name`, `last_comment_uid`, `comment_count`) VALUES(6, 1289002470, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_node_counter`
--

CREATE TABLE IF NOT EXISTS `#__dos_node_counter` (
  `nid` int(11) NOT NULL default '0',
  `totalcount` bigint(20) unsigned NOT NULL default '0',
  `daycount` mediumint(8) unsigned NOT NULL default '0',
  `timestamp` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_node_counter`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_node_revisions`
--

CREATE TABLE IF NOT EXISTS `#__dos_node_revisions` (
  `nid` int(10) unsigned NOT NULL default '0',
  `vid` int(10) unsigned NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `title` varchar(255) NOT NULL default '',
  `body` longtext NOT NULL,
  `teaser` longtext NOT NULL,
  `log` longtext NOT NULL,
  `timestamp` int(11) NOT NULL default '0',
  `format` int(11) NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `#__dos_node_revisions`
--

INSERT INTO `#__dos_node_revisions` (`nid`, `vid`, `uid`, `title`, `body`, `teaser`, `log`, `timestamp`, `format`) VALUES(1, 1, 1, 'Welcome to Droomla!', 'Thank you for installing Droomla!', 'Thank you for installing Droomla!', '', 1288881657, 2);
INSERT INTO `#__dos_node_revisions` (`nid`, `vid`, `uid`, `title`, `body`, `teaser`, `log`, `timestamp`, `format`) VALUES(2, 2, 1, 'Marvin the Paranoid Android', '<p><b><img style="margin: 10px; float: left;" src="http://upload.wikimedia.org/wikipedia/en/thumb/2/25/Marvin-TV-3.jpg/240px-Marvin-TV-3.jpg" />Marvin, the Paranoid Android</b> is a <a href="http://en.wikipedia.org/wiki/Fictional_character" title="Fictional  character" class="mw-redirect">fictional character</a> in <i><a href="http://en.wikipedia.org/wiki/The_Hitchhiker%27s_Guide_to_the_Galaxy" title="The Hitchhiker''s Guide to the Galaxy">The Hitchhiker''s Guide to  the Galaxy</a></i> series by <a href="http://en.wikipedia.org/wiki/Douglas_Adams" title="Douglas Adams">Douglas  Adams</a>. Marvin is the ship''s <a href="http://en.wikipedia.org/wiki/Robot" title="Robot">robot</a> aboard  the <a href="http://en.wikipedia.org/wiki/Starship" title="Starship">starship</a> <i><a href="http://en.wikipedia.org/wiki/Heart_of_Gold_%28spaceship%29" title="Heart of Gold (spaceship)" class="mw-redirect">Heart of Gold</a></i>.  He was built as a failed <a href="http://en.wikipedia.org/wiki/Prototype" title="Prototype">prototype</a> of <a href="http://en.wikipedia.org/wiki/Sirius_Cybernetics_Corporation" title="Sirius Cybernetics Corporation" class="mw-redirect">Sirius  Cybernetics Corporation</a>''s <i>GPP</i> (<a href="#Genuine_People_Personalities" title="Sirius Cybernetics Corporation" class="mw-redirect">Genuine  People Personalities</a>) technology. Marvin is afflicted with severe <a href="http://en.wikipedia.org/wiki/Clinical_depression" title="Clinical  depression" class="mw-redirect">depression</a> and <a href="http://en.wikipedia.org/wiki/Boredom" title="Boredom">boredom</a>,  in part because he has a "brain the size of a planet" which he is  seldom (if ever) given the chance to use.</p>\r\n<p>Indeed, the true horror of  Marvin''s existence is that no task he could be given would occupy even  the tiniest fraction of his vast intellect. Marvin claims he is 50,000  times more intelligent than a human<sup class="noprint Inline-Template" title="This citation requires a reference to the specific page or range  of pages in which the material appears from September 2010">[<i><a href="http://en.wikipedia.org/wiki/Wikipedia:Citing_sources" title="Wikipedia:Citing sources">page&nbsp;needed</a></i>]</sup>, (or 30  billion times more intelligent than a live mattress) though this is, if  anything, a vast underestimation.&nbsp;</p>\r\n<div style="clear: both;"><!-- --></div>\r\n<p>When kidnapped by the bellicose <a href="#Krikkit" title="Places in The Hitchhiker''s Guide to the Galaxy">Krikkit</a> robots and tied to the interfaces of their intelligent war computer,  Marvin simultaneously manages to plan the entire planet''s military  strategy, solve "all of the major mathematical, physical, chemical,  biological, sociological, philosophical, etymological, meteorological  and psychological problems of the Universe except his own, three times  over," and compose a number of lullabies. He seemed to find this last  task the hardest, and only one, "<a href="#Marvin.27s_lullaby">How  I Hate the Night</a>", is known.</p>', '<p><b><img style="margin: 10px; float: left;" src="http://upload.wikimedia.org/wikipedia/en/thumb/2/25/Marvin-TV-3.jpg/240px-Marvin-TV-3.jpg" />Marvin, the Paranoid Android</b> is a <a href="http://en.wikipedia.org/wiki/Fictional_character" title="Fictional  character" class="mw-redirect">fictional character</a> in <i><a href="http://en.wikipedia.org/wiki/The_Hitchhiker%27s_Guide_to_the_Galaxy" title="The Hitchhiker''s Guide to the Galaxy">The Hitchhiker''s Guide to  the Galaxy</a></i> series by <a href="http://en.wikipedia.org/wiki/Douglas_Adams" title="Douglas Adams">Douglas  Adams</a>.', '', 1289000382, 2);
INSERT INTO `#__dos_node_revisions` (`nid`, `vid`, `uid`, `title`, `body`, `teaser`, `log`, `timestamp`, `format`) VALUES(3, 3, 1, 'Marvin!', '<!--break--><img src="http://img86.exs.cx/img86/4172/marvin2wc.png" />', '', '', 1289000954, 2);
INSERT INTO `#__dos_node_revisions` (`nid`, `vid`, `uid`, `title`, `body`, `teaser`, `log`, `timestamp`, `format`) VALUES(4, 4, 1, 'This is a book page!', '<img alt="articles" src="images/stories/articles.jpg" height="96" width="128" /><br /><br />All About books!', '<img alt="articles" src="images/stories/articles.jpg" height="96" width="128" /><br /><br />All About books!', '', 1289001068, 2);
INSERT INTO `#__dos_node_revisions` (`nid`, `vid`, `uid`, `title`, `body`, `teaser`, `log`, `timestamp`, `format`) VALUES(5, 5, 1, 'And this is a plain old page...', '<div><a href="http://en.wikipedia.org/wiki/File:Gunpowder_Plot_conspirators.jpg" class="image" title="Contemporary engraving of eight of the thirteen  plotters"><img alt="Contemporary engraving of eight of the thirteen  plotters" src="http://upload.wikimedia.org/wikipedia/en/thumb/c/c2/Gunpowder_Plot_conspirators.jpg/100px-Gunpowder_Plot_conspirators.jpg" height="52" width="100" /></a></div>\r\nThe <b><a href="http://en.wikipedia.org/wiki/Gunpowder_Plot" title="Gunpowder Plot">Gunpowder Plot</a></b> of 1605 was a failed  assassination attempt against <a href="http://en.wikipedia.org/wiki/James_I_of_England" title="James I of  England">King James&nbsp;I of England and VI of Scotland</a> by a group of  provincial <a href="http://en.wikipedia.org/wiki/Roman_Catholicism_in_England_and_Wales" title="Roman Catholicism in England and Wales" class="mw-redirect">English  Catholics</a> led by <a href="http://en.wikipedia.org/wiki/Robert_Catesby" title="Robert  Catesby">Sir Robert Catesby</a>. The plan was to blow up the <a href="http://en.wikipedia.org/wiki/House_of_Lords" title="House of  Lords">House of Lords</a> during the <a href="http://en.wikipedia.org/wiki/State_Opening_of_Parliament" title="State Opening of Parliament">State Opening of Parliament</a> on  5&nbsp;November, as the prelude to a popular revolt in the <a href="http://en.wikipedia.org/wiki/English_Midlands" title="English  Midlands">Midlands</a> during which James''s nine-year-old daughter, <a href="http://en.wikipedia.org/wiki/Elizabeth_of_Bohemia" title="Elizabeth of Bohemia">Princess Elizabeth</a>, was to be installed  as the Catholic <a href="http://en.wikipedia.org/wiki/Head_of_state" title="Head of state">head of state</a>. Catesby may have embarked on  the scheme after hopes of securing greater religious tolerance under  King James had faded, leaving many English Catholics disappointed. His  fellow plotters were <a href="http://en.wikipedia.org/wiki/John_Wright_%28Gunpowder_Plot%29" title="John Wright (Gunpowder Plot)" class="mw-redirect">John Wright</a>,  <a href="http://en.wikipedia.org/wiki/Thomas_Wintour" title="Thomas  Wintour" class="mw-redirect">Thomas Wintour</a>, <a href="http://en.wikipedia.org/wiki/Thomas_Percy_%28Gunpowder_Plot%29" title="Thomas Percy (Gunpowder Plot)">Thomas Percy</a>, <a href="http://en.wikipedia.org/wiki/Guy_Fawkes" title="Guy Fawkes">Guy  Fawkes</a>, <a href="http://en.wikipedia.org/wiki/Robert_Keyes" title="Robert Keyes">Robert Keyes</a>, <a href="http://en.wikipedia.org/wiki/Thomas_Bates" title="Thomas Bates">Thomas  Bates</a>, <a href="http://en.wikipedia.org/wiki/Robert_Wintour" title="Robert Wintour" class="mw-redirect">Robert Wintour</a>, <a href="http://en.wikipedia.org/wiki/Christopher_Wright" title="Christopher Wright" class="mw-redirect">Christopher Wright</a>, <a href="http://en.wikipedia.org/wiki/John_Grant_%28Gunpowder_Plot%29" title="John Grant (Gunpowder Plot)">John Grant</a>, <a href="http://en.wikipedia.org/wiki/Ambrose_Rookwood" title="Ambrose  Rookwood">Sir Ambrose Rookwood</a>, <a href="http://en.wikipedia.org/wiki/Everard_Digby" title="Everard Digby">Sir  Everard Digby</a> and <a href="http://en.wikipedia.org/wiki/Francis_Tresham" title="Francis  Tresham">Francis Tresham</a>. Fawkes, who had 10&nbsp;years of military  experience fighting in the <a href="http://en.wikipedia.org/wiki/Southern_Netherlands" title="Southern  Netherlands">Spanish Netherlands</a> in suppression of the <a href="http://en.wikipedia.org/wiki/Dutch_Revolt" title="Dutch Revolt">Dutch  Revolt</a>, was given charge of the explosives.\r\n<!--break-->\r\nBody Content', '<div><a href="http://en.wikipedia.org/wiki/File:Gunpowder_Plot_conspirators.jpg" class="image" title="Contemporary engraving of eight of the thirteen  plotters"><img alt="Contemporary engraving of eight of the thirteen  plotters" src="http://upload.wikimedia.org/wikipedia/en/thumb/c/c2/Gunpowder_Plot_conspirators.jpg/100px-Gunpowder_Plot_conspirators.jpg" height="52" width="100" /></a></div>\r\nThe <b><a href="http://en.wikipedia.org/wiki/Gunpowder_Plot" title="Gunpowder Plot">Gunpowder Plot</a></b> of 1605 was a failed  assassination attempt against <a href="http://en.wikipedia.org/wiki/James_I_of_England" title="James I of  England">King James&nbsp;I of England and VI of Scotland</a> by a group of  provincial <a href="http://en.wikipedia.org/wiki/Roman_Catholicism_in_England_and_Wales" title="Roman Catholicism in England and Wales" class="mw-redirect">English  Catholics</a> led by <a href="http://en.wikipedia.org/wiki/Robert_Catesby" title="Robert  Catesby">Sir Robert Catesby</a>. The plan was to blow up the <a href="http://en.wikipedia.org/wiki/House_of_Lords" title="House of  Lords">House of Lords</a> during the <a href="http://en.wikipedia.org/wiki/State_Opening_of_Parliament" title="State Opening of Parliament">State Opening of Parliament</a> on  5&nbsp;November, as the prelude to a popular revolt in the <a href="http://en.wikipedia.org/wiki/English_Midlands" title="English  Midlands">Midlands</a> during which James''s nine-year-old daughter, <a href="http://en.wikipedia.org/wiki/Elizabeth_of_Bohemia" title="Elizabeth of Bohemia">Princess Elizabeth</a>, was to be installed  as the Catholic <a href="http://en.wikipedia.org/wiki/Head_of_state" title="Head of state">head of state</a>. Catesby may have embarked on  the scheme after hopes of securing greater religious tolerance under  King James had faded, leaving many English Catholics disappointed. His  fellow plotters were <a href="http://en.wikipedia.org/wiki/John_Wright_%28Gunpowder_Plot%29" title="John Wright (Gunpowder Plot)" class="mw-redirect">John Wright</a>,  <a href="http://en.wikipedia.org/wiki/Thomas_Wintour" title="Thomas  Wintour" class="mw-redirect">Thomas Wintour</a>, <a href="http://en.wikipedia.org/wiki/Thomas_Percy_%28Gunpowder_Plot%29" title="Thomas Percy (Gunpowder Plot)">Thomas Percy</a>, <a href="http://en.wikipedia.org/wiki/Guy_Fawkes" title="Guy Fawkes">Guy  Fawkes</a>, <a href="http://en.wikipedia.org/wiki/Robert_Keyes" title="Robert Keyes">Robert Keyes</a>, <a href="http://en.wikipedia.org/wiki/Thomas_Bates" title="Thomas Bates">Thomas  Bates</a>, <a href="http://en.wikipedia.org/wiki/Robert_Wintour" title="Robert Wintour" class="mw-redirect">Robert Wintour</a>, <a href="http://en.wikipedia.org/wiki/Christopher_Wright" title="Christopher Wright" class="mw-redirect">Christopher Wright</a>, <a href="http://en.wikipedia.org/wiki/John_Grant_%28Gunpowder_Plot%29" title="John Grant (Gunpowder Plot)">John Grant</a>, <a href="http://en.wikipedia.org/wiki/Ambrose_Rookwood" title="Ambrose  Rookwood">Sir Ambrose Rookwood</a>, <a href="http://en.wikipedia.org/wiki/Everard_Digby" title="Everard Digby">Sir  Everard Digby</a> and <a href="http://en.wikipedia.org/wiki/Francis_Tresham" title="Francis  Tresham">Francis Tresham</a>. Fawkes, who had 10&nbsp;years of military  experience fighting in the <a href="http://en.wikipedia.org/wiki/Southern_Netherlands" title="Southern  Netherlands">Spanish Netherlands</a> in suppression of the <a href="http://en.wikipedia.org/wiki/Dutch_Revolt" title="Dutch Revolt">Dutch  Revolt</a>, was given charge of the explosives.\r\n', '', 1289001192, 2);
INSERT INTO `#__dos_node_revisions` (`nid`, `vid`, `uid`, `title`, `body`, `teaser`, `log`, `timestamp`, `format`) VALUES(6, 6, 1, 'This is a book', '<img src="http://t0.gstatic.com/images?q=tbn:ANd9GcTznzelFmOa5U50ZOjwx2fdYeIHO5LLbKrppN8u0ZEO78s9nlQ&amp;t=1&amp;usg=___0OLn83S6ueNhHhURlqTqBqzQ2s=" />A book<br />', '<img src="http://t0.gstatic.com/images?q=tbn:ANd9GcTznzelFmOa5U50ZOjwx2fdYeIHO5LLbKrppN8u0ZEO78s9nlQ&amp;t=1&amp;usg=___0OLn83S6ueNhHhURlqTqBqzQ2s=" />A book<br />', '', 1289002470, 1);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_node_type`
--

CREATE TABLE IF NOT EXISTS `#__dos_node_type` (
  `type` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL default '',
  `module` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `help` mediumtext NOT NULL,
  `has_title` tinyint(3) unsigned NOT NULL,
  `title_label` varchar(255) NOT NULL default '',
  `has_body` tinyint(3) unsigned NOT NULL,
  `body_label` varchar(255) NOT NULL default '',
  `min_word_count` smallint(5) unsigned NOT NULL,
  `custom` tinyint(4) NOT NULL default '0',
  `modified` tinyint(4) NOT NULL default '0',
  `locked` tinyint(4) NOT NULL default '0',
  `orig_type` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_node_type`
--

INSERT INTO `#__dos_node_type` (`type`, `name`, `module`, `description`, `help`, `has_title`, `title_label`, `has_body`, `body_label`, `min_word_count`, `custom`, `modified`, `locked`, `orig_type`) VALUES('page', 'Page', 'node', 'A <em>page</em>, similar in form to a <em>story</em>, is a simple method for creating and displaying information that rarely changes, such as an "About us" section of a website. By default, a <em>page</em> entry does not allow visitor comments and is not featured on the site''s initial home page.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, 'page');
INSERT INTO `#__dos_node_type` (`type`, `name`, `module`, `description`, `help`, `has_title`, `title_label`, `has_body`, `body_label`, `min_word_count`, `custom`, `modified`, `locked`, `orig_type`) VALUES('story', 'Story', 'node', 'A <em>story</em>, similar in form to a <em>page</em>, is ideal for creating and displaying content that informs or engages website visitors. Press releases, site announcements, and informal blog-like entries may all be created with a <em>story</em> entry. By default, a <em>story</em> entry is automatically featured on the site''s initial home page, and provides the ability to post comments.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, 'story');
INSERT INTO `#__dos_node_type` (`type`, `name`, `module`, `description`, `help`, `has_title`, `title_label`, `has_body`, `body_label`, `min_word_count`, `custom`, `modified`, `locked`, `orig_type`) VALUES('book', 'Book page', 'node', 'A <em>book page</em> is a page of content, organized into a collection of related entries collectively known as a <em>book</em>. A <em>book page</em> automatically displays links to adjacent pages, providing a simple navigation system for organizing and reviewing structured content.', '', 1, 'Title', 1, 'Body', 0, 1, 1, 0, 'book');
INSERT INTO `#__dos_node_type` (`type`, `name`, `module`, `description`, `help`, `has_title`, `title_label`, `has_body`, `body_label`, `min_word_count`, `custom`, `modified`, `locked`, `orig_type`) VALUES('blog', 'Blog entry', 'blog', 'A <em>blog entry</em> is a single post to an online journal, or <em>blog</em>.', '', 1, 'Title', 1, 'Body', 0, 0, 0, 1, 'blog');
INSERT INTO `#__dos_node_type` (`type`, `name`, `module`, `description`, `help`, `has_title`, `title_label`, `has_body`, `body_label`, `min_word_count`, `custom`, `modified`, `locked`, `orig_type`) VALUES('forum', 'Forum topic', 'forum', 'A <em>forum topic</em> is the initial post to a new discussion thread within a forum.', '', 1, 'Subject', 1, 'Body', 0, 0, 0, 1, 'forum');

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_permission`
--

CREATE TABLE IF NOT EXISTS `#__dos_permission` (
  `pid` int(11) NOT NULL auto_increment,
  `rid` int(10) unsigned NOT NULL default '0',
  `perm` longtext,
  `tid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`pid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `#__dos_permission`
--

INSERT INTO `#__dos_permission` (`pid`, `rid`, `perm`, `tid`) VALUES(10, 1, 'access content', 0);
INSERT INTO `#__dos_permission` (`pid`, `rid`, `perm`, `tid`) VALUES(11, 2, 'create blog entries, delete own blog entries, edit own blog entries, access comments, post comments, post comments without approval, access site-wide contact form, create forum topics, delete own forum topics, edit own forum topics, access content, create story content, delete own story content, edit own story content, revert revisions, view revisions, search content, use advanced search, upload files, view uploaded files, access user profiles', 0);
INSERT INTO `#__dos_permission` (`pid`, `rid`, `perm`, `tid`) VALUES(18, 3, 'administer blocks, use PHP for block visibility, create blog entries, delete own blog entries, delete any blog entry, edit own blog entries, edit any blog entry, administer content with blog api, access comments, post comments, administer comments, post comments without approval, access site-wide contact form, administer site-wide contact form, administer filters, administer menu, administer content types, administer nodes, access content, view revisions, revert revisions, delete revisions, create book content, delete own book content, delete any book content, edit own book content, edit any book content, create page content, delete own page content, delete any page content, edit own page content, edit any page content, create story content, delete own story content, delete any story content, edit own story content, edit any story content, create url aliases, administer url aliases, search content, use advanced search, administer search, access statistics, view post access counter, administer site configuration, access administration pages, administer actions, access site reports, select different theme, administer files, administer taxonomy, upload files, view uploaded files, administer permissions, administer users, access user profiles, change own username, use admin toolbar, create forum topics, delete own forum topics, delete any forum topic, edit own forum topics, edit any forum topic, administer forums, administer pathauto, notify of path changes', 0);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_role`
--

CREATE TABLE IF NOT EXISTS `#__dos_role` (
  `rid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(64) NOT NULL default '',
  PRIMARY KEY  (`rid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `#__dos_role`
--

INSERT INTO `#__dos_role` (`rid`, `name`) VALUES(1, 'anonymous user');
INSERT INTO `#__dos_role` (`rid`, `name`) VALUES(2, 'authenticated user');
INSERT INTO `#__dos_role` (`rid`, `name`) VALUES(3, 'administrator');

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_search_dataset`
--

CREATE TABLE IF NOT EXISTS `#__dos_search_dataset` (
  `sid` int(10) unsigned NOT NULL default '0',
  `type` varchar(16) default NULL,
  `data` longtext NOT NULL,
  `reindex` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `sid_type` (`sid`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_search_dataset`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_search_index`
--

CREATE TABLE IF NOT EXISTS `#__dos_search_index` (
  `word` varchar(50) NOT NULL default '',
  `sid` int(10) unsigned NOT NULL default '0',
  `type` varchar(16) default NULL,
  `score` float default NULL,
  UNIQUE KEY `word_sid_type` (`word`,`sid`,`type`),
  KEY `sid_type` (`sid`,`type`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_search_index`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_search_node_links`
--

CREATE TABLE IF NOT EXISTS `#__dos_search_node_links` (
  `sid` int(10) unsigned NOT NULL default '0',
  `type` varchar(16) NOT NULL default '',
  `nid` int(10) unsigned NOT NULL default '0',
  `caption` longtext,
  PRIMARY KEY  (`sid`,`type`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_search_node_links`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_search_total`
--

CREATE TABLE IF NOT EXISTS `#__dos_search_total` (
  `word` varchar(50) NOT NULL default '',
  `count` float default NULL,
  PRIMARY KEY  (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_search_total`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_semaphore`
--

CREATE TABLE IF NOT EXISTS `#__dos_semaphore` (
  `name` varchar(255) NOT NULL default '',
  `value` varchar(255) NOT NULL default '',
  `expire` double NOT NULL,
  PRIMARY KEY  (`name`),
  KEY `expire` (`expire`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_semaphore`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_sessions`
--

CREATE TABLE IF NOT EXISTS `#__dos_sessions` (
  `uid` int(10) unsigned NOT NULL,
  `sid` varchar(64) NOT NULL default '',
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  `cache` int(11) NOT NULL default '0',
  `session` longtext,
  PRIMARY KEY  (`sid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_sessions`
--

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_system`
--

CREATE TABLE IF NOT EXISTS `#__dos_system` (
  `filename` varchar(255) NOT NULL default '',
  `name` varchar(255) NOT NULL default '',
  `type` varchar(255) NOT NULL default '',
  `owner` varchar(255) NOT NULL default '',
  `status` int(11) NOT NULL default '0',
  `throttle` tinyint(4) NOT NULL default '0',
  `bootstrap` int(11) NOT NULL default '0',
  `schema_version` smallint(6) NOT NULL default '-1',
  `weight` int(11) NOT NULL default '0',
  `info` text,
  PRIMARY KEY  (`filename`),
  KEY `modules` (`type`(12),`status`,`weight`,`filename`),
  KEY `bootstrap` (`type`(12),`status`,`bootstrap`,`weight`,`filename`),
  KEY `type_name` (`type`(12),`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_system`
--

INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('themes/rubik/cube/cube.info', 'cube', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:17:{s:4:"name";s:4:"Cube";s:11:"description";s:44:"Spaces-aware front-end theme based on Rubik.";s:10:"base theme";s:5:"rubik";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:11:"stylesheets";a:1:{s:6:"screen";a:1:{s:9:"style.css";s:27:"themes/rubik/cube/style.css";}}s:7:"regions";a:4:{s:6:"header";s:6:"Header";s:7:"content";s:7:"Content";s:4:"left";s:4:"Left";s:5:"right";s:5:"Right";}s:9:"designkit";a:2:{s:5:"color";a:1:{s:10:"background";s:7:"#0088cc";}s:4:"logo";a:2:{s:4:"logo";s:23:"imagecache_scale:200x50";s:5:"print";s:24:"imagecache_scale:600x150";}}s:7:"layouts";a:5:{s:7:"default";a:3:{s:4:"name";s:7:"Default";s:11:"description";s:23:"Simple one column page.";s:8:"template";s:4:"page";}s:7:"sidebar";a:5:{s:4:"name";s:7:"Sidebar";s:11:"description";s:26:"Main content with sidebar.";s:10:"stylesheet";s:18:"layout-sidebar.css";s:8:"template";s:14:"layout-sidebar";s:7:"regions";a:2:{i:0;s:7:"content";i:1;s:5:"right";}}s:5:"split";a:5:{s:4:"name";s:5:"Split";s:11:"description";s:12:"50/50 split.";s:10:"stylesheet";s:16:"layout-split.css";s:8:"template";s:14:"layout-sidebar";s:7:"regions";a:2:{i:0;s:7:"content";i:1;s:5:"right";}}s:7:"columns";a:5:{s:4:"name";s:7:"Columns";s:11:"description";s:20:"Three column layout.";s:10:"stylesheet";s:18:"layout-columns.css";s:8:"template";s:14:"layout-columns";s:7:"regions";a:4:{i:0;s:6:"header";i:1;s:7:"content";i:2;s:4:"left";i:3;s:5:"right";}}s:6:"offset";a:5:{s:4:"name";s:15:"Offset sidebars";s:11:"description";s:38:"Main content with two offset sidebars.";s:10:"stylesheet";s:17:"layout-offset.css";s:8:"template";s:13:"layout-offset";s:7:"regions";a:4:{i:0;s:6:"header";i:1;s:7:"content";i:2;s:4:"left";i:3;s:5:"right";}}}s:9:"datestamp";s:10:"1285701991";s:7:"project";s:5:"rubik";s:18:"project status url";s:39:"http://code.developmentseed.org/fserver";s:7:"version";s:13:"6.x-3.0-beta2";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:7:"scripts";a:1:{s:9:"script.js";s:27:"themes/rubik/cube/script.js";}s:10:"screenshot";s:32:"themes/rubik/cube/screenshot.png";s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('themes/rubik/rubik.info', 'rubik', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 1, 0, 0, -1, 0, 'a:15:{s:4:"name";s:5:"Rubik";s:11:"description";s:18:"Clean admin theme.";s:10:"base theme";s:3:"tao";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:1:{s:7:"droomla";s:13:"Joomla Region";}s:7:"scripts";a:1:{s:11:"js/rubik.js";s:24:"themes/rubik/js/rubik.js";}s:11:"stylesheets";a:1:{s:6:"screen";a:3:{s:8:"core.css";s:21:"themes/rubik/core.css";s:9:"icons.css";s:22:"themes/rubik/icons.css";s:9:"style.css";s:22:"themes/rubik/style.css";}}s:9:"datestamp";s:10:"1285701991";s:7:"project";s:5:"rubik";s:18:"project status url";s:39:"http://code.developmentseed.org/fserver";s:7:"version";s:13:"6.x-3.0-beta2";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:27:"themes/rubik/screenshot.png";s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/system/system.module', 'system', 'module', '', 1, 0, 0, 6055, 0, 'a:10:{s:4:"name";s:6:"System";s:11:"description";s:54:"Handles general site configuration for administrators.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/aggregator/aggregator.module', 'aggregator', 'module', '', 0, 0, 0, 0, 0, 'a:10:{s:4:"name";s:10:"Aggregator";s:11:"description";s:57:"Aggregates syndicated content (RSS, RDF, and Atom feeds).";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/block/block.module', 'block', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:5:"Block";s:11:"description";s:62:"Controls the boxes that are displayed around the main content.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/blog/blog.module', 'blog', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Blog";s:11:"description";s:69:"Enables keeping easily and regularly updated user web pages or blogs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/blogapi/blogapi.module', 'blogapi', 'module', '', 1, 0, 0, 6001, 0, 'a:10:{s:4:"name";s:8:"Blog API";s:11:"description";s:79:"Allows users to post content using applications that support XML-RPC blog APIs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/book/book.module', 'book', 'module', '', 0, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:4:"Book";s:11:"description";s:63:"Allows users to structure site pages in a hierarchy or outline.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/color/color.module', 'color', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:5:"Color";s:11:"description";s:61:"Allows the user to change the color scheme of certain themes.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/comment/comment.module', 'comment', 'module', '', 1, 0, 0, 6003, 0, 'a:10:{s:4:"name";s:7:"Comment";s:11:"description";s:57:"Allows users to comment on and discuss published content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/contact/contact.module', 'contact', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:7:"Contact";s:11:"description";s:61:"Enables the use of both personal and site-wide contact forms.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/dblog/dblog.module', 'dblog', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:16:"Database logging";s:11:"description";s:47:"Logs and records system events to the database.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/filter/filter.module', 'filter', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Filter";s:11:"description";s:60:"Handles the filtering of content in preparation for display.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/forum/forum.module', 'forum', 'module', '', 1, 0, 0, 6000, 1, 'a:10:{s:4:"name";s:5:"Forum";s:11:"description";s:50:"Enables threaded discussions about general topics.";s:12:"dependencies";a:2:{i:0;s:8:"taxonomy";i:1;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/help/help.module', 'help', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Help";s:11:"description";s:35:"Manages the display of online help.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/locale/locale.module', 'locale', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"Locale";s:11:"description";s:119:"Adds language handling functionality and enables the translation of the user interface to languages other than English.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/menu/menu.module', 'menu', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Menu";s:11:"description";s:60:"Allows administrators to customize the site navigation menu.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/node/node.module', 'node', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Node";s:11:"description";s:66:"Allows content to be submitted to the site and displayed on pages.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/openid/openid.module', 'openid', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:6:"OpenID";s:11:"description";s:48:"Allows users to log into your site using OpenID.";s:7:"version";s:4:"6.19";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/path/path.module', 'path', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"Path";s:11:"description";s:28:"Allows users to rename URLs.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/php/php.module', 'php', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:10:"PHP filter";s:11:"description";s:50:"Allows embedded PHP code/snippets to be evaluated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/ping/ping.module', 'ping', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Ping";s:11:"description";s:51:"Alerts other sites when your site has been updated.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/poll/poll.module', 'poll', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:4:"Poll";s:11:"description";s:95:"Allows your site to capture votes on different topics in the form of multiple choice questions.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/profile/profile.module', 'profile', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Profile";s:11:"description";s:36:"Supports configurable user profiles.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/search/search.module', 'search', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Search";s:11:"description";s:36:"Enables site-wide keyword searching.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/statistics/statistics.module', 'statistics', 'module', '', 1, 0, 1, 6000, 0, 'a:10:{s:4:"name";s:10:"Statistics";s:11:"description";s:37:"Logs access statistics for your site.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/syslog/syslog.module', 'syslog', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Syslog";s:11:"description";s:41:"Logs and records system events to syslog.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/taxonomy/taxonomy.module', 'taxonomy', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:8:"Taxonomy";s:11:"description";s:38:"Enables the categorization of content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/throttle/throttle.module', 'throttle', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:8:"Throttle";s:11:"description";s:66:"Handles the auto-throttling mechanism, to control site congestion.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/tracker/tracker.module', 'tracker', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Tracker";s:11:"description";s:43:"Enables tracking of recent posts for users.";s:12:"dependencies";a:1:{i:0;s:7:"comment";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/translation/translation.module', 'translation', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:19:"Content translation";s:11:"description";s:57:"Allows content to be translated into different languages.";s:12:"dependencies";a:1:{i:0;s:6:"locale";}s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/trigger/trigger.module', 'trigger', 'module', '', 0, 0, 0, -1, 0, 'a:10:{s:4:"name";s:7:"Trigger";s:11:"description";s:90:"Enables actions to be fired on certain system events, such as when new content is created.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/update/update.module', 'update', 'module', '', 1, 0, 0, 6000, 0, 'a:10:{s:4:"name";s:13:"Update status";s:11:"description";s:88:"Checks the status of available updates for Drupal and your installed modules and themes.";s:7:"version";s:4:"6.19";s:7:"package";s:15:"Core - optional";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/upload/upload.module', 'upload', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:6:"Upload";s:11:"description";s:51:"Allows users to upload and attach files to content.";s:7:"package";s:15:"Core - optional";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/user/user.module', 'user', 'module', '', 1, 0, 0, 0, 0, 'a:10:{s:4:"name";s:4:"User";s:11:"description";s:47:"Manages the user registration and login system.";s:7:"package";s:15:"Core - required";s:7:"version";s:4:"6.19";s:4:"core";s:3:"6.x";s:7:"project";s:6:"drupal";s:9:"datestamp";s:10:"1281559292";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/admin/admin.module', 'admin', 'module', '', 1, 0, 0, 6202, 1, 'a:10:{s:4:"name";s:5:"Admin";s:11:"description";s:42:"UI helpers for Drupal admins and managers.";s:7:"package";s:14:"Administration";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-2.0";s:7:"project";s:5:"admin";s:9:"datestamp";s:10:"1282226188";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('themes/tao/tao.info', 'tao', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:13:{s:4:"core";s:3:"6.x";s:11:"description";s:149:"Tao is a base theme that is all about going with the flow. It takes care of key reset and utility tasks so that sub-themes can get on with their job.";s:6:"engine";s:11:"phptemplate";s:4:"name";s:3:"Tao";s:7:"regions";a:5:{s:4:"left";s:12:"Left sidebar";s:5:"right";s:13:"Right sidebar";s:7:"content";s:7:"Content";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";}s:7:"scripts";a:1:{s:9:"js/tao.js";s:20:"themes/tao/js/tao.js";}s:11:"stylesheets";a:3:{s:6:"screen";a:3:{s:9:"reset.css";s:20:"themes/tao/reset.css";s:10:"drupal.css";s:21:"themes/tao/drupal.css";s:8:"base.css";s:19:"themes/tao/base.css";}s:5:"print";a:3:{s:9:"reset.css";s:20:"themes/tao/reset.css";s:8:"base.css";s:19:"themes/tao/base.css";s:9:"print.css";s:20:"themes/tao/print.css";}s:3:"all";a:20:{s:9:"admin.css";s:20:"themes/tao/admin.css";s:9:"block.css";s:20:"themes/tao/block.css";s:8:"book.css";s:19:"themes/tao/book.css";s:11:"comment.css";s:22:"themes/tao/comment.css";s:9:"dblog.css";s:20:"themes/tao/dblog.css";s:12:"defaults.css";s:23:"themes/tao/defaults.css";s:9:"forum.css";s:20:"themes/tao/forum.css";s:8:"help.css";s:19:"themes/tao/help.css";s:15:"maintenance.css";s:26:"themes/tao/maintenance.css";s:8:"node.css";s:19:"themes/tao/node.css";s:10:"openid.css";s:21:"themes/tao/openid.css";s:8:"poll.css";s:19:"themes/tao/poll.css";s:11:"profile.css";s:22:"themes/tao/profile.css";s:10:"search.css";s:21:"themes/tao/search.css";s:10:"system.css";s:21:"themes/tao/system.css";s:16:"system-menus.css";s:27:"themes/tao/system-menus.css";s:12:"taxonomy.css";s:23:"themes/tao/taxonomy.css";s:11:"tracker.css";s:22:"themes/tao/tracker.css";s:10:"update.css";s:21:"themes/tao/update.css";s:8:"user.css";s:19:"themes/tao/user.css";}}s:7:"version";s:7:"6.x-3.2";s:7:"project";s:3:"tao";s:9:"datestamp";s:10:"1287680788";s:8:"features";a:10:{i:0;s:20:"comment_user_picture";i:1;s:7:"favicon";i:2;s:7:"mission";i:3;s:4:"logo";i:4;s:4:"name";i:5;s:17:"node_user_picture";i:6;s:6:"search";i:7;s:6:"slogan";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:10:"screenshot";s:25:"themes/tao/screenshot.png";s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/adminrole/adminrole.module', 'adminrole', 'module', '', 1, 0, 0, 5100, 0, 'a:10:{s:4:"name";s:10:"Admin Role";s:11:"description";s:54:"Automatically assign all permissions to an admin role.";s:7:"package";s:14:"Administration";s:4:"core";s:3:"6.x";s:7:"version";s:7:"6.x-1.3";s:7:"project";s:9:"adminrole";s:9:"datestamp";s:10:"1281809488";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/pathauto/pathauto.module', 'pathauto', 'module', '', 1, 0, 0, 7, 1, 'a:10:{s:4:"name";s:8:"Pathauto";s:11:"description";s:95:"Provides a mechanism for modules to automatically generate aliases for the content they manage.";s:12:"dependencies";a:2:{i:0;s:4:"path";i:1;s:5:"token";}s:4:"core";s:3:"6.x";s:10:"recommends";a:1:{i:0;s:13:"path_redirect";}s:7:"version";s:7:"6.x-1.5";s:7:"project";s:8:"pathauto";s:9:"datestamp";s:10:"1286469664";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/token/token.module', 'token', 'module', '', 1, 0, 0, 1, 10, 'a:9:{s:4:"name";s:5:"Token";s:11:"description";s:79:"Provides a shared API for replacement of textual placeholders with actual data.";s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.15";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1286469963";s:12:"dependencies";a:0:{}s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/token/tokenSTARTER.module', 'tokenSTARTER', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:12:"TokenSTARTER";s:11:"description";s:72:"Provides additional tokens and a base on which to build your own tokens.";s:12:"dependencies";a:1:{i:0;s:5:"token";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.15";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1286469963";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('modules/token/token_actions.module', 'token_actions', 'module', '', 0, 0, 0, -1, 0, 'a:9:{s:4:"name";s:13:"Token actions";s:11:"description";s:73:"Provides enhanced versions of core Drupal actions using the Token module.";s:12:"dependencies";a:1:{i:0;s:5:"token";}s:4:"core";s:3:"6.x";s:7:"version";s:8:"6.x-1.15";s:7:"project";s:5:"token";s:9:"datestamp";s:10:"1286469963";s:10:"dependents";a:0:{}s:3:"php";s:5:"4.3.5";}');
INSERT INTO `#__dos_system` (`filename`, `name`, `type`, `owner`, `status`, `throttle`, `bootstrap`, `schema_version`, `weight`, `info`) VALUES('themes/zen/zen.info', 'zen', 'theme', 'themes/engines/phptemplate/phptemplate.engine', 0, 0, 0, -1, 0, 'a:15:{s:4:"name";s:3:"Zen";s:11:"description";s:189:"Zen sub-themes are the ultimate starting themes for Drupal 6. Read the <a href="http://drupal.org/node/226507">online docs</a> or the included README-FIRST.txt on how to create a sub-theme.";s:10:"screenshot";s:39:"themes/zen/zen-internals/screenshot.png";s:4:"core";s:3:"6.x";s:6:"engine";s:11:"phptemplate";s:7:"regions";a:10:{s:7:"droomla";s:13:"Joomla Region";s:13:"sidebar_first";s:13:"First sidebar";s:14:"sidebar_second";s:14:"Second sidebar";s:10:"navigation";s:14:"Navigation bar";s:9:"highlight";s:19:"Highlighted content";s:11:"content_top";s:11:"Content top";s:14:"content_bottom";s:14:"Content bottom";s:6:"header";s:6:"Header";s:6:"footer";s:6:"Footer";s:12:"page_closure";s:12:"Page closure";}s:8:"features";a:10:{i:0;s:4:"logo";i:1;s:4:"name";i:2;s:6:"slogan";i:3;s:7:"mission";i:4;s:17:"node_user_picture";i:5;s:20:"comment_user_picture";i:6;s:6:"search";i:7;s:7:"favicon";i:8;s:13:"primary_links";i:9;s:15:"secondary_links";}s:8:"settings";a:9:{s:17:"zen_block_editing";s:1:"1";s:14:"zen_breadcrumb";s:3:"yes";s:24:"zen_breadcrumb_separator";s:3:" - ";s:19:"zen_breadcrumb_home";s:1:"1";s:23:"zen_breadcrumb_trailing";s:1:"1";s:20:"zen_breadcrumb_title";s:1:"0";s:10:"zen_layout";s:18:"zen-columns-liquid";s:20:"zen_rebuild_registry";s:1:"0";s:14:"zen_wireframes";s:1:"0";}s:7:"plugins";a:1:{s:6:"panels";a:1:{s:7:"layouts";s:7:"layouts";}}s:7:"version";s:7:"6.x-2.0";s:7:"project";s:3:"zen";s:9:"datestamp";s:10:"1277583313";s:11:"stylesheets";a:1:{s:3:"all";a:1:{s:9:"style.css";s:20:"themes/zen/style.css";}}s:7:"scripts";a:1:{s:9:"script.js";s:20:"themes/zen/script.js";}s:3:"php";s:5:"4.3.5";}');

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_term_data`
--

CREATE TABLE IF NOT EXISTS `#__dos_term_data` (
  `tid` int(10) unsigned NOT NULL auto_increment,
  `vid` int(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `description` longtext,
  `weight` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `#__dos_term_data`
--

INSERT INTO `#__dos_term_data` (`tid`, `vid`, `name`, `description`, `weight`) VALUES(1, 1, 'Test Container', 'All about Marvin!', 0);
INSERT INTO `#__dos_term_data` (`tid`, `vid`, `name`, `description`, `weight`) VALUES(2, 1, 'Marvins Corner', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_term_hierarchy`
--

CREATE TABLE IF NOT EXISTS `#__dos_term_hierarchy` (
  `tid` int(10) unsigned NOT NULL default '0',
  `parent` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_term_hierarchy`
--

INSERT INTO `#__dos_term_hierarchy` (`tid`, `parent`) VALUES(1, 0);
INSERT INTO `#__dos_term_hierarchy` (`tid`, `parent`) VALUES(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_term_node`
--

CREATE TABLE IF NOT EXISTS `#__dos_term_node` (
  `nid` int(10) unsigned NOT NULL default '0',
  `vid` int(10) unsigned NOT NULL default '0',
  `tid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tid`,`vid`),
  KEY `vid` (`vid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_term_node`
--

INSERT INTO `#__dos_term_node` (`nid`, `vid`, `tid`) VALUES(3, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_term_relation`
--

CREATE TABLE IF NOT EXISTS `#__dos_term_relation` (
  `trid` int(11) NOT NULL auto_increment,
  `tid1` int(10) unsigned NOT NULL default '0',
  `tid2` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`trid`),
  UNIQUE KEY `tid1_tid2` (`tid1`,`tid2`),
  KEY `tid2` (`tid2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_term_relation`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_term_synonym`
--

CREATE TABLE IF NOT EXISTS `#__dos_term_synonym` (
  `tsid` int(11) NOT NULL auto_increment,
  `tid` int(10) unsigned NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`tsid`),
  KEY `tid` (`tid`),
  KEY `name_tid` (`name`,`tid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `#__dos_term_synonym`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_upload`
--

CREATE TABLE IF NOT EXISTS `#__dos_upload` (
  `fid` int(10) unsigned NOT NULL default '0',
  `nid` int(10) unsigned NOT NULL default '0',
  `vid` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL default '',
  `list` tinyint(3) unsigned NOT NULL default '0',
  `weight` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`vid`,`fid`),
  KEY `fid` (`fid`),
  KEY `nid` (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_upload`
--


-- --------------------------------------------------------

--
-- Table structure for table `#__dos_url_alias`
--

CREATE TABLE IF NOT EXISTS `#__dos_url_alias` (
  `pid` int(10) unsigned NOT NULL auto_increment,
  `src` varchar(128) NOT NULL default '',
  `dst` varchar(128) NOT NULL default '',
  `language` varchar(12) NOT NULL default '',
  PRIMARY KEY  (`pid`),
  UNIQUE KEY `dst_language_pid` (`dst`,`language`,`pid`),
  KEY `src_language_pid` (`src`,`language`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `#__dos_url_alias`
--

INSERT INTO `#__dos_url_alias` (`pid`, `src`, `dst`, `language`) VALUES(6, 'user/1', 'users-admin', '');
INSERT INTO `#__dos_url_alias` (`pid`, `src`, `dst`, `language`) VALUES(7, 'node/2', 'marvin-paranoid-android', '');
INSERT INTO `#__dos_url_alias` (`pid`, `src`, `dst`, `language`) VALUES(8, 'node/3', 'marvin', '');
INSERT INTO `#__dos_url_alias` (`pid`, `src`, `dst`, `language`) VALUES(9, 'node/4', 'book-page', '');
INSERT INTO `#__dos_url_alias` (`pid`, `src`, `dst`, `language`) VALUES(10, 'node/5', 'and-plain-old-page', '');
INSERT INTO `#__dos_url_alias` (`pid`, `src`, `dst`, `language`) VALUES(11, 'user/5', 'users-system', '');
INSERT INTO `#__dos_url_alias` (`pid`, `src`, `dst`, `language`) VALUES(12, 'user/4', 'users-adam', '');

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_users`
--

CREATE TABLE IF NOT EXISTS `#__dos_users` (
  `uid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(60) NOT NULL default '',
  `pass` varchar(32) NOT NULL default '',
  `mail` varchar(64) default '',
  `mode` tinyint(4) NOT NULL default '0',
  `sort` tinyint(4) default '0',
  `threshold` tinyint(4) default '0',
  `theme` varchar(255) NOT NULL default '',
  `signature` varchar(255) NOT NULL default '',
  `signature_format` smallint(6) NOT NULL default '0',
  `created` int(11) NOT NULL default '0',
  `access` int(11) NOT NULL default '0',
  `login` int(11) NOT NULL default '0',
  `status` tinyint(4) NOT NULL default '0',
  `timezone` varchar(8) default NULL,
  `language` varchar(12) NOT NULL default '',
  `picture` varchar(255) NOT NULL default '',
  `init` varchar(64) default '',
  `data` longtext,
  PRIMARY KEY  (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `#__dos_users`
--

INSERT INTO `#__dos_users` (`uid`, `name`, `pass`, `mail`, `mode`, `sort`, `threshold`, `theme`, `signature`, `signature_format`, `created`, `access`, `login`, `status`, `timezone`, `language`, `picture`, `init`, `data`) VALUES(0, '', '', '', 0, 0, 0, '', '', 0, 0, 0, 0, 0, NULL, '', '', '', NULL);
INSERT INTO `#__dos_users` (`uid`, `name`, `pass`, `mail`, `mode`, `sort`, `threshold`, `theme`, `signature`, `signature_format`, `created`, `access`, `login`, `status`, `timezone`, `language`, `picture`, `init`, `data`) VALUES(1, 'admin', 'ab7dde8277d1e2f3a0c1e31a0dfd157a', 'asdf@asd.com', 0, 0, 0, '', '', 0, 1287867675, 1289005728, 1289005487, 1, '-7200', '', '', 'droomla_admin@corephp.com', 'a:1:{s:13:"form_build_id";s:37:"form-fccf11338fa05cf23fe58d48fa55eed4";}');
INSERT INTO `#__dos_users` (`uid`, `name`, `pass`, `mail`, `mode`, `sort`, `threshold`, `theme`, `signature`, `signature_format`, `created`, `access`, `login`, `status`, `timezone`, `language`, `picture`, `init`, `data`) VALUES(4, 'adam', '8ed42f785054cf4b11a52084fd514dd5', 'adam@corephp', 0, 0, 0, '', '', 0, 1288997480, 1289002213, 1289001770, 1, NULL, '', '', '', 'a:1:{s:7:"contact";i:1;}');
INSERT INTO `#__dos_users` (`uid`, `name`, `pass`, `mail`, `mode`, `sort`, `threshold`, `theme`, `signature`, `signature_format`, `created`, `access`, `login`, `status`, `timezone`, `language`, `picture`, `init`, `data`) VALUES(5, 'system', '19c31bd2455057376b66f72887b6b496', 'support@corephp.com', 0, 0, 0, '', '', 0, 1289001628, 1289001628, 1289001648, 1, '-7200', '', '', 'support@corephp.com', 'a:2:{s:13:"form_build_id";s:37:"form-7ba1e5f1612c1cf3e7603a5a3f11ec6a";s:7:"contact";i:1;}');

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_users_roles`
--

CREATE TABLE IF NOT EXISTS `#__dos_users_roles` (
  `uid` int(10) unsigned NOT NULL default '0',
  `rid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_users_roles`
--

INSERT INTO `#__dos_users_roles` (`uid`, `rid`) VALUES(1, 3);
INSERT INTO `#__dos_users_roles` (`uid`, `rid`) VALUES(5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_variable`
--

CREATE TABLE IF NOT EXISTS `#__dos_variable` (
  `name` varchar(128) NOT NULL default '',
  `value` longtext NOT NULL,
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_variable`
--

INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('theme_default', 's:5:"rubik";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('filter_html_1', 'i:1;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('node_options_forum', 'a:1:{i:0;s:6:"status";}');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('drupal_private_key', 's:64:"9f3ca6723440ac5c7c603825a418417792b2f117723325979209ba05282c1ce7";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('menu_masks', 'a:17:{i:0;i:62;i:1;i:61;i:2;i:59;i:3;i:31;i:4;i:30;i:5;i:29;i:6;i:24;i:7;i:21;i:8;i:15;i:9;i:14;i:10;i:11;i:11;i:7;i:12;i:6;i:13;i:5;i:14;i:3;i:15;i:2;i:16;i:1;}');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('install_task', 's:4:"done";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('menu_expanded', 'a:1:{i:0;s:10:"navigation";}');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('update_last_check', 'i:1292206741;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('site_name', 's:7:"Droomla";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('site_mail', 's:19:"droomla@corephp.com";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('date_default_timezone', 's:5:"-7200";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_email_verification', 'i:1;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('clean_url', 'i:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('install_time', 'i:1287867885;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('node_options_page', 'a:1:{i:0;s:6:"status";}');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('comment_page', 'i:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('theme_settings', 'a:1:{s:21:"toggle_node_info_page";b:0;}');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('css_js_query_string', 's:20:"w0000000000000000000";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('install_profile', 's:7:"default";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('image_toolkit', 's:2:"gd";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('file_directory_temp', 's:50:"/var/folders/8W/8W-4hxEQHF8BZ+8WhDwmqU+++TI/-Tmp-/";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('drupal_http_request_fails', 'b:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('admin_theme', 's:5:"rubik";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('node_admin_theme', 'i:1;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('theme_zen_settings', 'a:9:{s:17:"zen_block_editing";s:1:"1";s:14:"zen_breadcrumb";s:3:"yes";s:24:"zen_breadcrumb_separator";s:5:" › ";s:19:"zen_breadcrumb_home";s:1:"1";s:23:"zen_breadcrumb_trailing";s:1:"1";s:20:"zen_breadcrumb_title";s:1:"0";s:10:"zen_layout";s:18:"zen-columns-liquid";s:20:"zen_rebuild_registry";s:1:"0";s:14:"zen_wireframes";s:1:"0";}');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('javascript_parsed', 'a:0:{}');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_admin_role', 's:1:"3";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('admin_toolbar', 'a:4:{s:6:"layout";s:8:"vertical";s:8:"position";s:2:"nw";s:8:"behavior";s:2:"df";s:6:"blocks";a:2:{s:12:"admin-create";i:-1;s:10:"admin-menu";i:1;}}');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_modulelist', 'a:3:{i:0;s:4:"node";i:1;s:4:"user";i:2;s:8:"taxonomy";}');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_taxonomy_supportsfeeds', 's:6:"0/feed";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_taxonomy_pattern', 's:34:"category/[vocab-raw]/[catpath-raw]";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_taxonomy_bulkupdate', 'i:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_taxonomy_applytofeeds', 's:0:"";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_taxonomy_2_pattern', 's:0:"";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_taxonomy_1_pattern', 's:0:"";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_ignore_words', 's:108:"a,an,as,at,before,but,by,for,from,is,in,into,like,of,off,on,onto,per,since,than,the,this,that,to,up,via,with";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_indexaliases', 'b:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_indexaliases_bulkupdate', 'b:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_max_component_length', 's:3:"100";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_max_length', 's:3:"100";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_node_bulkupdate', 'i:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_node_forum_pattern', 's:0:"";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_node_image_pattern', 's:0:"";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_node_page_pattern', 's:0:"";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_node_pattern', 's:11:"[title-raw]";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_node_story_pattern', 's:0:"";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_quotes', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_separator', 's:1:"-";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_update_action', 's:1:"2";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_user_bulkupdate', 'i:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_user_pattern', 's:16:"users-[user-raw]";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_user_supportsfeeds', 'N;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_verbose', 'i:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_node_applytofeeds', 's:0:"";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_hyphen', 's:1:"1";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_transliterate', 'b:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_node_supportsfeeds', 's:4:"feed";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_case', 's:1:"1";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_max_bulk_update', 's:2:"50";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_reduce_ascii', 'i:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_double_quotes', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_backtick', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_comma', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_period', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_underscore', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_colon', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_semicolon', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_pipe', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_left_curly', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_left_square', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_right_curly', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_right_square', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_plus', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_equal', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_asterisk', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_ampersand', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_percent', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_caret', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_dollar', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_hash', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_at', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_exclamation', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_tilde', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_left_parenthesis', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_right_parenthesis', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_question_mark', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_less_than', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_greater_than', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_slash', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_punctuation_back_slash', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('node_options_book', 'a:1:{i:0;s:6:"status";}');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('book_allowed_types', 'a:1:{i:0;s:4:"book";}');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('book_child_type', 's:4:"book";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('forum_nav_vocabulary', 's:1:"1";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_blog_supportsfeeds', 's:4:"feed";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_contact_supportsfeeds', 'N;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('pathauto_forum_supportsfeeds', 's:6:"0/feed";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('forum_containers', 'a:1:{i:0;s:1:"1";}');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('node_cron_comments_scale', 'd:1;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('node_cron_views_scale', 'd:1;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('node_cron_last', 's:10:"1289001192";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('statistics_day_timestamp', 'i:1289001719;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('cron_last', 'i:1289001724;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_register', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_registration_help', 's:0:"";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_register_admin_created_subject', 's:52:"An administrator created an account for you at !site";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_register_admin_created_body', 's:452:"!username,  A site administrator at !site has created an account for you. You may now log in to !login_uri using the following username and password:  username: !username password: !password  You may also log in by clicking on this link or copying and pasting it in your browser:  !login_url  This is a one-time login, so it can be used only once.  After logging in, you will be redirected to !edit_uri so you can change your password.   --  !site team";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_register_no_approval_required_subject', 's:38:"Account details for !username at !site";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_register_no_approval_required_body', 's:426:"!username,  Thank you for registering at !site. You may now log in to !login_uri using the following username and password:  username: !username password: !password  You may also log in by clicking on this link or copying and pasting it in your browser:  !login_url  This is a one-time login, so it can be used only once.  After logging in, you will be redirected to !edit_uri so you can change your password.   --  !site team";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_register_pending_approval_subject', 's:63:"Account details for !username at !site (pending admin approval)";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_register_pending_approval_body', 's:268:"!username,  Thank you for registering at !site. Your application for an account is currently pending approval. Once it has been approved, you will receive another e-mail containing information about how to log in, set your password, and other details.   --  !site team";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_password_reset_subject', 's:52:"Replacement login information for !username at !site";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_password_reset_body', 's:409:"!username,  A request to reset the password for your account has been made at !site.  You may now log in to !uri_brief by clicking on this link or copying and pasting it in your browser:  !login_url  This is a one-time login, so it can be used only once. It expires after one day and nothing will happen if it''s not used.  After logging in, you will be redirected to !edit_uri so you can change your password.";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_status_activated_notify', 'i:1;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_status_activated_subject', 's:49:"Account details for !username at !site (approved)";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_status_activated_body', 's:418:"!username,  Your account at !site has been activated.  You may now log in by clicking on this link or copying and pasting it in your browser:  !login_url  This is a one-time login, so it can be used only once.  After logging in, you will be redirected to !edit_uri so you can change your password.  Once you have set your own password, you will be able to log in to !login_uri in the future using:  username: !username";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_status_blocked_notify', 'i:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_status_blocked_subject', 's:48:"Account details for !username at !site (blocked)";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_status_blocked_body', 's:51:"!username,  Your account on !site has been blocked.";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_status_deleted_notify', 'i:0;');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_status_deleted_subject', 's:48:"Account details for !username at !site (deleted)";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_mail_status_deleted_body', 's:51:"!username,  Your account on !site has been deleted.";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_signatures', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_pictures', 's:1:"0";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_picture_path', 's:8:"pictures";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_picture_default', 's:0:"";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_picture_dimensions', 's:5:"85x85";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_picture_file_size', 's:2:"30";');
INSERT INTO `#__dos_variable` (`name`, `value`) VALUES('user_picture_guidelines', 's:0:"";');
-- --------------------------------------------------------

--
-- Table structure for table `#__dos_vocabulary`
--

CREATE TABLE IF NOT EXISTS `#__dos_vocabulary` (
  `vid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `description` longtext,
  `help` varchar(255) NOT NULL default '',
  `relations` tinyint(3) unsigned NOT NULL default '0',
  `hierarchy` tinyint(3) unsigned NOT NULL default '0',
  `multiple` tinyint(3) unsigned NOT NULL default '0',
  `required` tinyint(3) unsigned NOT NULL default '0',
  `tags` tinyint(3) unsigned NOT NULL default '0',
  `module` varchar(255) NOT NULL default '',
  `weight` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`vid`),
  KEY `list` (`weight`,`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `#__dos_vocabulary`
--

INSERT INTO `#__dos_vocabulary` (`vid`, `name`, `description`, `help`, `relations`, `hierarchy`, `multiple`, `required`, `tags`, `module`, `weight`) VALUES(1, 'Forums', NULL, '', 0, 1, 0, 0, 0, 'forum', -10);

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_vocabulary_node_types`
--

CREATE TABLE IF NOT EXISTS `#__dos_vocabulary_node_types` (
  `vid` int(10) unsigned NOT NULL default '0',
  `type` varchar(32) NOT NULL default '',
  PRIMARY KEY  (`type`,`vid`),
  KEY `vid` (`vid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `#__dos_vocabulary_node_types`
--

INSERT INTO `#__dos_vocabulary_node_types` (`vid`, `type`) VALUES(1, 'forum');

-- --------------------------------------------------------

--
-- Table structure for table `#__dos_watchdog`
--

CREATE TABLE IF NOT EXISTS `#__dos_watchdog` (
  `wid` int(11) NOT NULL auto_increment,
  `uid` int(11) NOT NULL default '0',
  `type` varchar(16) NOT NULL default '',
  `message` longtext NOT NULL,
  `variables` longtext NOT NULL,
  `severity` tinyint(3) unsigned NOT NULL default '0',
  `link` varchar(255) NOT NULL default '',
  `location` text NOT NULL,
  `referer` text,
  `hostname` varchar(128) NOT NULL default '',
  `timestamp` int(11) NOT NULL default '0',
  PRIMARY KEY  (`wid`),
  KEY `type` (`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=143 ;

--
-- Dumping data for table `#__dos_watchdog`
--
