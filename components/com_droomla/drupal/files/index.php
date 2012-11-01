<?php
// $Id: index.php,v 1.94 2007/12/26 08:46:48 dries Exp $

/**
 * @file
 * The PHP page that serves all page requests on a Drupal installation.
 *
 * The routines here dispatch control to the appropriate handler, which then
 * prints the appropriate page.
 *
 * All Drupal code is released under the GNU General Public License.
 * See COPYRIGHT.txt and LICENSE.txt.
 */

//look after curl multipart form arrays
foreach($_POST as $k=>$value){			
	
	if(!is_array($value)){
	$value = json_decode($value, true);
	
	if(is_array($value)){
		$_POST[$k] = $value;
	}
	}
}

unset($_GET['secret']);
unset($_POST['secret']);

require_once './includes/bootstrap.inc';
drupal_bootstrap(DRUPAL_BOOTSTRAP_FULL);

if( isset($_REQUEST['dos_client']) ){
	$_SESSION['dos']['client'] = $_REQUEST['dos_client'];
}



if( $_SESSION['dos']['client'] != 'dos_backend'   ){ // && $_GET['option']
global $custom_theme;
$custom_theme='zen';

}

unset($_GET['dos_client']);
unset($_GET['j_template']);
unset($_GET['option']);
unset($_GET['cmd']);


function custom_url_rewrite_inbound(&$result, $path, $path_language) {
  
  
   $result=str_replace('.', '/', $result );
  // $result=str_replace('_', '.', $result );	
  /*global $user;

  // Change all article/x requests to node/x
  if (preg_match('|^article(/.*)|', $path, $matches)) {
    $result = 'node'. $matches[1];
  }
  // Redirect a path called 'e' to the user's profile edit page.
  if ($path == 'e') {
    $result = 'user/'. $user->uid .'/edit';
  }*/
}


function custom_url_rewrite_outbound(&$path, &$options, $original_path) {
 
 //$path=str_replace('.', '_', $path );
 $path=str_replace('/', '.', $path );
 
  /*global $user;

  // Change all 'node' to 'article'.
  if (preg_match('|^node(/.*)|', $path, $matches)) {
    $path = 'article'. $matches[1];
  }
  // Create a path called 'e' which lands the user on her profile edit page.
  if ($path == 'user/'. $user->uid .'/edit') {
    $path = 'e';
  }
*/
}


$return = menu_execute_active_handler();

// Menu status constants are integers; page content is a string.
if (is_int($return)) {
  switch ($return) {
    case MENU_NOT_FOUND:
      drupal_not_found();
      break;
    case MENU_ACCESS_DENIED:
      drupal_access_denied();
      break;
    case MENU_SITE_OFFLINE:
      drupal_site_offline();
      break;
  }
}
elseif (isset($return)) {
  // Print any value (including an empty string) except NULL or undefined:
  print theme('page', $return);
}

drupal_page_footer();


