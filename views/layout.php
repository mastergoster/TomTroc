<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/init_css.css">
    <link rel="stylesheet" href="assets/style.css">
    <title>Tom Troc</title>
</head>

<body>
    <header>
        <nav>
            <div>
                <a href="/"><img src="assets/images/logo.svg" class="logo" alt="Logo de TomTroc"></a>
                <ul>
                    <li><a href="#" class="active">Accueil</a></li>
                    <li><a href="#">Nos livres à l'échange</a></li>
                </ul>
            </div>
            <ul>
                <li class="separator"></li>
                <li><a href="#"><img src="assets/images/icon-messagerie.svg" alt="logo message">Messagerie<span>1</span></a></li>
                <li><a href="#"><img src="assets/images/icon-mon-compte.svg" alt="logo mon compte">Mon Compte</a></li>
                <li><a href="#">Connexion</a></li>
            </ul>
        </nav>
    </header>
    <?= $content ?>
</body>
<footer>
    <nav>
        <ul>
            <li><a href="#">Politique de confidentialité</a></li>
            <li><a href="#">Mentions légales</a></li>
            <li>Tom Troc©</li>
            <li><img src="assets/images/logo-small.svg" alt=""></li>
        </ul>
    </nav>
</footer>

</html>