-- --------------------------------------------------------

-- Hôte :                        localhost

-- Version du serveur:           8.0.16 - MySQL Community Server - GPL

-- SE du serveur:                Win64

-- HeidiSQL Version:             10.2.0.5599

-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET NAMES utf8 */

;

/*!50503 SET NAMES utf8mb4 */

;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */

;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */

;

-- Listage de la structure de la table toys-r-us. brands

CREATE TABLE
    IF NOT EXISTS `brands` (
        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `name` varchar(150) NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8;

-- Listage des données de la table toys-r-us.brands : ~7 rows (environ)

/*!40000 ALTER TABLE `brands` DISABLE KEYS */

;

INSERT INTO
    `brands` (`id`, `name`)
VALUES (1, 'Ravensburger'), (2, 'Silverlit Toys'), (3, 'Asmodée'), (4, 'Clementoni'), (5, 'Playmobil'), (6, 'Mattel'), (7, 'Wow Wee');

/*!40000 ALTER TABLE `brands` ENABLE KEYS */

;

-- Listage de la structure de la table toys-r-us. contact

CREATE TABLE
    IF NOT EXISTS `contact` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `pseudo` varchar(50) NOT NULL,
        `email` varchar(50) NOT NULL,
        `message` text NOT NULL,
        `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8;

-- Listage des données de la table toys-r-us.contact : ~11 rows (environ)

/*!40000 ALTER TABLE `contact` DISABLE KEYS */

;

INSERT INTO
    `contact` (
        `id`,
        `pseudo`,
        `email`,
        `message`,
        `date_creation`
    )
VALUES (
        1,
        'jul',
        'jul@gmail.com',
        'salut',
        '2019-10-24 15:14:44'
    ), (
        2,
        '1',
        '1',
        '1',
        '2019-10-24 15:22:05'
    ), (
        3,
        'julien',
        'mymail@my.mail',
        'je veux acheter des jouets',
        '2019-10-24 15:25:33'
    ), (
        4,
        'louis',
        'louis@gmail.com',
        'je veux des pokemons!!\r\n',
        '2019-10-24 15:50:52'
    ), (
        5,
        'JL',
        'rfgrgg@girjgi',
        'hola',
        '2019-10-25 13:55:35'
    ), (
        6,
        'ghom',
        'ghom@lidem.fr',
        'au top',
        '2019-10-25 14:25:01'
    ), (
        7,
        'flo',
        'flo@gm.com',
        'keekekke',
        '2019-10-25 14:30:15'
    ), (
        8,
        'julien',
        'lopez@gmail.com',
        'hkbjkbkjuiuio',
        '2019-10-25 14:31:54'
    ), (
        9,
        'toto',
        'tutu@gmail.com',
        'toto tutu tata',
        '2019-10-25 14:34:55'
    ), (
        10,
        'flo',
        'jul@un',
        'bgiuguigui',
        '2019-10-25 14:36:57'
    ), (
        11,
        'ghom',
        'jul8966@gmail.com',
        'htht',
        '2019-10-25 14:50:37'
    );

/*!40000 ALTER TABLE `contact` ENABLE KEYS */

;

-- Listage de la structure de la table toys-r-us. sales

CREATE TABLE
    IF NOT EXISTS `sales` (
        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `toy_id` int(10) unsigned NOT NULL,
        `date_sold` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `quantity` int(10) unsigned NOT NULL,
        PRIMARY KEY (`id`),
        KEY `FK_sales_toys` (`toy_id`),
        CONSTRAINT `FK_sales_toys` FOREIGN KEY (`toy_id`) REFERENCES `toys` (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 101 DEFAULT CHARSET = utf8;

-- Listage des données de la table toys-r-us.sales : ~100 rows (environ)

/*!40000 ALTER TABLE `sales` DISABLE KEYS */

;

INSERT INTO
    `sales` (
        `id`,
        `toy_id`,
        `date_sold`,
        `quantity`
    )
VALUES (1, 1, '2019-01-01 00:00:00', 2), (2, 1, '2019-02-01 00:00:00', 3), (3, 1, '2019-03-01 00:00:00', 5), (4, 1, '2019-04-01 00:00:00', 8), (5, 1, '2019-05-01 00:00:00', 6), (6, 1, '2019-06-01 00:00:00', 8), (7, 1, '2019-07-01 00:00:00', 9), (8, 1, '2019-08-01 00:00:00', 2), (9, 1, '2019-09-01 00:00:00', 2), (10, 1, '2019-12-01 00:00:00', 1), (11, 2, '2019-12-01 00:00:00', 2), (12, 2, '2019-03-01 00:00:00', 3), (13, 2, '2019-05-01 00:00:00', 5), (14, 2, '2019-06-01 00:00:00', 8), (15, 2, '2019-08-01 00:00:00', 6), (16, 2, '2019-09-01 00:00:00', 7), (17, 2, '2019-10-01 00:00:00', 1), (18, 2, '2019-11-01 00:00:00', 2), (19, 2, '2019-01-01 00:00:00', 2), (20, 2, '2019-02-01 00:00:00', 1), (21, 3, '2019-01-01 00:00:00', 3), (22, 3, '2019-02-01 00:00:00', 1), (23, 3, '2019-12-01 00:00:00', 7), (24, 3, '2019-03-01 00:00:00', 8), (25, 3, '2019-04-01 00:00:00', 6), (26, 3, '2019-05-01 00:00:00', 4), (27, 3, '2019-07-01 00:00:00', 2), (28, 3, '2019-08-01 00:00:00', 1), (29, 3, '2019-09-01 00:00:00', 8), (30, 3, '2019-10-01 00:00:00', 7), (31, 4, '2019-01-01 00:00:00', 4), (
        32,
        4,
        '2019-02-01 00:00:00',
        11
    ), (
        33,
        4,
        '2019-04-01 00:00:00',
        15
    ), (
        34,
        4,
        '2019-06-01 00:00:00',
        18
    ), (35, 4, '2019-07-01 00:00:00', 5), (36, 4, '2019-08-01 00:00:00', 3), (37, 4, '2019-09-01 00:00:00', 7), (38, 4, '2019-10-01 00:00:00', 2), (39, 4, '2019-11-01 00:00:00', 1), (40, 4, '2019-12-01 00:00:00', 1), (41, 5, '2019-01-01 00:00:00', 4), (42, 5, '2019-02-01 00:00:00', 1), (43, 5, '2019-04-01 00:00:00', 5), (44, 5, '2019-06-01 00:00:00', 8), (45, 5, '2019-07-01 00:00:00', 5), (46, 5, '2019-08-01 00:00:00', 3), (47, 5, '2019-09-01 00:00:00', 7), (48, 5, '2019-10-01 00:00:00', 2), (49, 5, '2019-11-01 00:00:00', 1), (50, 5, '2019-12-01 00:00:00', 4), (51, 6, '2019-01-01 00:00:00', 8), (52, 6, '2019-02-01 00:00:00', 3), (53, 6, '2019-03-01 00:00:00', 6), (54, 6, '2019-04-01 00:00:00', 8), (55, 6, '2019-05-01 00:00:00', 4), (56, 6, '2019-06-01 00:00:00', 2), (57, 6, '2019-07-01 00:00:00', 4), (58, 6, '2019-08-01 00:00:00', 2), (59, 6, '2019-09-01 00:00:00', 5), (60, 6, '2019-12-01 00:00:00', 4), (61, 7, '2019-03-01 00:00:00', 2), (62, 7, '2019-04-01 00:00:00', 1), (63, 7, '2019-05-01 00:00:00', 7), (64, 7, '2019-06-01 00:00:00', 8), (65, 7, '2019-07-01 00:00:00', 6), (66, 7, '2019-08-01 00:00:00', 2), (67, 7, '2019-09-01 00:00:00', 9), (68, 7, '2019-10-01 00:00:00', 1), (69, 7, '2019-11-01 00:00:00', 1), (70, 7, '2019-12-01 00:00:00', 4), (71, 8, '2019-02-01 00:00:00', 2), (72, 8, '2019-03-01 00:00:00', 1), (73, 8, '2019-04-01 00:00:00', 7), (74, 8, '2019-05-01 00:00:00', 1), (75, 8, '2019-06-01 00:00:00', 5), (76, 8, '2019-08-01 00:00:00', 1), (77, 8, '2019-09-01 00:00:00', 3), (78, 8, '2019-10-01 00:00:00', 2), (79, 8, '2019-11-01 00:00:00', 1), (80, 8, '2019-12-01 00:00:00', 8), (81, 9, '2019-02-01 00:00:00', 7), (82, 9, '2019-03-01 00:00:00', 3), (83, 9, '2019-04-01 00:00:00', 1), (84, 9, '2019-05-01 00:00:00', 1), (85, 9, '2019-06-01 00:00:00', 7), (86, 9, '2019-07-01 00:00:00', 2), (87, 9, '2019-09-01 00:00:00', 3), (88, 9, '2019-10-01 00:00:00', 2), (89, 9, '2019-11-01 00:00:00', 1), (90, 9, '2019-12-01 00:00:00', 1), (
        91,
        10,
        '2019-02-01 00:00:00',
        3
    ), (
        92,
        10,
        '2019-03-01 00:00:00',
        1
    ), (
        93,
        10,
        '2019-04-01 00:00:00',
        2
    ), (
        94,
        10,
        '2019-05-01 00:00:00',
        1
    ), (
        95,
        10,
        '2019-06-01 00:00:00',
        9
    ), (
        96,
        10,
        '2019-07-01 00:00:00',
        5
    ), (
        97,
        10,
        '2019-08-01 00:00:00',
        4
    ), (
        98,
        10,
        '2019-09-01 00:00:00',
        1
    ), (
        99,
        10,
        '2019-11-01 00:00:00',
        2
    ), (
        100,
        10,
        '2019-12-01 00:00:00',
        6
    );

/*!40000 ALTER TABLE `sales` ENABLE KEYS */

;

-- Listage de la structure de la table toys-r-us. stock

CREATE TABLE
    IF NOT EXISTS `stock` (
        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `toy_id` int(10) unsigned NOT NULL,
        `store_id` int(10) unsigned NOT NULL,
        `quantity` int(10) unsigned NOT NULL,
        PRIMARY KEY (`toy_id`, `store_id`),
        KEY `FK_stock_stores` (`store_id`),
        KEY `id` (`id`),
        CONSTRAINT `FK_stock_stores` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`),
        CONSTRAINT `FK_stock_toys` FOREIGN KEY (`toy_id`) REFERENCES `toys` (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 101 DEFAULT CHARSET = utf8;

-- Listage des données de la table toys-r-us.stock : ~100 rows (environ)

/*!40000 ALTER TABLE `stock` DISABLE KEYS */

;

INSERT INTO
    `stock` (
        `id`,
        `toy_id`,
        `store_id`,
        `quantity`
    )
VALUES (11, 1, 1, 2), (12, 1, 2, 13), (13, 1, 3, 5), (14, 1, 4, 18), (15, 1, 5, 6), (16, 1, 6, 8), (17, 1, 7, 9), (18, 1, 8, 12), (19, 1, 9, 10), (20, 1, 10, 0), (21, 2, 1, 12), (22, 2, 2, 3), (23, 2, 3, 15), (24, 2, 4, 8), (25, 2, 5, 16), (26, 2, 6, 7), (27, 2, 7, 1), (28, 2, 8, 2), (29, 2, 9, 0), (30, 2, 10, 10), (31, 3, 1, 3), (32, 3, 2, 11), (33, 3, 3, 7), (34, 3, 4, 8), (35, 3, 5, 16), (36, 3, 6, 4), (37, 3, 7, 2), (38, 3, 8, 1), (39, 3, 9, 0), (40, 3, 10, 7), (6, 4, 1, 3), (4, 4, 2, 15), (7, 4, 3, 7), (9, 4, 4, 2), (1, 4, 5, 12), (10, 4, 6, 0), (3, 4, 7, 0), (8, 4, 8, 9), (5, 4, 9, 8), (2, 4, 10, 5), (41, 5, 1, 4), (42, 5, 2, 11), (43, 5, 3, 15), (44, 5, 4, 18), (45, 5, 5, 5), (46, 5, 6, 3), (47, 5, 7, 7), (48, 5, 8, 2), (49, 5, 9, 1), (50, 5, 10, 0), (51, 6, 1, 8), (52, 6, 2, 3), (53, 6, 3, 6), (54, 6, 4, 8), (55, 6, 5, 4), (56, 6, 6, 2), (57, 6, 7, 4), (58, 6, 8, 2), (59, 6, 9, 0), (60, 6, 10, 4), (61, 7, 1, 2), (62, 7, 2, 1), (63, 7, 3, 7), (64, 7, 4, 8), (65, 7, 5, 16), (66, 7, 6, 2), (67, 7, 7, 9), (68, 7, 8, 11), (69, 7, 9, 10), (70, 7, 10, 4), (71, 8, 1, 12), (72, 8, 2, 1), (73, 8, 3, 7), (74, 8, 4, 1), (75, 8, 5, 5), (76, 8, 6, 1), (77, 8, 7, 3), (78, 8, 8, 2), (79, 8, 9, 1), (80, 8, 10, 0), (81, 9, 1, 7), (82, 9, 2, 3), (83, 9, 3, 15), (84, 9, 4, 1), (85, 9, 5, 7), (86, 9, 6, 2), (87, 9, 7, 3), (88, 9, 8, 2), (89, 9, 9, 1), (90, 9, 10, 10), (91, 10, 1, 3), (92, 10, 2, 1), (93, 10, 3, 2), (94, 10, 4, 1), (95, 10, 5, 9), (96, 10, 6, 5), (97, 10, 7, 12), (98, 10, 8, 1), (99, 10, 9, 0), (100, 10, 10, 6);

/*!40000 ALTER TABLE `stock` ENABLE KEYS */

;

-- Listage de la structure de la table toys-r-us. stores

CREATE TABLE
    IF NOT EXISTS `stores` (
        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `name` varchar(150) NOT NULL,
        `postal_code` int(5) unsigned NOT NULL,
        `city` varchar(150) NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8;

-- Listage des données de la table toys-r-us.stores : ~10 rows (environ)

/*!40000 ALTER TABLE `stores` DISABLE KEYS */

;

INSERT INTO
    `stores` (
        `id`,
        `name`,
        `postal_code`,
        `city`
    )
VALUES (
        1,
        'Toys\'R\'Us Perpignan',
        66000,
        'PERPIGNAN'
    ), (
        2,
        'Toys\'R\'Us Montpellier',
        34970,
        'LATTES'
    ), (
        3,
        'Toys\'R\'Us Saint Orens',
        31650,
        'SAINT ORENS DE GAMEVILLE'
    ), (
        4,
        'Toys\'R\'Us Toulouse',
        31120,
        'TOULOUSE'
    ), (
        5,
        'Toys\'R\'Us Avignon',
        84700,
        'SORGUES'
    ), (
        6,
        'Toys\'R\'Us Vitrolles',
        13127,
        'VITROLLES'
    ), (
        7,
        'Toys\'R\'Us La Valentine',
        13926,
        'MARSEILLE'
    ), (
        8,
        'Toys\'R\'Us Toulon',
        83130,
        'LA GARDE'
    ), (
        9,
        'Toys\'R\'Us Pau',
        64230,
        'LESCAR'
    ), (
        10,
        'Toys\'R\'Us Bordeaux',
        33300,
        'BORDEAUX'
    );

/*!40000 ALTER TABLE `stores` ENABLE KEYS */

;

-- Listage de la structure de la table toys-r-us. toys

CREATE TABLE
    IF NOT EXISTS `toys` (
        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `name` varchar(150) NOT NULL,
        `description` text NOT NULL,
        `brand_id` int(10) unsigned NOT NULL,
        `price` decimal(5, 2) unsigned NOT NULL,
        `image` varchar(155) DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `FK_toys_brands` (`brand_id`),
        CONSTRAINT `FK_toys_brands` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8;

-- Listage des données de la table toys-r-us.toys : ~10 rows (environ)

/*!40000 ALTER TABLE `toys` DISABLE KEYS */

;

INSERT INTO
    `toys` (
        `id`,
        `name`,
        `description`,
        `brand_id`,
        `price`,
        `image`
    )
VALUES (
        1,
        'Gravitrax Starter Set',
        '<p>Avec le système de circuit à billes GraviTrax, crée tes propres circuits en respectant les lois de la gravité. Combine les blocs de construction pour en faire un parcours riche en actions où les billes atteindront leur cible en s\'aidant du magnétisme, de la cinétique et de la gravité. Le système de circuit à bille GraviTrax peut être agrandi à l\'infini grâce aux blocs de construction et plateformes supplémentaires, ainsi qu\'aux blocs action pour un amusement sans limites !</p><p>Un contenu très riche (106 éléments) qui permet une multiplicité de construction. Une courbe d\'apprentissage liée à l\'utilisation du produit : plus l\'enfant joue, plus il pourra construire des circuits élaborés et produire des effets bluffants sans que sa bille sorte des rails ! Découverte des lois de la gravité, de la cinétique et du magnétisme- Des exemples de circuits déjà construis et de la construction libre.</p><p>Contenu du pack<br>- 1 carnet d\'exercices<br>- 1 carnet avec plans de montage<br>- 4 grilles de support<br>- 2 plateformes transparentes<br>- 6 billes<br>- 40 blocs de construction épais<br>- 12 blocs de construction fins<br>- 1 bloc 3-en-1<br>- 1 bloc départ<br>- 21 virages<br>- 3 intersections<br>- 2 aiguillages<br>- 1 tourbillon<br>- 1 canon magnétique<br>- 3 rails longs<br>- 6 rails moyens<br>- 9 rails courts<br>- 1 marqueur darrivée<br>- 4 blocs base avec inserts : 2 attrapeurs, 1 chute libre, 1 splash, 1 arrivée</p>',
        1,
        39.99,
        'gravitrax-starter-set.jpg'
    ), (
        2,
        'Voiture radiocommandée - 360 Cross For Girl échelle 1/18',
        '<p>Défie tous les terrains à 360° !<br>Un design 100% girly !</p><p>- Conçue pour franchir tous les obstacles à 360° !<br>- Rien ne résiste à la 360 Cross!</p><p>Une accélération foudroyante, des pneus qui encaissent tous les chocs, un système de conduite sur 2 faces, rien ne résiste à cette voiture à radio fréquence !</p><p>Contenu :<br>- 1 véhicule<br>- 1 télécommande</p><p><em>La voiture fonctionne avec 4 piles AA-LR06 non incluses.<br>La Télécommande fonctionne avec une pile 6LR61 - 9 VOLT non incluse.</em></p>',
        2,
        24.99,
        'cross-for-girl-1-18.jpg'
    ), (
        3,
        'Coffret - Pokémon 7.5 Majesté Des Dragons - Ultra-Necrozma GX',
        '<p>Apprends à dompter la puissance d\'un Pokémon Ultra-Chimère aussi iconique que mystérieux avec ce <strong>Coffret Majesté Des Dragons - Ultra-Necrozma</strong> incluant un Pokémon de légende dans sa version GX et 4 Boosters !</p><p>Né de l\'absorption d\'un Pokémon Légendaire, Ultra-Nécrozma-GX est un Pokémon énigmatique aux pouvoirs psychiques impressionnants ! Apporte à ta collection une touche de danger et d\'inconnu en intégrant ce Pokémon majestueux à ta collection.</p><p><strong>Contenu du pack :</strong><br>- 4 Boosters Pokémon (40 Cartes)<br>- 1 Carte brillante Ultra-Necrozma GX<br>- 1 Carte géante Ultra-Necrozma GX<br>- 1 Carte à Code pour le JCC Pokémon Online</p>',
        3,
        24.99,
        'coffret-pokemon-7-5-majeste-des-dragons-ultra-necrozma-gx.jpg'
    ), (
        4,
        'Clementoni - Explora globe',
        '<p>Votre enfant va pouvoir partir à la découverte du globe terrestre grâce à l\'Explora globe de Clementoni. Ce globe interactif est muni d\'une base et d\'un stylo interactif qui vont permettre à l\'enfant d\'apprendre tout en s\'amusant. Doté de 13 types d\'informations différentes, ce globe interactif pour enfant comprend 500 questions qui vont tester les connaissances de l\'enfant et l\'aider à apprendre et à perfectionner son savoir. Ces questions simples portent sur des informations que l\'enfant connaît déjà ou apprendra à l\'aide du globe Explora. Capitales, superficie des pays, langues parlées, monnaie utilisée L\'enfant étudie et s\'instruit de manière ludique et pratique, il sera ainsi incollable à l\'école ! Cultivant la curiosité de chaque joueur, ce globe interactif Clementoni est adapté aux enfants de 7 à 12 ans. Ce sera également un excellent moyen pour travailler à deux et aider les plus jeunes à découvrir le globe terrestre et ses particularités. Le volume du haut-parleur se règle facilement pour l\'adapter aux besoins de concentration de chacun. Apprendre tout en s\'amusant, voici une excellente manière de réviser la géographie et bien plus !</p>',
        4,
        49.99,
        'clementoni-explora-globe.jpg'
    ), (
        5,
        'Coffret Dresseur - Pokémon Soleil & Lune - Édition Collector Pikachu & Evoli',
        '<p>Ce <strong>Coffret Collector Pokémon - Pikachu & Evoli</strong>, vendu exclusivement chez Toys\'\'R\'\'Us, est un véritable coffre aux trésors pour les apprentis dresseurs ! À l\'intérieur de cette mallette de rangement en métal se cachent une multitude de produits dérivés du Jeu de Cartes à Collectionner Pokémon.</p><p><strong>Contenu du pack :</strong><br>- 5 Boosters Pokémon (50 Cartes)<br>- 3 Cartes promo (Artikodin, Sulfura & Électhor)<br>- 1 Mini Cahier range-cartes<br>- 2 Feuillets avec stickers<br>- 1 Bloc-notes Pokémon<br>- 4 Crayons Pokémon<br>- 1 Jeton Pokémon<br>- 1 Carte à Code pour le JCC Pokémon online.</p>',
        3,
        27.99,
        'coffret-dresseur-pokemon-soleil-lune-edition-collector-pikachu-evoli.jpg'
    ), (
        6,
        'Playmobil Dragons - Harold et Krokmou - 9246',
        '<p>Les écailles dorsales de Krokmou s\'illuminent (nécessite 1 pile 1,5V AAA non fournie).<br>Krokmou peut envoyer une boule de feu avec sa gueule.<br>Dimensions Krokmou : 38 x 49,5 x 20 cm (LxPxH).<br><em>DreamWorks Dragons © 2017 DreamWorks Animation LLC. All Rights Reserved.</em></p>',
        5,
        29.99,
        'playmobil-dragons-harold-et-krokmou-9246.jpg'
    ), (
        7,
        'Figurine 22 cm - Jurassic World 2 - Indodino',
        '<p>Prédateur clé du nouveau film, l\'Indoraptor possède différentes caractéristiques uniques : épines qui se dressent sur son dos et une multitude de points d\'articulation.</p><p>Du haut de ces 22 cm nous pourrons voir les yeux de cette figurine s\'allumer et l\'entendre rugir !</p>',
        6,
        34.99,
        'figurine-22-cm-jurassic-world-2-Indodino.jpg'
    ), (
        8,
        'Figurine articulée et sonore Dinosaure 22 cm - Jurassic World 2 - T-Rex',
        '<p>Inspirée par le plus célèbre dinosaure du film Jurassic World 2, cette figurine de 22 cm possède des effets sonores et des articulations jamais vues !</p><p>En plus des rugissements ce dinosaure va pouvoir se débattre en agitant sa tête.</p><p>Fonctionne avec 3 piles AAA-LR03 incluses.</p>',
        6,
        34.99,
        'figurine-articulee-et-sonore-dinosaure-22-cm-jurassic-world-2-t-rex.jpg'
    ), (
        9,
        'Wow Wee - T-Rex Fingerlings Vert / Tracker',
        '<p>Tracker est un bébé T-Rex interactif qui ne manque pas de mordant avec ses dents pointues !</p><p>Il aime s\'accrocher partout et plus particulièrement à ton doigt avec ses pattes robustes !</p><p>Ce petit animal réagit aux sons, aux mouvements et aux touchés.</p><p>Tracker est sauvage et imprévisible, seul toi pourra le dresser !</p><p>Les Fingerlings bébés T-Rex sont disponibles dans plusieurs couleurs (bleu, orange, vert et rouge), vendus séparément. Collectionne les tous !</p>',
        7,
        19.99,
        'wow-wee-t-rex-fingerlings-vert-tracker.jpg'
    ), (
        10,
        'Masque électronique - Jurassic World 2 - Velociraptor Blue',
        '<p>Masque électronique du Vélociraptor Blue de Jurassic World !</p><p>Effrayez-vos amis avec ce masque reproduisant les différents cris et regards mythiques du dinosaure !<br>La mâchoire du dinosaure va également suivre la votre !</p><p>Fonctionne avec 3 piles LR-44 incluses.</p>',
        6,
        39.99,
        'masque-electronique-jurassic-world-2-velociraptor-blue.jpg'
    );

/*!40000 ALTER TABLE `toys` ENABLE KEYS */

;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */

;

/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */

;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

-- quantité totale pour tous les magasins

SELECT SUM(quantity) AS total FROM stock WHERE toy_id = 1;

-- stock pour un jouet et pour un magasin

SELECT quantity FROM stock WHERE toy_id = 3 AND store_id = 3;

-- récupérer l'id et le nom du magasin

SELECT id, name FROM stores;

-- pour créer le select

-- requête qui sort les trois jouets les plus vendus

SELECT
    t.id,
    t.name,
    t.image,
    t.price,
    SUM (s.quantity) AS total
FROM toys AS t
    INNER JOIN sales as s ON t.id = s.toy_id
GROUP BY t.id
ORDER BY total DESC
LIMIT 3;

SELECT
    brands.name,
    brands.id,
    COUNT(toys.brand_id) AS total
FROM brands
    INNER JOIN toys ON brands.id = toys.brand_id
GROUP BY brands.id;

SELECT
    stock.quantity,
    toys.id,
    toys.name,
    toys.description,
    toys.price,
    toys.image,
    stores.name AS store_name,
    stores.postal_code,
    stores.city,
    brands.name AS brand_name
FROM stock
    INNER JOIN toys ON stock.toy_id = toys.id
    INNER JOIN stores ON stock.store_id = stores.id
    INNER JOIN brands ON toys.brand_id = brands.id
WHERE stores.id = 1;