# Spéciﬁcations pour le site TomTroc

Le but de ce projet est de réaliser un site permettant la mise en contact de lecteurs, aﬁn qu’ils puissent partager et échanger leurs livres.

Ce projet est un MVP, c'est-m-dire “Minimal Viable Product”, une première version qui doit fonctionner mais sera rapidement améliorée m l’avenir.

Le but est, dans un premier temps, d’implémenter les fonctionnalités principales du projet. Elles seront amenées m évoluer par la suite ; c’est pourquoi le choix d’une architecture Modèle-Vue-Contrôleur est important.

En particulier, deux points peuvent être laissés en suspens pour l’instant :

- Il n’est pas nécessaire de réaliser de partie admin pour modérer les utilisateurs ou les livres.
- La partie responsive est un plus (les maquettes sont fournies), mais reste facultative.

Voici la liste des fonctionnalités qui devront être implémentées :

## Inscription et connexion des membres

Les utilisateurs pourront s’inscrire directement. Il n’est pas nécessaire de faire une validation par mail ou par un administrateur. Une fois l’utilisateur inscrit, il pourra se connecter.

## Page de proffil des utilisateurs

L’utilisateur pourra modiﬁer son propre proﬁl et consulter celui des autres utilisateurs. Il n’y a pas de pages listant l’intégralité des proﬁls des utilisateurs. La mise en relation se fera uniquement par l'intermédiaire de la bibliothèque.

## La bibliothèque personnelle présente dans la page “Mon compte”

Les utilisateurs pourront se créer une bibliothèque personnelle pour décrire leurs livres ; chaque livre possède en particulier :

- Un champ titre.
- Un champ “auteur” : pour cette V1, nous pouvons nous contenter d’un simple champ texte, mais si vous voulez aller plus loin en séparant nom, prénom, pseudo, ou en ajoutant

carrément une table “auteur”, c’est parfaitement envisageable ; faites juste attention m rester cohérent et m ne pas perdre trop de temps !

- Une image : ce champ peut rester vide lorsqu’un livre est créé.
- Une description : le commentaire peut être un très long texte.
- Un statut de disponibilité : est-ce que ce livre est disponible m l’échange ? Vous pouvez ajouter d’autres statuts si vous l’estimez nécessaire.

## La page “Nos livres à l’échange”

Cette page permet de consulter les livres qui sont disponibles m l’échange. Il faut également y incorporer un champ de recherche. Pour la V1, ﬁltrer en fonction du titre du livre est sufﬁsant. Libre m vous d’implémenter une recherche plus complexe si vous voulez, mais lm encore, veillez m rester cohérent dans le design et m ne pas perdre trop de temps !

## Détail d’un livre

Cette page permet de voir le détail d’un livre. Elle possède aussi un lien vers le proﬁl de la personne qui possède ce livre, et un lien pour pouvoir envoyer un message m cette personne.

## La messagerie

Il faudra au minimum :

- pouvoir consulter la liste des messages reçus ;
- pouvoir voir un ﬁl de discussion ;
- pouvoir envoyer un message et répondre.

Pour la messagerie elle-même, je vous laisse décider jusqu’où aller pour les fonctionnalités pour la V1, il n’est pas requis d’avoir de mise en forme.

## les maquettes

Les maquettes sont fournies dans le figma suivant : https://www.figma.com/design/igDdidGb6uJ7ykjROaAB8z/P6-PHP-Symfony---Tom-Troc?node-id=227-579&t=HDkj1zWqRzAQ9KhP-1

## la base de données

La base de données est fournie dans le fichier `tomtroc.sql` à la racine du projet.
voici le MCD de la base de données :

![MCD](/database.png)
