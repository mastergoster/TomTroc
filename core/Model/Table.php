<?php

namespace Core\Model;

use App\Application;
use PDO;

abstract class Table
{

    protected string|null $table = null;

    public function __construct()
    {
        if (is_null($this->table)) {
            $this->table = $this->extractTableName();
        }
    }

    public function all() : array
    {
        return $this->query("SELECT * FROM $this->table");
    }

    public function find(int $id)
    {
        return $this->query("SELECT * FROM $this->table WHERE id = ?", [$id], true);
    }


    protected function query(string $statement, ?array $attributes = null, bool $one = false)
    {
        $class_name = str_replace('Table', 'Entity', get_class($this));
        $pdo = Application::getInstance()->getDb();

        if ($attributes) {
            return  $pdo->prepare(
                        $statement,
                        $attributes,
                        $class_name,
                        $one
                    );
        } else {
            return  $pdo->query(
                        $statement,
                        $class_name,
                        $one
                    );
        }
    }


    protected function extractTableName(): string
    {
        //App\Model\Table\MotMotMotusTable
        $parts = explode('\\', get_class($this));
        // [ "App", "Model", "Table", "MotMotMotusTable" ]
        $class_name = end($parts);
        //MotMotMotusTable
        $class_name = str_replace('Table', '', $class_name);
        //MotMotMotus
        $newTable = $class_name[0];
        // $newTable = M
        for ($i = 1; $i < strlen($class_name); $i++) {
            if (ctype_upper($class_name[$i])) {
                $newTable .= "_";
            }
            $newTable .= $class_name[$i];
        }
        // $newTable =  Mot_Mot_Motus

        $class_name = strtolower($newTable);
        // $newTable =  mot_mot_motus
        return $class_name;
    }

}