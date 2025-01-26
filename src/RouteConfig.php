<?php

namespace App;

use App\Controller\HomeController;
use App\Controller\UserController;
use Core\Controller\CliController;

class RouteConfig
{
    public static function getConfig(): array
    {
        return [
            ['/', HomeController::class, 'index'],
            ['/login', UserController::class, 'login']
        ];
    }

    public static function getConfigCli(): array{
        return [
            ['help', CliController::class, 'help'],
            ['serve', CliController::class, 'startServer'],
            ['init', CliController::class, 'dbinit']
        ];
    }
}