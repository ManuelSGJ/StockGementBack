-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 28-05-2023 a las 16:01:00
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `chatbox`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administradores`
--

CREATE TABLE `administradores` (
  `Admin_id` int(11) NOT NULL,
  `Admin_nombre` varchar(255) NOT NULL,
  `Admin_apellido` varchar(255) NOT NULL,
  `Admin_cedula` varchar(255) NOT NULL,
  `Admin_telefono` varchar(255) NOT NULL,
  `Admin_direccion` varchar(255) DEFAULT '',
  `Admin_password` varchar(255) NOT NULL,
  `Admin_fecha_creacion` date NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Admin_nit_empresa_FK` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `administradores`
--

INSERT INTO `administradores` (`Admin_id`, `Admin_nombre`, `Admin_apellido`, `Admin_cedula`, `Admin_telefono`, `Admin_direccion`, `Admin_password`, `Admin_fecha_creacion`, `createdAt`, `updatedAt`, `Admin_nit_empresa_FK`) VALUES
(1, 'Manuel Santiago', 'Garcia Julio', '1007597893', '3004604190', 'Arjona Bolivar Cr 43 #48-28 p2', 'U2FsdGVkX1/V/JAw1LmKREVY+D1fXohds6si3fhzQbA=', '2023-05-09', '2023-05-09 23:23:09', '2023-05-09 23:23:09', '1007597893'),
(2, 'Carlos', 'Casseres Tapia', '1234', '3004604190', 'Arjona Bolivar Cr 43 #48-28 p2', 'U2FsdGVkX19uzaJSNIvDcAk7UgEJuHg3qaYoQqA5TbA=', '2023-05-28', '2023-05-09 23:25:38', '2023-05-28 05:53:39', '1052095853');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulos`
--

CREATE TABLE `articulos` (
  `Articulo_codigo` int(11) NOT NULL,
  `Articulo_descripcion` varchar(255) DEFAULT NULL,
  `Articulo_cantidad` int(11) NOT NULL,
  `Articulo_precio_venta` double NOT NULL,
  `Articulo_iva` int(11) NOT NULL,
  `Articulo_precio_compra` double NOT NULL,
  `venta_min` int(11) NOT NULL,
  `Articulo_fecha_ingreso` datetime NOT NULL,
  `Articulo_info_adicional` datetime NOT NULL,
  `Articulo_notificacion_cantidad` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Articulo_grupo_FK` int(11) DEFAULT NULL,
  `Articulo_marca_FK` int(11) DEFAULT NULL,
  `Articulo_nit_empresa_FK` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `Cliente_codigo` int(11) NOT NULL,
  `Cliente_nombre` varchar(60) NOT NULL,
  `Cliente_apellido` varchar(60) NOT NULL,
  `Cliente_cedula` varchar(15) NOT NULL,
  `Cliente_telefono1` varchar(15) NOT NULL,
  `Cliente_telefono2` varchar(15) DEFAULT NULL,
  `Cliente_contacto` varchar(60) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Tipo_operacion_FK` int(11) DEFAULT NULL,
  `Cliente_nit_empresa_FK` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `Compra_codigo` int(11) NOT NULL,
  `Compra_cantidad` int(11) NOT NULL,
  `Compra_IVA` int(11) NOT NULL,
  `Compra_precio` double NOT NULL,
  `Compra_referencia` varchar(100) NOT NULL,
  `Compra_fecha` date NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Compra_codigo_articulo_FK` int(11) DEFAULT NULL,
  `Compra_codigo_proveedor_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

CREATE TABLE `empresas` (
  `empresa_NIT` varchar(255) NOT NULL,
  `empresa_persona_responsable` varchar(255) NOT NULL,
  `empresa_direccion` varchar(255) NOT NULL,
  `empresa_razon_social` varchar(255) NOT NULL,
  `empresa_fecha_creacion` date NOT NULL,
  `empresa_fecha_licencia` date DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Grupo_nit_empresa_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`empresa_NIT`, `empresa_persona_responsable`, `empresa_direccion`, `empresa_razon_social`, `empresa_fecha_creacion`, `empresa_fecha_licencia`, `createdAt`, `updatedAt`, `Grupo_nit_empresa_FK`) VALUES
('1007597893', 'Manuel Garcia', 'Arjona Bolivar Cr 43 #48-28 p2', 'GEA IT SOLUTIONS', '2023-05-09', '2023-05-30', '2023-05-09 23:21:06', '2023-05-09 23:21:06', NULL),
('1052095853', 'Carlos Humberto Casseres Tapia', 'El carmen de bolivar', 'Farmacia Buena Salud del Carmen', '2023-05-09', '2023-05-31', '2023-05-09 23:22:23', '2023-05-09 23:25:08', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupos_articulos`
--

