<?php

namespace Core\Controller;

class RouteurController

{
    private $routes = [];

    public function add($url, $controller, $action): self
    {
        $this->routes[$url] = [
            'controller' => $controller,
            'action' => $action
        ];
        return $this;
    }

    public function run(string $commande): void
    {
        $url = $this->getUrl($commande);
        if (\method_exists($url['controller'], $url['action'])) {
            echo (new $url["controller"])->{$url["action"]}();
        } else {
            throw new \Exception("Cette Methode n'existe pas ({$url["action"]})");
        }
    }


    private function getUrl(string $url): array
    {
        if (array_key_exists($url, $this->routes)) {
            return $this->routes[$url];
        }
        throw new \Exception('La Route n\'existe pas');
    }
}