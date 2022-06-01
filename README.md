# hackamro-lounis_medjber_jee_mini_projet
lounis amar + medjber

Introduction

Le système de gestion de bibliothèque en ligne est un système qui conserve les informations sur les livres présents dans la bibliothèque, leurs auteurs, les membres de la bibliothèque à qui les livres sont délivrés, le personnel de la bibliothèque et tout. C'est très difficile à organiser manuellement. La maintenance manuelle de toutes ces informations est une tâche très complexe. Grâce aux progrès de la technologie, l'organisation d'une bibliothèque en ligne devient beaucoup plus simple. La gestion de la bibliothèque en ligne a été conçue pour informatiser et automatiser les opérations effectuées sur les informations sur les membres, les sorties et les retours de livres et toutes les autres opérations. Cette informatisation de la bibliothèque aide dans de nombreux cas à ses maintenances. Il réduit la charge de travail de la direction car la plupart du travail manuel effectué est réduit.

Le problème survenu avant d'avoir un système informatisé comprend : 

- Fichier perdu : Lorsque le système informatisé n'est pas mis en œuvre, le fichier est toujours perdu à cause de l'environnement humain.
- Dossier difficile à rechercher : Lorsqu’il n'y a pas de système informatisé, il est toujours difficile de rechercher des documents si les documents sont nombreux.
- Encombrant : Lorsque le nombre d'enregistrements devient important, l'espace de stockage physique des fichiers et des enregistrements augmente également si aucun système informatisé n'est mis en place.
- Coûteux : Comme il n'y a pas de système informatisé, il sera nécessaire d'ajouter chaque document d'enregistrement, ce qui augmentera le coût de gestion de la bibliothèque.

BUTS ET OBJECTIFS DU PROJET

- Les buts et objectifs du projet qui seront atteints après l'achèvement de ce projet sont discutés dans ce sous-chapitre. Les buts et objectifs sont les suivants : 

`      `· Lecture de livres en ligne. 

`      `· Une colonne de recherche pour rechercher la disponibilité des livres. 

`      `·L’administrateur peut ajouter des étudiants.

`    `· Facilité de téléchargement du livre requis.

- Page index
- ***Interfaces réalisées*** 
- Nous allons présenter les différentes interfaces réalisées:
- Authentification des utilisateurs :

![](img/001.png)

- Page admin

**Pour l’administrateur**

` `· Ajouter un étudiant (l’inscrire)  

· Supprimer un étudiant 

· Modifier un étudiant 

· Ajouter un bonus.

![](img/002.png)

Page etudiant

**Pour l’étudiant** 

· Se connecter au système en utilisant les paramètres donnés par l’université 

· Se déconnecter du système

` `· Lister les livres disponibles (lister tous les livres, lister par domaine) 

· Recherche par mot clé sur la liste des livres 

· Télécharger des livres protégés par mot de passe qu’il va lire en offline, selon le forfait de l’université à qui il appartient

![](img/003.png)

CONTEXTE DU PROJET

La plateforme de la gestion de bibliothèque numérique est une application qui fait référence aux systèmes de bibliothèques qui sont généralement de petite ou moyenne taille. Il est utilisé par le bibliothécaire pour gérer la bibliothèque 

Les livres et les modules de maintenance des étudiants sont également inclus dans ce système qui permet de suivre les étudiants utilisant la bibliothèque et également une description détaillée des livres qu'une bibliothèque contient. il n'y aura aucune perte de registre ou de dossier de membre, ce qui se produit généralement lorsqu'un système non informatisé est utilisé.

Tous ces modules sont en mesure d'aider le bibliothécaire à gérer la bibliothèque avec plus de commodité et de manière plus efficace par rapport aux systèmes de bibliothèque qui ne sont pas informatisés.


Modélisation et Conception

Dans cette étape, nous commençons le travail pour la mise au point de notre solution. Nous allons fixer les besoins des acteurs impliqués dans le nouveau système, que ce soit au niveau fonctionnel ou technique, afin de combler les lacunes et répondre aux objectifs des utilisateurs.

Contexte de l’application

- La base des donnée

![](img/004.png)


- Le diagramme de classe
- Le diagramme de classes est estimé comme la tranche la plus importante de la modélisation orientée objet ; ce dernier est la seule obligation lors d'une telle modélisation. Il est donc indispensable d’en générer. 

![](img/005.png)

- Tous les class et attributs

![](img/006.png)

ORGANIGRAMME

![](img/007.png)

Figure 1 : Organigramme général qui résume le travaille

Cette représentation des classes bien structurée va nous permettre de définir les composants du système, pouvoir spécifier les fonctionnalités et attribuer chaque fonction a son propriétaire. C’est essentiellement grâce à ce dernier qu’on pourra plus-tard, à la phase de la réalisation, créer une base de données bien structurée.

