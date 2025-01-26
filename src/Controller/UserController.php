<?php

namespace App\Controller;

use Core\Controller\Controller;



final class UserController extends Controller
{
    public function login()
    {
        $this->render('login');
    }
}