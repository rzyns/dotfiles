<?php
//return array(

    // In PHP 5.4+, PsySH will default to your `cli.pager` ini setting. If this
    // is not set, it falls back to `less`. It is recommended that you set up
    // `cli.pager` in your `php.ini` with your preferred output pager.
    //
    // If you are running PHP 5.3, or if you want to use a different pager only
    // for Psy shell sessions, you can override it here.
//    'pager' => 'more',

    // By default, PsySH will use a 'forking' execution loop if pcntl is
    // installed. This is by far the best way to use it, but you can override
    // the default by explicitly enabling or disabling this functionality here.
//    'usePcntl' => false,

    // PsySH uses readline if you have it installed, because interactive input
    // is pretty awful without it. But you can explicitly disable it if you
    // hate yourself or something.
//    'useReadline' => false,

    // "Default includes" will be included once at the beginning of every PsySH
    // session. This is a good place to add autoloaders for your favorite
    // libraries.
//    'defaultIncludes' => array(
//        __DIR__.'/include/bootstrap.php',
//    ),

    // While PsySH ships with a bunch of great commands, it's possible to add
    // your own for even more awesome. Any Psy command added here will be
    // available in your Psy shell sessions.
//    'commands' => array(

        // The `parse` command is a command used in the development of PsySH.
        // Given a string of PHP code, it pretty-prints the
        // [PHP Parser](https://github.com/nikic/PHP-Parser) parse tree. It
        // prolly won't be super useful for most of you, but it's there if you
        // want to play :)
//        new \Psy\Command\ParseCommand,
//    ),
//);
return call_user_func(function ($path) use (&$loader) {

  if (!function_exists('psprintr')) {
    function psprintr($label, $var, $return = false) {
      $str = array_reduce(explode(PHP_EOL, print_r($var, true)), function ($carry, $item) use ($label) {
        return $carry . PHP_EOL . $label . ': ' . $item;
      });

      !$return and printf($str . PHP_EOL);
      return $str;
    }
  }

  if (!function_exists('norm_path')) {
    function norm_path ($path) {
      $s = DIRECTORY_SEPARATOR;
      return preg_replace('#' . preg_quote(str_repeat($s, 2), '#') . '+#', $s, $path);
    }
  }

  if (!function_exists('add_include_path')) {
    function add_include_path($path, $new = null) {
      $path = array_map('norm_path', is_array($path) ? $path : array($path));
      $org = explode(PATH_SEPARATOR, get_include_path());
      set_include_path($new = implode(PATH_SEPARATOR, array_merge($org, $path)));
      return $org;
    }
  }

  $conf = array();
  $ds = DIRECTORY_SEPARATOR;

  $file = norm_path(implode($ds, array($path, 'vendor', 'autoload.php')));
  if (file_exists($file) && is_readable($file)) {
    echo "Loading autoload.php...", PHP_EOL;
    $conf['defaultIncludes'][] = $file;
  }

  $file = norm_path('/Users/janusz/.composer/vendor/autoload.php');
  if (file_exists($file) && is_readable($file)) {
    echo "Loading global autoloader...", PHP_EOL;
    $conf['defaultIncludes'][] = $file;
  }

  if (preg_match('#/evesaddiction.com(?:/.*)?$#', $path)) {
    $GLOBALS['SESSION'] = array('cart' => array('total' => 0, 'coupon' => null));
    add_include_path(array(
      $path . $ds . 'inc',
      $path . $ds . 'classes',
    ));

    call_user_func(function () use ($ds, $path) {
      global $site_name;

      if (!preg_match('/\$site_name\s*=\s*["' . "'" . '](.*?)["' . "'" . ']/',
        file_get_contents(norm_path($path . $ds . 'inc/assign.inc')), $matches))
      {
        die("Couldn't parse \$site_name from assign.inc." . PHP_EOL);
      }

      $site_name = $matches[1];

      $vars = get_defined_vars();

      $_SERVER['HTTP_HOST'] = '';
      require(norm_path($path .$ds . 'inc/settings.inc'));

      foreach (@array_diff(get_defined_vars(), $vars) as $key => $value) {
        $GLOBALS[$key] = $value;
      }
    });

    call_user_func(function () use ($ds, $path) {
      global $db, $db_local, $site_name, $db_address_def, $db_database_def,
        $db_username_def, $db_password_def, $db_port_def;

      $db_port_def = is_numeric(@$db_port_def) ? (int) $db_port_def : 3306;

      try {
        $db_local = $db = new PDO(sprintf('mysql:host=%s;dbname=%s;port=%d',
          $db_address_def, $db_database_def, $db_port_def),
          $db_username_def, $db_password_def, array(
              PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\''
          ));
        $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $db->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
      } catch (PDOException $e) {
        die("Couldn't connect to database: " . $e->getMessage() . PHP_EOL);
      }
    });


    defined('ABSPATH') or define('ABSPATH', realpath(dirname(__FILE__) . '/..'));
    defined('CONTROLLER') or define('CONTROLLER', true);

    require_once norm_path($path . $ds . 'inc/wp-includes/plugin.php');
    require_once norm_path($path . $ds . 'inc/wp-includes/shortcodes.php');
    require_once norm_path($path . $ds . 'inc/theme.inc');

    var_dump('Custom config loaded!', $conf);
  }

  return $conf;
}, getcwd());
