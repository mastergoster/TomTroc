<h1>le super site a mettre en forme</h1>
<?php foreach($books as $book): ?>
    <div><?= $book->getTitle() ?></div>
<?php endforeach; ?>
<h2>un seul livre</h2>
<?= $oneBook->getTitle() ?>