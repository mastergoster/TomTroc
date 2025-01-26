<?php

namespace App;

use Core\Controller\DatabaseController;


class Application
{

    private static $INSTANCE;

    private array $config;
    private DatabaseController|null $dbInstance = null;

    private function __construct()
    {
        if (!file_exists(ROOT . '/config/config.php')) {
            throw new \Exception("Le fichier config n'existe pas.\n'config/config.php'");
        }
        $config = require ROOT . '/config/config.php';
        if (!isset($config['DB_Engin']) || !isset($config['DB_Name']) || !isset($config['DB_Host'])) {
            throw new \Exception("Le fichier config n'est pas bien configuré");
        }
        $this->config = $config;
    }



    public static function getInstance()
    {
        if (is_null(self::$INSTANCE)) {
            self::$INSTANCE = new Application();
        }
        return self::$INSTANCE;
    }

    public static function getConfig($key)
    {
        if (!isset(self::getInstance()->config[$key])) {
            throw new \Exception("La clé $key n'existe pas dans le fichier de configuration");
        }
        return self::getInstance()->config[$key];
    }

    public function getDb(): DatabaseController
    {
        if (is_null($this->dbInstance)) {
            $this->dbInstance = new DatabaseController();
        }
        return $this->dbInstance;
    }
    
}