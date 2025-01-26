<?php

namespace Core\Controller;

abstract class Controller
{
    public function render(String $view, array $data = [])
    {
        if (!file_exists(ROOT . "/views/{$view}.php")) {
            throw new \Exception("View {$view} not found");
        }
        extract($data);
        \ob_start();
        include ROOT . "/views/{$view}.php";
        $content = \ob_get_clean();
        include ROOT . "/views/layout.php";
    }
}
