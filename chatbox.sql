-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jul 03, 2023 at 04:35 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbox`
--

-- --------------------------------------------------------

--
-- Table structure for table `administradores`
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
-- Dumping data for table `administradores`
--

INSERT INTO `administradores` (`Admin_id`, `Admin_nombre`, `Admin_apellido`, `Admin_cedula`, `Admin_telefono`, `Admin_direccion`, `Admin_password`, `Admin_fecha_creacion`, `createdAt`, `updatedAt`, `Admin_nit_empresa_FK`) VALUES
(2, 'Manuel', 'Garcia Julio', '1007597893', '3004604190', 'Arjona Bolivar Cr 43 #48-28 p2', 'U2FsdGVkX187+aor1JnF+TDr4X1kwkvgfjr/UiVi8g4=', '2023-06-29', '2023-06-04 17:16:10', '2023-06-29 20:32:14', '1007597893');

-- --------------------------------------------------------

--
-- Table structure for table `articulos`
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
  `Articulo_info_adicional` varchar(255) NOT NULL,
  `Articulo_notificacion_cantidad` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Articulo_grupo_FK` int(11) DEFAULT NULL,
  `Articulo_marca_FK` int(11) DEFAULT NULL,
  `Articulo_nit_empresa_FK` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articulos`
--

INSERT INTO `articulos` (`Articulo_codigo`, `Articulo_descripcion`, `Articulo_cantidad`, `Articulo_precio_venta`, `Articulo_iva`, `Articulo_precio_compra`, `venta_min`, `Articulo_fecha_ingreso`, `Articulo_info_adicional`, `Articulo_notificacion_cantidad`, `createdAt`, `updatedAt`, `Articulo_grupo_FK`, `Articulo_marca_FK`, `Articulo_nit_empresa_FK`) VALUES
(12345, 'Sevedorl extra fuerte x5', 10, 5500, 5, 2250, 1, '2023-06-29 20:38:26', 'No hay', 2, '2023-06-29 20:38:26', '2023-06-29 20:38:26', 16, 3, '1007597893'),
(54321, 'Lorsartan 50mg x10', 30, 3000, 5, 1000, 1, '2023-06-29 22:02:21', 'N/A', 10, '2023-06-29 22:02:21', '2023-06-29 22:02:21', 16, 3, '1007597893');

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
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
-- Table structure for table `compras`
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
-- Table structure for table `empresas`
--

CREATE TABLE `empresas` (
  `empresa_NIT` varchar(255) NOT NULL,
  `empresa_persona_responsable` varchar(255) NOT NULL,
  `empresa_direccion` varchar(255) NOT NULL,
  `empresa_razon_social` varchar(255) NOT NULL,
  `empresa_fecha_creacion` date NOT NULL,
  `empresa_fecha_licencia` date DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `empresas`
--

INSERT INTO `empresas` (`empresa_NIT`, `empresa_persona_responsable`, `empresa_direccion`, `empresa_razon_social`, `empresa_fecha_creacion`, `empresa_fecha_licencia`, `createdAt`, `updatedAt`) VALUES
('1007597893', 'Manuel García', 'Arjona Bolivar Cr 43 #48-28 p2', 'Gea', '2023-06-04', '2023-06-30', '2023-06-04 17:15:35', '2023-06-29 20:31:42');

-- --------------------------------------------------------

--
-- Table structure for table `grupos_articulos`
--

CREATE TABLE `grupos_articulos` (
  `Grupo_codigo` int(11) NOT NULL,
  `Grupo_nombre` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Grupo_nit_empresa_FK` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grupos_articulos`
--

INSERT INTO `grupos_articulos` (`Grupo_codigo`, `Grupo_nombre`, `createdAt`, `updatedAt`, `Grupo_nit_empresa_FK`) VALUES
(16, 'Medicmanetos comunes', '2023-06-29 20:37:26', '2023-06-29 21:58:46', '1007597893');

-- --------------------------------------------------------

--
-- Table structure for table `historial_ventas`
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
-- Table structure for table `lotes`
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
-- Table structure for table `marcas`
--

CREATE TABLE `marcas` (
  `Marca_codigo` int(11) NOT NULL,
  `Marca_nombre` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `Marca_nit_empresa_FK` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `marcas`
--

INSERT INTO `marcas` (`Marca_codigo`, `Marca_nombre`, `createdAt`, `updatedAt`, `Marca_nit_empresa_FK`) VALUES
(3, 'P&G', '2023-06-29 20:36:13', '2023-06-29 20:36:13', '1007597893');

-- --------------------------------------------------------

--
-- Table structure for table `owners`
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
-- Dumping data for table `owners`
--

INSERT INTO `owners` (`id`, `cedula`, `nombre`, `apellido`, `telefono`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(19, '1007597893', 'Manuel Santiago', 'Garcia Julio', '3004604190', 'manegarju15@gmail.com', 'U2FsdGVkX1/T4XN4M7QZRa676h54p7MSW1FcRFX63o8=', '2023-03-21 19:46:03', '2023-04-17 23:19:41'),
(20, '1007597894', 'Vanessa Antonia', 'Garcia Julio', '3206436877', 'vanegaju15@gmail.com', 'U2FsdGVkX1990Cub7+96xNGnabquBqbFvxOoHx8PaYU=', '2023-03-24 17:34:13', '2023-03-24 17:34:13'),
(21, '30761898', 'Inelda', 'Julio Herrera', '3114167027', 'ijuheherrera@hotmail.com', 'U2FsdGVkX19tjZYv0ivCotgDj5GekQFravyIF4/Tnpg=', '2023-04-18 19:38:50', '2023-05-22 16:24:29');

-- --------------------------------------------------------

--
-- Table structure for table `proveedores`
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
-- Table structure for table `tipo_identificaciones`
--

CREATE TABLE `tipo_identificaciones` (
  `Codigo` int(11) NOT NULL,
  `Tipo_identificacion` varchar(60) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_operacions`
