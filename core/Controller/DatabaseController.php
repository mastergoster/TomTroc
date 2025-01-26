<?php

namespace Core\Controller;

use App\Application;
use \PDO;

class DatabaseController
{

    private PDO|null $pdo = null;

    public function getPDO()
    {
        if (is_null($this->pdo)) {
            $pdo = new PDO(
                'sqlite:' . ROOT . "/" . Application::getConfig('DB_Host')
            );
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->pdo = $pdo;
        }
        return $this->pdo;
    }


    public function query(string $statement, ?string $class_name = null, bool $one = false)
    {
        $pdoStatement = $this->getPDO()->query($statement);

        if (strpos($statement, 'UPDATE') === 0 ||
            strpos($statement, 'INSERT') === 0 ||
            strpos($statement, 'DELETE') === 0
        ) {
            return $pdoStatement;
        }
        if (is_null($class_name)) {
            $pdoStatement->setFetchMode(PDO::FETCH_OBJ);
        } else {
            $pdoStatement->setFetchMode(PDO::FETCH_CLASS, $class_name);
        }
        if ($one) {
            $datas = $pdoStatement->fetch();
        } else {
            $datas = $pdoStatement->fetchAll();
        }

        return $datas;
    }

    public function prepare(string $statement, array $attributes, ?string $class_name = null, bool $one = false)
    {
        $pdoStatement = $this->getPDO()->prepare($statement);
        $returnResult = $pdoStatement->execute($attributes);
        if (strpos($statement, 'UPDATE') === 0 ||
            strpos($statement, 'INSERT') === 0 ||
            strpos($statement, 'DELETE') === 0
        ) {
            return $returnResult;
        }
        if (is_null($class_name)) {
            $pdoStatement->setFetchMode(PDO::FETCH_OBJ);
        } else {
            $pdoStatement->setFetchMode(PDO::FETCH_CLASS, $class_name);
        }
        if ($one) {
            $datas = $pdoStatement->fetch();
        } else {
            $datas = $pdoStatement->fetchAll();
        }

        return $datas;
    }

}