CREATE TABLE `grupos_articulos` (
  `Grupo_codigo` int(11) NOT NULL,
  `Grupo_nombre` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Grupo_nit_empresa_FK` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_ventas`
--

CREATE TABLE `historial_ventas` (
  `Hventa_codigo` int(11) NOT NULL,
  `Hventa_cantidad` int(11) NOT NULL,
  `Hventa_fecha` datetime NOT NULL,
  `Hventa_precio` double NOT NULL,
  `Hventa_iva` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Hventa_codigo_articulo_FK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

CREATE TABLE `lotes` (
  `Lote_codigo` int(11) NOT NULL,
  `Lote_cantidad` int(11) NOT NULL,
  `Lote_fecha_vencimiento` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Lote_codigo_articulo_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `Marca_codigo` int(11) NOT NULL,
  `Marca_nombre` varchar(60) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Marca_nit_empresa_FK` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `owners`
--

CREATE TABLE `owners` (
  `id` int(11) NOT NULL,
  `cedula` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `owners`
--

INSERT INTO `owners` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(19, '1007597893', 'Manuel Santiago', 'Garcia Julio', '3004604190', 'manegarju15@gmail.com', 'U2FsdGVkX1/T4XN4M7QZRa676h54p7MSW1FcRFX63o8=', '2023-03-21 19:46:03', '2023-04-17 23:19:41'),
(20, '1007597894', 'Vanessa Antonia', 'Garcia Julio', '3206436877', 'vanegaju15@gmail.com', 'U2FsdGVkX1990Cub7+96xNGnabquBqbFvxOoHx8PaYU=', '2023-03-24 17:34:13', '2023-03-24 17:34:13'),
(21, '30761898', 'Inelda', 'Julio Herrera', '3114167027', 'ijuheherrera@hotmail.com', 'U2FsdGVkX19tjZYv0ivCotgDj5GekQFravyIF4/Tnpg=', '2023-04-18 19:38:50', '2023-05-22 16:24:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `Proveedor_codigo` int(11) NOT NULL,
  `Proveedor_nombre` varchar(60) NOT NULL,
  `Proveedor_num_identificacion` varchar(15) NOT NULL,
  `Proveedor_telefono1` varchar(15) NOT NULL,
  `Proveedor_telefono2` varchar(15) DEFAULT NULL,
  `Proveedor_email` varchar(60) NOT NULL,
  `Proveedor_contacto` varchar(60) DEFAULT NULL,
  `Proveedor_direccion` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Proveedor_tipo_identificacion_FK` int(11) DEFAULT NULL,
  `Proveedor_tipo_operacion_FK` int(11) DEFAULT NULL,
  `Proveedor_nit_empresa_FK` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_identificaciones`
--

CREATE TABLE `tipo_identificaciones` (
  `Codigo` int(11) NOT NULL,
  `Tipo_identificacion` varchar(60) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_operacions`
--

CREATE TABLE `tipo_operacions` (
  `Codigo` int(11) NOT NULL,
  `Tipo_operacion_nombre` varchar(60) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `User_id` int(11) NOT NULL,
  `User_cedula` varchar(60) NOT NULL,
  `User_nombre` varchar(60) NOT NULL,
  `User_apellido` varchar(60) NOT NULL,
  `User_password` varchar(255) NOT NULL,
  `User_telefono` varchar(20) NOT NULL,
  `User_modulos` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `User_nit_empresa_FK` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`User_id`, `User_cedula`, `User_nombre`, `User_apellido`, `User_password`, `User_telefono`, `User_modulos`, `createdAt`, `updatedAt`, `User_nit_empresa_FK`) VALUES
(1, '1007597893', 'Manuel Santigo', 'Garcia Julio', 'U2FsdGVkX1+oOFhT+VWYKUDT2YSho8cNbbqkeugAt4c=', '3004604190', '{\"ventas\":\"ventas\",\"compras\":\"compras\",\"historial\":\"historial\"}', '2023-05-09 23:23:52', '2023-05-28 05:54:28', '1007597893');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`Admin_id`),
  ADD UNIQUE KEY `Admin_cedula` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_2` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_3` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_4` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_5` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_6` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_7` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_8` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_9` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_10` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_11` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_12` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_13` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_14` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_15` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_16` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_17` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_18` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_19` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_20` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_21` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_22` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_23` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_24` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_25` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_26` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_27` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_28` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_29` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_30` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_31` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_32` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_33` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_34` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_35` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_36` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_37` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_38` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_39` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_40` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_41` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_42` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_43` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_44` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_45` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_46` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_47` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_48` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_49` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_50` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_51` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_52` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_53` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_54` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_55` (`Admin_cedula`),
  ADD UNIQUE KEY `Admin_cedula_56` (`Admin_cedula`),
  ADD KEY `Admin_nit_empresa_FK` (`Admin_nit_empresa_FK`);

--
-- Indices de la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`Articulo_codigo`),
  ADD KEY `Articulo_grupo_FK` (`Articulo_grupo_FK`),
  ADD KEY `Articulo_marca_FK` (`Articulo_marca_FK`),
  ADD KEY `Articulo_nit_empresa_FK` (`Articulo_nit_empresa_FK`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Cliente_codigo`),
  ADD KEY `Tipo_operacion_FK` (`Tipo_operacion_FK`),
  ADD KEY `Cliente_nit_empresa_FK` (`Cliente_nit_empresa_FK`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`Compra_codigo`),
  ADD KEY `Compra_codigo_articulo_FK` (`Compra_codigo_articulo_FK`),
  ADD KEY `Compra_codigo_proveedor_FK` (`Compra_codigo_proveedor_FK`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`empresa_NIT`),
  ADD KEY `Grupo_nit_empresa_FK` (`Grupo_nit_empresa_FK`);

--
-- Indices de la tabla `grupos_articulos`
--
ALTER TABLE `grupos_articulos`
  ADD PRIMARY KEY (`Grupo_codigo`),
  ADD KEY `Grupo_nit_empresa_FK` (`Grupo_nit_empresa_FK`);

--
-- Indices de la tabla `historial_ventas`
--
ALTER TABLE `historial_ventas`
  ADD PRIMARY KEY (`Hventa_codigo`),
  ADD KEY `Hventa_codigo_articulo_FK` (`Hventa_codigo_articulo_FK`);

--
-- Indices de la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`Lote_codigo`),
  ADD KEY `Lote_codigo_articulo_fk` (`Lote_codigo_articulo_fk`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`Marca_codigo`),
  ADD KEY `Marca_nit_empresa_FK` (`Marca_nit_empresa_FK`);

--
-- Indices de la tabla `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`),
  ADD UNIQUE KEY `cedula_2` (`cedula`),
  ADD UNIQUE KEY `cedula_3` (`cedula`),
  ADD UNIQUE KEY `cedula_4` (`cedula`),
  ADD UNIQUE KEY `cedula_5` (`cedula`),
  ADD UNIQUE KEY `cedula_6` (`cedula`),
  ADD UNIQUE KEY `cedula_7` (`cedula`),
  ADD UNIQUE KEY `cedula_8` (`cedula`),
  ADD UNIQUE KEY `cedula_9` (`cedula`),
  ADD UNIQUE KEY `cedula_10` (`cedula`),
  ADD UNIQUE KEY `cedula_11` (`cedula`),
  ADD UNIQUE KEY `cedula_12` (`cedula`),
  ADD UNIQUE KEY `cedula_13` (`cedula`),
  ADD UNIQUE KEY `cedula_14` (`cedula`),
  ADD UNIQUE KEY `cedula_15` (`cedula`),
  ADD UNIQUE KEY `cedula_16` (`cedula`),
  ADD UNIQUE KEY `cedula_17` (`cedula`),
  ADD UNIQUE KEY `cedula_18` (`cedula`),
  ADD UNIQUE KEY `cedula_19` (`cedula`),
  ADD UNIQUE KEY `cedula_20` (`cedula`),
  ADD UNIQUE KEY `cedula_21` (`cedula`),
  ADD UNIQUE KEY `cedula_22` (`cedula`),
  ADD UNIQUE KEY `cedula_23` (`cedula`),
  ADD UNIQUE KEY `cedula_24` (`cedula`),
  ADD UNIQUE KEY `cedula_25` (`cedula`),
  ADD UNIQUE KEY `cedula_26` (`cedula`),
  ADD UNIQUE KEY `cedula_27` (`cedula`),
  ADD UNIQUE KEY `cedula_28` (`cedula`),
  ADD UNIQUE KEY `cedula_29` (`cedula`),
  ADD UNIQUE KEY `cedula_30` (`cedula`),
  ADD UNIQUE KEY `cedula_31` (`cedula`),
  ADD UNIQUE KEY `cedula_32` (`cedula`),
  ADD UNIQUE KEY `cedula_33` (`cedula`),
  ADD UNIQUE KEY `cedula_34` (`cedula`),
  ADD UNIQUE KEY `cedula_35` (`cedula`),
  ADD UNIQUE KEY `cedula_36` (`cedula`),
  ADD UNIQUE KEY `cedula_37` (`cedula`),
  ADD UNIQUE KEY `cedula_38` (`cedula`),
  ADD UNIQUE KEY `cedula_39` (`cedula`),
  ADD UNIQUE KEY `cedula_40` (`cedula`),
  ADD UNIQUE KEY `cedula_41` (`cedula`),
  ADD UNIQUE KEY `cedula_42` (`cedula`),
  ADD UNIQUE KEY `cedula_43` (`cedula`),
  ADD UNIQUE KEY `cedula_44` (`cedula`),
  ADD UNIQUE KEY `cedula_45` (`cedula`),
  ADD UNIQUE KEY `cedula_46` (`cedula`),
  ADD UNIQUE KEY `cedula_47` (`cedula`),
  ADD UNIQUE KEY `cedula_48` (`cedula`),
  ADD UNIQUE KEY `cedula_49` (`cedula`),
  ADD UNIQUE KEY `cedula_50` (`cedula`),
  ADD UNIQUE KEY `cedula_51` (`cedula`),
  ADD UNIQUE KEY `cedula_52` (`cedula`),
  ADD UNIQUE KEY `cedula_53` (`cedula`),
  ADD UNIQUE KEY `cedula_54` (`cedula`),
  ADD UNIQUE KEY `cedula_55` (`cedula`),
  ADD UNIQUE KEY `cedula_56` (`cedula`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`Proveedor_codigo`),
  ADD KEY `Proveedor_tipo_identificacion_FK` (`Proveedor_tipo_identificacion_FK`),
  ADD KEY `Proveedor_tipo_operacion_FK` (`Proveedor_tipo_operacion_FK`),
  ADD KEY `Proveedor_nit_empresa_FK` (`Proveedor_nit_empresa_FK`);

--
-- Indices de la tabla `tipo_identificaciones`
--
ALTER TABLE `tipo_identificaciones`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `tipo_operacions`
--
ALTER TABLE `tipo_operacions`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `User_nit_empresa_FK` (`User_nit_empresa_FK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administradores`
--
ALTER TABLE `administradores`
  MODIFY `Admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `articulos`
--
ALTER TABLE `articulos`
  MODIFY `Articulo_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Cliente_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `Compra_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `grupos_articulos`
--
ALTER TABLE `grupos_articulos`
  MODIFY `Grupo_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_ventas`
--
ALTER TABLE `historial_ventas`
  MODIFY `Hventa_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `lotes`
--
ALTER TABLE `lotes`
  MODIFY `Lote_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `Marca_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `owners`
--
ALTER TABLE `owners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `Proveedor_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_identificaciones`
--
ALTER TABLE `tipo_identificaciones`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipo_operacions`
--
ALTER TABLE `tipo_operacions`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administradores`
--
ALTER TABLE `administradores`
  ADD CONSTRAINT `administradores_ibfk_1` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_10` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_11` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_12` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_13` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_14` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_15` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_16` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_17` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_18` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_19` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_2` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_20` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_21` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_22` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_23` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_24` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_25` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_26` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_27` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_28` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_29` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_3` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_30` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_31` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_32` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_33` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_34` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_35` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_36` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_37` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_38` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_39` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_4` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_40` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_41` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_42` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_43` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_44` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_45` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_46` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_47` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_48` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_49` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_5` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_50` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_51` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_52` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_53` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_54` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_55` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_6` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_7` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_8` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `administradores_ibfk_9` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_10` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_100` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_101` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_102` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_103` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_104` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_105` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_106` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_107` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_108` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_109` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_11` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_110` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_111` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_112` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_113` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_114` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_115` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_116` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_117` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_118` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_119` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_12` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_120` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_121` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_122` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_123` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_124` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_125` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_126` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_127` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_128` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_129` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_13` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_130` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_131` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_132` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_133` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_134` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_135` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_136` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_137` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_138` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_139` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_14` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_140` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_141` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_142` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_143` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_144` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_145` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_146` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_147` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_148` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_149` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_15` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_150` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_151` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_152` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_153` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_154` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_155` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_156` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_157` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_158` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_159` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_16` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_160` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_161` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_162` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_163` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_164` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_165` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_17` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_18` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_19` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_20` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_21` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_22` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_23` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_24` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_25` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_26` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_27` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_28` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_29` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_3` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_30` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_31` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_32` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_33` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_34` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_35` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_36` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_37` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_38` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_39` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_4` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_40` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_41` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_42` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_43` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_44` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_45` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_46` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_47` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_48` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_49` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_5` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_50` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_51` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_52` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_53` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_54` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_55` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_56` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_57` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_58` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_59` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_6` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_60` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_61` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_62` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_63` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_64` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_65` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_66` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_67` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_68` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_69` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_7` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_70` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_71` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_72` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_73` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_74` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_75` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_76` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_77` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_78` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_79` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_8` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_80` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_81` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_82` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_83` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_84` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_85` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_86` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_87` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_88` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_89` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_9` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_90` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_91` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_92` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_93` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_94` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_95` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_96` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_97` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_98` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_99` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_10` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_11` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_12` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_13` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_14` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_15` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_16` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_17` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_18` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_19` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_20` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_21` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_22` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_23` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_24` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_25` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_26` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_27` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_28` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_29` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_3` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_30` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_31` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_32` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_33` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_34` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_35` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_36` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_37` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_38` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_39` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_4` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_40` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_41` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_42` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_43` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_44` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_45` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_46` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_47` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_48` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_49` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_5` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_50` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_51` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_52` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_53` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_54` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_55` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_56` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_57` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_58` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_59` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_6` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_60` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_61` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_62` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_63` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_64` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_65` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_66` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_67` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_68` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_69` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_7` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_70` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_71` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_72` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_73` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_74` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_75` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_76` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_77` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_78` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_79` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_8` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_80` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_9` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_10` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_11` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_12` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_13` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_14` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_15` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_16` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_17` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_18` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_19` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_20` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_21` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_22` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_23` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_24` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_25` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_26` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_27` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_28` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_29` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_3` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_30` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_31` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_32` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_33` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_34` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_35` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_36` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_37` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_38` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_39` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_4` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_40` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_41` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_42` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_43` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_44` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_45` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_46` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_47` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_48` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_49` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_5` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_50` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_51` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_52` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_53` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_54` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_55` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_56` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_57` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_58` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_59` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_6` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_60` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_61` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_62` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_63` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_64` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_65` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_66` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_67` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_68` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_69` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_7` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_70` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_71` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_72` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_73` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_74` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_75` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_76` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_77` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_78` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_79` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_8` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_80` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_81` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_82` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_83` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_84` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_85` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_86` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_87` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_88` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_89` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_9` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_90` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_91` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_92` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_93` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_94` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_95` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_96` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_97` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_98` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD CONSTRAINT `empresas_ibfk_1` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_10` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_11` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_12` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_13` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_14` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_15` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_16` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_17` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_18` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_19` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_2` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_20` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_21` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_22` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_23` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_24` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_25` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_26` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_27` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_28` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_29` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_3` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_30` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_31` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_32` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_33` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_34` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_35` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_36` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_37` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_38` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_39` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_4` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_40` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_41` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_42` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_43` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_44` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_45` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_46` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_47` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_48` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_49` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_5` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_50` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_51` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_52` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_53` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_54` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_55` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_6` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_7` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_8` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `empresas_ibfk_9` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupos_articulos`
--
ALTER TABLE `grupos_articulos`
  ADD CONSTRAINT `grupos_articulos_ibfk_1` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_10` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_11` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_12` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_13` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_14` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_15` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_16` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_17` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_18` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_19` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_2` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_20` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_21` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_22` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_23` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_24` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_25` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_26` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_27` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_28` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_29` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_3` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_30` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_31` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_32` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_33` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_34` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_35` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_36` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_37` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_38` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_39` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_4` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_40` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_41` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_42` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_43` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_44` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_45` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_46` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_47` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_48` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_49` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_5` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_50` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_51` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_52` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_53` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_54` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_55` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_6` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_7` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_8` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grupos_articulos_ibfk_9` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historial_ventas`
--
ALTER TABLE `historial_ventas`
  ADD CONSTRAINT `historial_ventas_ibfk_1` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_10` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_11` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_12` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_13` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_14` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_15` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_16` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_17` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_18` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_19` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_2` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_20` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_21` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_22` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_23` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_24` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_25` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_26` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_27` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_28` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_29` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_3` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_30` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_31` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_32` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_33` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_34` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_35` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_36` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_37` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_38` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_39` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_4` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_40` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_41` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_42` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_43` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_44` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_45` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_46` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_47` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_48` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_49` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_5` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_50` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_51` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_52` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_53` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_54` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_55` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_6` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_7` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_8` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `historial_ventas_ibfk_9` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD CONSTRAINT `lotes_ibfk_1` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_10` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_11` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_12` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_13` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_14` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_15` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_16` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_17` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_18` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_19` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_2` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_20` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_21` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_22` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_23` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_24` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_25` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_26` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_27` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_28` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_29` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_3` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_30` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_31` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_32` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_33` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_34` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_35` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_36` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_37` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_38` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_39` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_4` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_40` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_41` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_42` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_43` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_44` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_45` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_46` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_47` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_48` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_49` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_5` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_50` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_51` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_52` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_53` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_54` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_55` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_6` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_7` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_8` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lotes_ibfk_9` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD CONSTRAINT `marcas_ibfk_1` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_10` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_11` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_12` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_13` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_14` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_15` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_16` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_17` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_18` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_19` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_2` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_20` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_21` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_22` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_23` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_24` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_25` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_26` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_27` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_28` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_29` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_3` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_30` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_31` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_32` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_33` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_34` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_35` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_36` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_37` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_38` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_39` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_4` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_40` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_41` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_42` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_43` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_44` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_45` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_46` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_47` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_48` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_49` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_5` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_50` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_51` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_52` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_53` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_54` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_55` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_6` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_7` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_8` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `marcas_ibfk_9` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_10` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_100` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_101` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_102` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_103` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_104` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_105` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_106` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_107` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_108` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_109` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_11` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_110` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_111` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_112` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_113` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_114` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_115` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_116` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_117` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_118` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_119` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_12` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_120` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_121` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_122` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_123` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_124` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_125` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_126` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_127` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_128` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_129` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_13` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_130` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_131` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_132` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_133` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_134` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_135` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_136` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_137` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_138` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_139` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_14` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_140` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_141` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_142` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_143` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_144` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_145` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_146` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_147` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_148` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_149` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_15` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_150` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_151` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_152` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_153` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_154` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_155` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_156` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_157` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_158` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_159` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_16` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_160` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_161` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_162` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_163` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_164` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_165` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_17` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_18` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_19` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_20` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_21` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_22` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_23` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_24` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_25` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_26` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_27` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_28` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_29` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_3` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_30` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_31` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_32` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_33` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_34` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_35` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_36` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_37` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_38` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_39` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_4` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_40` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_41` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_42` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_43` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_44` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_45` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_46` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_47` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_48` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_49` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_5` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_50` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_51` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_52` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_53` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_54` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_55` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_56` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_57` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_58` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_59` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_6` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_60` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_61` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_62` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_63` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_64` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_65` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_66` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_67` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_68` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_69` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_7` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_70` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_71` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_72` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_73` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_74` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_75` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_76` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_77` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_78` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_79` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_8` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_80` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_81` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_82` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_83` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_84` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_85` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_86` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_87` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_88` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_89` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_9` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_90` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_91` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_92` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_93` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_94` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_95` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_96` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_97` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_98` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_99` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_10` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_11` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_12` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_13` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_14` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_15` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_16` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_17` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_18` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_19` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_20` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_21` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_22` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_23` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_24` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_25` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_26` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_27` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_28` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_29` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_3` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_30` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_31` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_32` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_33` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_34` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_35` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_36` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_37` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_38` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_39` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_4` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_40` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_41` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_42` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_43` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_44` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_45` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_46` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_47` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_48` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_49` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_5` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_50` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_51` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_52` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_53` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_54` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_55` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_6` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_7` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_8` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_9` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
