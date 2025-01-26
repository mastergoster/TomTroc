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