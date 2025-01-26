<?php

namespace App\Controller;

use App\Model\Table\BooksTable;
use Core\Controller\Controller;

final class HomeController extends Controller
{


    public function index()
    {
        $books = (new BooksTable())->findLastBooks(4);
        $oneBook = (new BooksTable())->find(15);
        $this->render('index' , compact('books', 'oneBook'));
    }
}