--

CREATE TABLE `tipo_operacions` (
  `Codigo` int(11) NOT NULL,
  `Tipo_operacion_nombre` varchar(60) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
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
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`User_id`, `User_cedula`, `User_nombre`, `User_apellido`, `User_password`, `User_telefono`, `User_modulos`, `createdAt`, `updatedAt`, `User_nit_empresa_FK`) VALUES
(2, '123456', 'Manuel Santiago', 'Garcia Julio', 'U2FsdGVkX1/N6wEpPMudI6hu1ADAgtCeIKRcs3EBzKY=', '3004604190', '{\"ventas\":\"ventas\",\"compras\":\"compras\",\"historial\":\"historial\"}', '2023-06-29 19:52:20', '2023-06-29 19:52:20', '1007597893');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administradores`
--
ALTER TABLE `administradores`
  ADD PRIMARY KEY (`Admin_id`),
  ADD UNIQUE KEY `Admin_cedula` (`Admin_cedula`),
  ADD KEY `Admin_nit_empresa_FK` (`Admin_nit_empresa_FK`);

--
-- Indexes for table `articulos`
--
ALTER TABLE `articulos`
  ADD PRIMARY KEY (`Articulo_codigo`),
  ADD KEY `Articulo_grupo_FK` (`Articulo_grupo_FK`),
  ADD KEY `Articulo_marca_FK` (`Articulo_marca_FK`),
  ADD KEY `Articulo_nit_empresa_FK` (`Articulo_nit_empresa_FK`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Cliente_codigo`),
  ADD KEY `Tipo_operacion_FK` (`Tipo_operacion_FK`),
  ADD KEY `Cliente_nit_empresa_FK` (`Cliente_nit_empresa_FK`);

--
-- Indexes for table `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`Compra_codigo`),
  ADD KEY `Compra_codigo_articulo_FK` (`Compra_codigo_articulo_FK`),
  ADD KEY `Compra_codigo_proveedor_FK` (`Compra_codigo_proveedor_FK`);

--
-- Indexes for table `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`empresa_NIT`);

--
-- Indexes for table `grupos_articulos`
--
ALTER TABLE `grupos_articulos`
  ADD PRIMARY KEY (`Grupo_codigo`),
  ADD KEY `Grupo_nit_empresa_FK` (`Grupo_nit_empresa_FK`);

