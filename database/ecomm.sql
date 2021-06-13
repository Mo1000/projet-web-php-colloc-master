-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 01 juin 2020 à 07:03
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecomm`
--

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(9, 19, 55, 1);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cat_slug` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `cat_slug`) VALUES
(5, 'Tunis', 'tunis'),
(6, 'Sfax', 'sfax'),
(7, 'Sousse', 'sousse'),
(8, 'Kairouan', 'kairouan'),
(9, 'Bizerte', 'bizerte'),
(10, 'Gabès', 'gabès'),
(11, 'Ariana', 'ariana'),
(12, 'Gafsa', 'gafsa'),
(13, 'Monastir', 'monastir'),
(14, 'Tozeur', 'tozeur'),
(15, 'Zaghouan', 'zaghouan');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

CREATE TABLE `comment` (
  `id_comm` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `post_comment` varchar(255) NOT NULL,
  `date_post` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id_comm`, `id_user`, `id_product`, `post_comment`, `date_post`) VALUES
(16, 18, 55, 'aaaaaa', '2020-06-01 02:29:59'),
(17, 18, 55, 'bonsoir', '2020-06-01 03:05:36'),
(18, 18, 55, 'c est enrore valable', '2020-06-01 03:08:30'),
(19, 19, 55, 'on peut négocier un contrat ?', '2020-06-01 03:13:55'),
(20, 18, 56, 'Bonjour je suis je suis intéressé', '2020-06-01 04:38:30'),
(21, 18, 56, 'c est a quel quartier de sousse ?', '2020-06-01 04:38:54');

-- --------------------------------------------------------

--
-- Structure de la table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `sales_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(14, 9, 11, 2),
(15, 9, 13, 5),
(16, 9, 3, 2),
(17, 9, 1, 3),
(18, 10, 13, 3),
(19, 10, 2, 4),
(20, 10, 19, 5);

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `id_post_user` int(11) NOT NULL,
  `date_view` date NOT NULL,
  `counter` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `id_post_user`, `date_view`, `counter`) VALUES
(54, 5, 'Studio a louer', '<p>Studio &agrave; louer s+2 pour filles richement meubl&eacute;.54161043</p>\r\n', 'studio-louer', 500, 'studio-louer.jpg', 18, '2020-06-01', 12),
(55, 13, 'Chambre individuelle pour fille à monastir', '<p>une chambre individuelle non meubl&eacute; dans un s+3 disponible &agrave; partir du 1er juin. l&#39;appartement est situ&eacute; en face de aziza &agrave; cit&eacute; elwahat dans une r&eacute;sidence bien s&eacute;curis&eacute;.<br />\r\nprix 258 + cautionnement<br />\r\nsurface&nbsp;90 m&sup2;<br />\r\ntel : 20737837</p>\r\n', 'chambre-individuelle-pour-fille-a-monastir', 258, 'chambre-individuelle-pour-fille-a-monastir.jpg', 18, '2020-06-01', 118),
(56, 7, 'Partage chambre graçon à sousse', '<p>A partager un appartement s+3 .</p>\r\n\r\n<p>je suis &eacute;tudiant en informatique.</p>\r\n\r\n<p>Merci de me contacter sur 53110525</p>\r\n', 'partage-chambre-grac-a-sousse', 150, 'partage-chambre-grac-a-sousse.jpg', 20, '2020-06-01', 4),
(57, 5, 'S2 meublé a el manar 1', '<p>90 m&sup2;</p>\r\n\r\n<p>a louer a el manar 1 un s</p>\r\n\r\n<p>plus 2 meubl&eacute; (120m) avec chauffage central , climatisation , place parking&nbsp;</p>\r\n', 's2-meuble-el-manar-1', 1000, 's2-meuble-el-manar-1.jpg', 21, '2020-06-01', 2);

-- --------------------------------------------------------

--
-- Structure de la table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pay_id` varchar(50) NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `pay_id`, `sales_date`) VALUES
(9, 9, 'PAY-1RT494832H294925RLLZ7TZA', '2018-05-10'),
(10, 9, 'PAY-21700797GV667562HLLZ7ZVY', '2018-05-10');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int(1) NOT NULL DEFAULT 1,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `status` int(1) NOT NULL,
  `activate_code` varchar(15) NOT NULL,
  `reset_code` varchar(15) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `address`, `contact_info`, `photo`, `status`, `activate_code`, `reset_code`, `created_on`) VALUES
(18, 'zidiak1@gmail.com', '$2y$10$Ufqj/F9Y5xifkfrUAWNpd.Na3ZM9Mw3IHC.6JHpkhEiBNRKVQeJ7a', 1, 'ahmed', 'gharbi', '', '', 'kisspng-video-royalty-free-social-media-youtube-clip-art-piktochart-visual-editor-5ba36298106ee5.9379103715374342640673.jpg', 1, 'ALEc1M4S7X9h', 'KR6segZMIaiFc9n', '2020-05-28'),
(20, 'ahmed.elgharbi@polytechnicien.tn', '$2y$10$Yw/FuMQYZg9sXUCVSQXtYOIEuURnySCwTFoYSiMZwKkkHs3IAFq6G', 1, 'ali', 'salah', '', '', '', 1, 'kVepS83icfX4', '', '2020-06-01'),
(21, 'gharbiahmed1992@gmail.com', '$2y$10$5Djer4jC45WCXWE1OfNQzOaWVJRvDruQp5x3DiVTzUGbZI2NKwuhG', 1, 'mohamed', 'salah', '', '', '', 1, 'PC5FakmxKu9b', '', '2020-06-01');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comm`);

--
-- Index pour la table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT pour la table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
