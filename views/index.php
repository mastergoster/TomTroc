<section class="hero">
    <div>
        <h1>Rejoignez nos lecteurs passionnés</h1>
        <p>Donnez une nouvelle vie à vos livres en les échangeant avec d'autres amoureux de la lecture. Nous croyons en la magie du partage de connaissances et d'histoires à travers les livres. </p>
        <a href="#" class="btn btn-primary" >Découvrir</a>
    </div>
    <div class="image">
        <img src="assets/images/hamza-nouasria-k-xrv-pthkm-yq-unsplash-1.png" alt="">
        <p>Hamza</p>
    </div>
</section>
<section class="last_books">
    <h2>
    Les derniers livres ajoutés
    </h2>
    <div>
        <?php foreach($books as $book): ?>
            <article>
                <img src="assets/images/hamza-nouasria-k-xrv-pthkm-yq-unsplash-1.png" alt="">
                <div>
                    <h3><?= $book->getTitle() ?></h3>
                    <p><?= $book->getAuthor() ?></p>
                    <p class="vendeur">Vendu par : <?= $book->user()->getUsername() ?></p>
                </div>
            </article>
        <?php endforeach; ?>
    </div>
    <a href="#" class="btn btn-primary">Voir tous les livres</a>
</section>

<section class="how_it_work">
    <h2>
    Comment ça marche ?
    </h2>
    <p>
    Échanger des livres avec TomTroc c’est simple et amusant ! Suivez ces étapes pour commencer :
    </p>
    <div>
        <article>
            <p>Inscrivez-vous gratuitement sur notre plateforme.</p>
        </article>
        <article>
            <p>Ajoutez les livres que vous souhaitez échanger à votre profil.</p>
        </article>
        <article>
            <p>Parcourez les livres disponibles chez d'autres membres.</p>
        </article>
        <article>
            <p>Proposez un échange et discutez avec d'autres passionnés de lecture.</p>
        </article>
    </div>
    <a href="#" class="btn btn-secondary">Voir tous les livres</a>
</section>

<section class="values">
    <img src="assets/images/clay-banks-4uH8rdyEbH4-unsplash 1-2.png" alt="">
    <h2>
    Nos valeurs
    </h2>
    <p>
    Chez Tom Troc, nous mettons l'accent sur le partage, la découverte et la communauté. Nos valeurs sont ancrées dans notre passion pour les livres et notre désir de créer des liens entre les lecteurs. Nous croyons en la puissance des histoires pour rassembler les gens et inspirer des conversations enrichissantes. <br><br>
    Notre association a été fondée avec une conviction profonde : chaque livre mérite d'être lu et partagé.<br><br>
    Nous sommes passionnés par la création d'une plateforme conviviale qui permet aux lecteurs de se connecter, de partager leurs découvertes littéraires et d'échanger des livres qui attendent patiemment sur les étagères.
    </p>
    <div>
        <p class="signature">L’équipe Tom Troc</p>
        <img src="assets/images/vector-2.svg" alt="">
    </div>
</section>