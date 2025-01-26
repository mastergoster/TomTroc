<?php

namespace App\Model\Table;

use Core\Model\Table;

final class BooksTable extends Table
{

    /**
     * recherche les dernier livres
     * 
     * @param int $quantite
     * @return array
     */
    public function findLastBooks($quantite = 10): array
    {
        return $this->query("SELECT * FROM $this->table ORDER BY created_at DESC LIMIT ?", [$quantite]);
    }

}
