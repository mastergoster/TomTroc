<?php

namespace Core\Controller;




final class   CliController extends Controller
{
    private $basePort = 8000;
    private $maxPort = 8100;

    public function index()
    {
        return "hello world";
    }

    public function help()
    {
        echo "Commande disponible:\n";
        echo "help : Affiche l'aide\n";
        echo "exit : Quitte le programme\n";
    }


    public function startServer()
    {
        for ($port = $this->basePort; $port < $this->maxPort; $port++) {
            if ($this->isPortAvailable($port)) {
                $this->launchServer($port);
                return;
            }
        }
        throw new \Exception("No available ports between {$this->basePort} and {$this->maxPort}");
    }


    /**
     * fonction qui permet de verifier le fichier config est bien configuré
     * et initilise la base de donnée
     *
     * @return void
     */
    public function dbinit()
    {
        if (!file_exists(ROOT . '/config/config.php')) {
            throw new \Exception("Le fichier config n'existe pas.\n'config/config.php'");
        }
        $config = require ROOT . '/config/config.php';
        if (!isset($config['DB_Engin']) || !isset($config['DB_Name']) || !isset($config['DB_Host'])) {
            throw new \Exception("Le fichier config n'est pas bien configuré");
        }
        $db = new \PDO("{$config['DB_Engin']}:{$config['DB_Host']}");
        $db->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
        $sql = file_get_contents(ROOT . '/TomTroc_sqlite.sql');
        $db->exec($sql);
        echo "Database initialized\n\n";
    }


    private function isPortAvailable($port)
    {
        $connection = @fsockopen('localhost', $port, $errno, $errstr, 1);
        if ($connection) {
            fclose($connection);
            return false;
        }
        return true;
    }

    private function launchServer($port)
    {
        $command = "php -S localhost:{$port} -t public";
        echo "Starting PHP server on port {$port}...\n";
        exec($command);
    }

}