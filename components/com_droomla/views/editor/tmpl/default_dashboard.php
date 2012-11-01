<?php 

//echo $_SERVER['DOCUMENT_ROOT'];echo JPATH_ROOT;die();

defined('_JEXEC') or die('Restricted access'); ?>

<h2>Welcome to Droomla!</h2>
<div style="width:50%">
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