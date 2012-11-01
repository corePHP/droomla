<?php 

//echo $_SERVER['DOCUMENT_ROOT'];echo JPATH_ROOT;die();

defined('_JEXEC') or die('Restricted access'); ?>

<style>.icon-48-droomla {background:url(<?php echo JURI::base() ?>/components/com_droomla/images/droomla.png) no-repeat 0 50%;}</style>
<h2>Welcome to Droomla!</h2>
<div style="width:50%;float:left">
<p>
Thank you for trying Droomla! We have done our best to make this a full integration, meaning that all Drupal functionality should be available.
 The only exception to this is Drupal Themes (called templates in Joomla). The integration Utilises Joomla's template system so 
 themes are not required on the Drupal side of things. Please do not add Drupal themes or mess with theme settings as you could break something!
</p>
<p>
As stated above the system attempts to offer a full integration so it is best to look on <a href="http://www.drupal.org">www.drupal.org</a> 
for more information about how to use the Administration UI and CMS type functionality.
</p>
<h3>Drupal Administration</h3>
<p>Just click on the Drupal Administration link above - note that everyone in the "Administrator" and "Super Administrator" groups will have Drupal
Administration Access. <strong>Drupal does not allow username sharing ie you cannot have two people logged in under the same username.</strong></p>
<h3>Drupal Blocks</h3>
<p>
Drupal Blocks are basically identical in nature to Joomla! Modules. You can add blocks to Joomla by using the Droomla Drupal Module. Here you will
see a list of available Drupal blocks - select one and it will come up in the module area. In the Drupal admin area -> Site Building you need to add 
blocks to the Joomla Region.
</p>
<p>It is worth noting that the blocks retain their Drupal settings in regards to access, etc so they will only show if Drupal allows!</p>

<h3>Drupal Modules</h3>
<p>
Drupal Modules are the equivilent to Joomla Components and are installed by uploading the extracted module directory to the Drupal module directory
 located here: <br /><br /> <?php echo JPATH_SITE . '/' . Drupal::$_drupal_uri ?>modules/

</p>
<!--<form name="imgform" method="post" action="" enctype="multipart/form-data" onSubmit="if(file_upload.value=='') {alert('Choose a file!');return false;}">
        <?php echo JText::_('CHOOSE_FILE'); ?> <input type="file" name="file_upload" size="50" />
        <input name="submit" type="submit" value="Upload" />
        <input name="option" type="hidden" value="com_droomla" />
        <input name="view" type="hidden" value="dashboard" />
        <input name="task" type="hidden" value="upload_module" />
</form>-->

</div>

<div style="width:48%;float:right">
<strong>How do I get started?</strong>
<p>
You can access Droomla on the frontend of your website by creating a menu item to point at the component: 
Menus->[select menu]->Droomla->Drupal Views->Drupal Frontpage. Alternatively you can just point your browser at 
www.mysite.com/index.php?option=com_droomla
</p>
<p>
For Droomla to integrate properly with your template you must attach a Category and Section. This is very easy and can be done
 when you set up a menu item - or if you are pointing directly at the component you can set this in the Parameters area in the top
  toolbar of this page - look up and to the right, there it is! It doesn't really matter which ones you choose as they are not actually 
  used for anything apart from fooling the default template into thinking it is dealing with normal Joomla! com_content!
</p>
<p>
And that's about it! Now you can move over to the Drupal Administration Area and start adding some content!</p>
<br />
<h3>Joomla Content Editor for Drupal</h3>
<a target="_blank" href="http://www.joomlacontenteditor.net/downloads/editor">
<img src="http://www.joomlacontenteditor.net/templates/rt_chromatophore_j15/images/logo.png" style="float:left"/></a>
That's right! The best WYSIWYG content editor PERIOD! Fully integrated with Drupal via Droomla, all you need to do is install it 
(you might already have it installed!) via the Joomla! installer and away you go (You must set as your default editor in Joomla's Global Config). 
Droomla will automatically integrate JCE to Drupal, 
no headaches, no fooling 
around - complete integration of JCE to Drupal! <br /><br />PS: Don't forget to select full html before you save a Drupal textarea otherwise images
 won't show.
</div>