Besoins fonctionnels En supposant que nous avons deux utilisateurs l’administrateur et l’étudiant nous définissons les besoins fonctionnels de chacun comme suit :

***Conclusion***

`   `Dans ce chapitre, nous avons bien modélisé et conçu notre système. Nous avons bien expliqué comment devrait ce dernier fonctionner et aussi éclaircir la structure de la base de données. Nous sommes maintenant prêts à passer au côté technique et implémenter cette plate-forme tout en respectant les critères ergonomiques afin d’obtenir à la fin un produit aimable et admirable par les utilisateurs et qui fait ce qu’on lui demande.

***Réalisation***

***Les Outils utilisés***

Afin de bien réaliser ce projet et le mettre en œuvre, nous avons utilisé certains outils techniques et logiciels que nous présentons dans ce premier titre. Notre choix s’est porté sur le couple JEE/MySQL/H2 sous le serveur Tomcat en utilisant l’environnement de développement Eclipse EE.

***Outils Front-End***

***HTML :*** Le langage HTML (HyperText Markup Language) est un langage permettant d'écrire des documents hypertextes pour le web.

***CSS 3*** : Cascading Style Sheets (feuilles de style en cascade), CSS est un langage déclaratif simple pour mettre en forme des pages HTML ou des documents XML.

***JavaScript*** : C’est un langage de programmation de scripts principalement utilisé dans les pages web interactives mais aussi côté serveur.

***Outils Back-End***

` `Base des donnée

***MySQL*** : Est un système de gestion de bases de données relationnelles (SGBDR). Il fait partie des logiciels de gestion de bases de données les plus utilisées au monde.

***H2*** : Est un système de gestion de bases de données relationnelles (SGBDR).

WEB

***JEE*** : Java Entreprise Edition est la version entreprise de la plate-forme "Java" qui se compose de l'environnement "JSE" ainsi que de nombreuses API et composants destinés à une utilisation "côté serveur" au sein du système d'information de l'entreprise.

**EL** : Les Expressions Langages sont des expressions intégrées à des pages JSP, évaluées et remplacées par le résultat.

**JSTL** : collection de tags visant à simplifier les traitements les plus souvent réalisés avec du code Java dans les JSP

***Hibernate*** : Hibernate est un framework permettant de résoudre le problème d'adaptation entre le paradigme objet et les SGBD.

***JPA*** : Java Persistance API est une interface de programmation Java qui permet d'organiser des données relationnelles dans des applications utilisant la plateforme Java.

***Préparation de l’environnement et développement***

***Installation du Framework Spring***

Nous avons suivi le TP 1 afin d’installer et configurer .

![](img/008.png)

![](img/009.png)

![](img/010.png)

![](img/011.png)

MAVEN WEB

![](img/012.png)

MAVEN DATABASE

![](img/013.png)

MAVEN JPA

![](img/014.png)

Correcte MAVEN ERROR

![](img/015.png)

Html error

![](img/016.png)

Correcte html error 

![](img/017.png)

Config H2

![](img/018.png)

Config mysql

![](img/019.png)

***Selecte server***

![](img/020.png)

***Download library***

![](img/021.png)

***Install JDK 1.8***

![](img/022.png)

***Installation du Serveur d’application TomCat***

Afin de tester et exécuter l’application sur la machine Host durant le développement, nous avons besoin d’un serveur d’application JEE. Pour cela, nous avons eu recours au serveur TomCat.

![](img/023.png)

***Mapping de la structure*** 

Nous avons suivi le TP 2 afin de réaliser le Mapping de la structure comme suit : 

Aussi, nous avons modifier le fichier pom.xml afin d’injecter les dépendances dans notre projet JEE : 

CONCLUSION

Ce site Web fournit une version informatisée du système de gestion de bibliothèque qui Profiter aux étudiants ainsi qu'au personnel de la bibliothèque.

Il rend l'ensemble du processus en ligne où l'étudiant peut rechercher des livres, le personnel peut générer des rapports et faire des transactions de livres. Il dispose également d'une installation pour la connexion des étudiants où l'étudiant peut se connecter et peut voir état des livres émis ainsi que demande de livre.


***Conclusion Générale***

`     `Afin de bien conclure cette dernière partie du processus de développement, nous devons mettre en évidence, que la réalisation n’était et ne sera jamais l’étape finale du processus de développement d’un bon système d’information. Et comme constaté au cours de l’étude des risques et mesures à prendre, on confirme qu’il faut continuer à suivre notre système et de le superviser et cela par sa mise en essai par les utilisateurs, dans le but de détecter les éventuels bugs et anomalies et les corriger pour assurer sa stabilité et sa fiabilité.












