<?php
use Core\Controller\RouteurController;

define("ROOT", dirname(__DIR__));


spl_autoload_register(function ($class) {
    $class = str_replace('\\', '/', $class);
    $class = str_replace('App', 'src', $class);
    $class = str_replace('Core', 'core', $class);
    if (file_exists(ROOT . '/' . $class . '.php')) {
        include(ROOT . '/' . $class . '.php');
    } else {
        throw new \Exception('Class ' . $class . ' not found');
    }
});

$routeur = new RouteurController();


if (PHP_SAPI === 'cli') {
    
    foreach(App\RouteConfig::getConfigCli() as $route){
        $routeur->add($route[0], $route[1], $route[2]);
    }

    if (isset($_SERVER['argv'][1])) {
        $routeur->run($_SERVER['argv'][1]);
    }


    while (true) {
        $line = readline("Entrez votre commande : ");
        if ($line === 'exit') {
            break;
        }
        try {
            $routeur->run($line);
        } catch (Exception $e) {
            $routeur->run("help");
        }
        
    }
}

foreach(App\RouteConfig::getConfig() as $route){
    $routeur->add($route[0], $route[1], $route[2]);
}
try {
    $routeur->run(!isset($_SERVER['PATH_INFO']) ?  '/' : $_SERVER['PATH_INFO']);
} catch (Exception $e) {
    echo "<h1 style='text-align: center;'>" . $e->getMessage() . "</h1>";
}

