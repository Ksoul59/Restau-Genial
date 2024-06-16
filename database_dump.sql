-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 15 juin 2024 à 10:40
-- Version du serveur :  10.4.19-MariaDB
-- Version de PHP : 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `restau`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'PLATS'),
(2, 'BOISSONS'),
(3, 'MENU');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210531115328', '2021-05-31 13:53:46', 58),
('DoctrineMigrations\\Version20210531125518', '2021-05-31 14:55:32', 80),
('DoctrineMigrations\\Version20210531131656', '2021-05-31 15:17:09', 38),
('DoctrineMigrations\\Version20210531222008', '2021-06-01 00:21:11', 113),
('DoctrineMigrations\\Version20210607145506', '2021-06-07 16:56:14', 216),
('DoctrineMigrations\\Version20210607155309', '2021-06-07 17:53:15', 32),
('DoctrineMigrations\\Version20210607162901', '2021-06-07 18:30:19', 183),
('DoctrineMigrations\\Version20210607164137', '2021-06-07 18:41:43', 30),
('DoctrineMigrations\\Version20210611153745', '2021-06-11 17:38:02', 221);

-- --------------------------------------------------------

--
-- Structure de la table `plats`
--

CREATE TABLE `plats` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `image_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `plats`
--

INSERT INTO `plats` (`id`, `name`, `price`, `description`, `quantity`, `image_name`, `updated_at`) VALUES
(3, 'LA CLASSIC CAESAR', '5', 'La Classic Caesar est composée d\'émincés de filet de poulet mariné et rôti* origine France, de Grana Padano AOP et de croûtons croustillants.', 15, '549199707a05a77821cdf66ff581ff98624bc861-60be8ba3292b9738095293.png', '2021-06-07 23:12:03'),
(8, 'L\'ITALIAN MOZZA ET PASTA', '5', 'L\'Italian Mozza & Pasta, une recette végétarienne composée d\'une mozzarella au lait de bufflonne, de pâtes radiatori et de tomates assaisonnées.', 10, '2b15bb8168e4dff0fba963003c4c8e20c46eb652-60be902f4e03c560321407.png', '2021-06-07 23:31:27'),
(16, 'Fish Burger', '5', '100% du poisson dans les sandwiches des restaurants Restau-Genial est pêché en pleine mer et provient de pêcheries qui ont répondu au référentiel environnemental du MSC pour une pêche durable et bien gérée', 15, 'fish-burger-60bea81c9beed559814160.png', '2021-06-08 01:13:32'),
(19, 'M-burger', '5', 'Petite mise au point sur la viande bovine : ? La viande de nos steaks hachés est 100% pur bœuf et provient de bovins d\'origine française pour 51,27% (chiffres et estimations sur base des volumes de produits achetés en 2015).', 15, 'm-burger-60bea901ed743577537799.png', '2021-06-08 01:17:21'),
(21, 'Coca Cola 33 cl', '2', 'boisson de la marque Coca cola', 12, 'coca33-removebg-preview-60c683f8dc5f5050362508.png', '2021-06-14 00:17:28'),
(22, 'Ice Tea 33 cl', '2', 'boisson de la marque Ice Tea', 8, 'icetea33-removebg-preview-60d2480bd2888175806441.png', '2021-06-22 22:28:59'),
(23, 'Fanta 33 cl', '2', 'boisson de la marque Fanta', 10, 'fanta33-removebg-preview-60d5a1c8e2366578519634.png', '2021-06-25 11:28:40'),
(24, 'Menu 1', '10', 'Menu 1', 12, 'menu-1-60d5a3e4a128b960356836.png', '2021-06-25 11:37:40');

-- --------------------------------------------------------

--
-- Structure de la table `plats_category`
--

CREATE TABLE `plats_category` (
  `plats_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `plats_category`
--

INSERT INTO `plats_category` (`plats_id`, `category_id`) VALUES
(3, 1),
(8, 1),
(16, 1),
(19, 1),
(21, 2),
(22, 2),
(23, 2),
(24, 3);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(2, 1, 'vhc06P0crTQPMNkkF5cW', 'ydKDrtxZU1ky1DKcD9Uqc8kw8sos18H5ipllcajz3EM=', '2021-06-23 17:41:06', '2021-06-23 18:41:06');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `is_verified`) VALUES
(1, 'erim59@msn.com', '[\"ROLE_ADMIN\",\"ROLE_USER\",\"ROLE_MANAGER\"]', '$2y$13$p2YpGYzgjrXyys9gS7zqIujL0WAQUJLtqJMLexIs6pSv2xQG59eo2', 0),
(4, 'user@user.com', '[\"ROLE_USER\"]', '$2y$13$lBxFJ1DQk1llOSu.Px/tSeYb8ERSguFtf0emIcFrdAsS570jVv3G6', 0),
(5, 'manager@manager.com', '[\"ROLE_USER\",\"ROLE_MANAGER\"]', '$2y$13$hRsuy.zrZsIJBQbR15d5bOJZoJonudA29MWTgSesLZqKcugIYjMjC', 0),
(6, '0505@msn.com', '[\"ROLE_USER\",\"ROLE_MANAGER\",\"ROLE_ADMIN\"]', '$2y$13$GkVevKqqH5XC/oiajF2kQOS1hNPOF/dc7M16qZIszQlJuPPvJcI6W', 0),
(7, 'kk59@msn.com', '[]', '$2y$13$7AXuUHc1iKMgS.1l3w.iCuesldLC9bhFFO2KDC0X/rvEdubLYmeG.', 0),
(8, 'phil@msn.com', '[\"ROLE_USER\"]', '$2y$13$V/PHkEdcJmfav/d2Kl3QO.HiG7ulN9a65Oo3GJBx7aP12JXhIpC3y', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `plats`
--
ALTER TABLE `plats`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `plats_category`
--
ALTER TABLE `plats_category`
  ADD PRIMARY KEY (`plats_id`,`category_id`),
  ADD KEY `IDX_816ADEA5AA14E1C8` (`plats_id`),
  ADD KEY `IDX_816ADEA512469DE2` (`category_id`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `plats`
--
ALTER TABLE `plats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `plats_category`
--
ALTER TABLE `plats_category`
  ADD CONSTRAINT `FK_816ADEA512469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_816ADEA5AA14E1C8` FOREIGN KEY (`plats_id`) REFERENCES `plats` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
