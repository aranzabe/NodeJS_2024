-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 17-01-2024 a las 12:53:31
-- Versión del servidor: 8.0.35-0ubuntu0.22.04.1
-- Versión de PHP: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sequelizeAsociaciones_dev`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `comentario` varchar(255) DEFAULT NULL,
  `puntuacion` varchar(255) DEFAULT NULL,
  `userId` int NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`id`, `comentario`, `puntuacion`, `userId`, `createdAt`, `updatedAt`) VALUES
(1, 'Deberías pasármela más, Michael', '4', 2, '2024-01-17 09:17:06', '2024-01-17 09:17:06'),
(2, 'Es que soy un poco chupón...', '5', 1, '2024-01-17 09:17:06', '2024-01-17 09:17:06'),
(3, 'Que jugamos los 5!!!!', '2', 2, '2024-01-17 09:17:06', '2024-01-17 09:17:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `desc`, `createdAt`, `updatedAt`) VALUES
(1, 'admin', '2024-01-17 10:17:18', '2024-01-17 10:17:18'),
(2, 'programador', '2024-01-17 10:17:18', '2024-01-17 10:17:18'),
(3, 'invitado', '2024-01-17 10:17:36', '2024-01-17 10:17:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolesasignados`
--

CREATE TABLE `rolesasignados` (
  `id` int NOT NULL,
  `idU` int NOT NULL,
  `idR` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `rolesasignados`
--

INSERT INTO `rolesasignados` (`id`, `idU`, `idR`, `createdAt`, `updatedAt`) VALUES
(1, 1, 1, '2024-01-17 10:25:09', '2024-01-17 10:25:09'),
(2, 1, 2, '2024-01-17 10:25:09', '2024-01-17 10:25:09'),
(3, 2, 2, '2024-01-17 10:25:24', '2024-01-17 10:25:24'),
(4, 3, 3, '2024-01-17 10:25:24', '2024-01-17 10:25:24'),
(5, 3, 2, '2024-01-17 10:25:38', '2024-01-17 10:25:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SequelizeMeta`
--

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `SequelizeMeta`
--

INSERT INTO `SequelizeMeta` (`name`) VALUES
('20240113185815-create-user.js'),
('20240113190652-create-comments.js'),
('20240117084008-create-rol.js'),
('20240117084010-create-rol-asignado.js');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'Virgo', 'Delapaz Lucero', 'Virginia39@yahoo.com', '$2b$10$eXTym1PAmp.BaxQuSUeDSOQUl7qIo/s5luSyMg6sClIdNhU/tAwoW', '2024-01-17 09:17:06', '2024-01-17 09:17:06'),
(2, 'Virgo', 'Gurule Porras', 'Carla89@yahoo.com', '$2b$10$vB.HhD/vF8l.yIcBrYr4n.vZ.eWKp2S/IcNK9XeA21/bQDLPTZM3y', '2024-01-17 09:17:06', '2024-01-17 09:17:06'),
(3, 'Aquarius', 'Bañuelos Tamayo', 'Reina_SaavedraMunoz12@gmail.com', '$2b$10$zGZd3a6X2JeIU5GczATGQexFiMTwxZk.y.bcKQR9Sx0LzMszT8FJq', '2024-01-17 09:17:06', '2024-01-17 09:17:06');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rolesasignados`
--
ALTER TABLE `rolesasignados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idU` (`idU`),
  ADD KEY `idR` (`idR`);

--
-- Indices de la tabla `SequelizeMeta`
--
ALTER TABLE `SequelizeMeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `rolesasignados`
--
ALTER TABLE `rolesasignados`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `rolesasignados`
--
ALTER TABLE `rolesasignados`
  ADD CONSTRAINT `rolesasignados_ibfk_1` FOREIGN KEY (`idU`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `rolesasignados_ibfk_2` FOREIGN KEY (`idR`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