--
-- Indexes for table `historial_ventas`
--
ALTER TABLE `historial_ventas`
  ADD PRIMARY KEY (`Hventa_codigo`),
  ADD KEY `Hventa_codigo_articulo_FK` (`Hventa_codigo_articulo_FK`);

--
-- Indexes for table `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`Lote_codigo`),
  ADD KEY `Lote_codigo_articulo_fk` (`Lote_codigo_articulo_fk`);

--
-- Indexes for table `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`Marca_codigo`),
  ADD KEY `Marca_nit_empresa_FK` (`Marca_nit_empresa_FK`);

--
-- Indexes for table `owners`
--
ALTER TABLE `owners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indexes for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`Proveedor_codigo`),
  ADD KEY `Proveedor_tipo_identificacion_FK` (`Proveedor_tipo_identificacion_FK`),
  ADD KEY `Proveedor_tipo_operacion_FK` (`Proveedor_tipo_operacion_FK`),
  ADD KEY `Proveedor_nit_empresa_FK` (`Proveedor_nit_empresa_FK`);

--
-- Indexes for table `tipo_identificaciones`
--
ALTER TABLE `tipo_identificaciones`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indexes for table `tipo_operacions`
--
ALTER TABLE `tipo_operacions`
  ADD PRIMARY KEY (`Codigo`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`User_id`),
  ADD KEY `User_nit_empresa_FK` (`User_nit_empresa_FK`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administradores`
--
ALTER TABLE `administradores`
  MODIFY `Admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `articulos`
--
ALTER TABLE `articulos`
  MODIFY `Articulo_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54322;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Cliente_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `compras`
--
ALTER TABLE `compras`
  MODIFY `Compra_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grupos_articulos`
--
ALTER TABLE `grupos_articulos`
  MODIFY `Grupo_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `historial_ventas`
--
ALTER TABLE `historial_ventas`
  MODIFY `Hventa_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lotes`
--
ALTER TABLE `lotes`
  MODIFY `Lote_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marcas`
--
ALTER TABLE `marcas`
  MODIFY `Marca_codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `owners`
--
ALTER TABLE `owners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `Proveedor_codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_identificaciones`
--
ALTER TABLE `tipo_identificaciones`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tipo_operacions`
--
ALTER TABLE `tipo_operacions`
  MODIFY `Codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administradores`
--
ALTER TABLE `administradores`
  ADD CONSTRAINT `administradores_ibfk_1` FOREIGN KEY (`Admin_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`Articulo_grupo_FK`) REFERENCES `grupos_articulos` (`Grupo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_2` FOREIGN KEY (`Articulo_marca_FK`) REFERENCES `marcas` (`Marca_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articulos_ibfk_3` FOREIGN KEY (`Articulo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`Tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`Cliente_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`Compra_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`Compra_codigo_proveedor_FK`) REFERENCES `proveedores` (`Proveedor_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grupos_articulos`
--
ALTER TABLE `grupos_articulos`
  ADD CONSTRAINT `grupos_articulos_ibfk_1` FOREIGN KEY (`Grupo_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `historial_ventas`
--
ALTER TABLE `historial_ventas`
  ADD CONSTRAINT `historial_ventas_ibfk_1` FOREIGN KEY (`Hventa_codigo_articulo_FK`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lotes`
--
ALTER TABLE `lotes`
  ADD CONSTRAINT `lotes_ibfk_1` FOREIGN KEY (`Lote_codigo_articulo_fk`) REFERENCES `articulos` (`Articulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `marcas`
--
ALTER TABLE `marcas`
  ADD CONSTRAINT `marcas_ibfk_1` FOREIGN KEY (`Marca_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`Proveedor_tipo_identificacion_FK`) REFERENCES `tipo_identificaciones` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_2` FOREIGN KEY (`Proveedor_tipo_operacion_FK`) REFERENCES `tipo_operacions` (`Codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `proveedores_ibfk_3` FOREIGN KEY (`Proveedor_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`User_nit_empresa_FK`) REFERENCES `empresas` (`empresa_NIT`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
