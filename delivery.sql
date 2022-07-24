-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Jul-2022 às 04:03
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `delivery`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `carrinho`
--

INSERT INTO `carrinho` (`id`, `id_venda`, `id_produto`, `cpf`, `quantidade`) VALUES
(218, 0, 1, '919.743.720-49', 2),
(219, 0, 12, '919.743.720-49', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `nome_url` varchar(50) NOT NULL,
  `produtos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`id`, `nome`, `descricao`, `imagem`, `nome_url`, `produtos`) VALUES
(1, 'Bebidas', 'Bebidas', 'bebidas.jpeg', 'bebidas', 4),
(2, 'Sanduíches Artesanais', 'Sanduíches Artesanais', 'artesanal.jpeg', 'sanduiches-artesanais', 2),
(7, 'Açaí', 'Açaí', 'acai.jpeg', 'acai', 3),
(8, 'Sanduíches', 'Sanduíches', 'sanduiches.jpeg', 'sanduiches', 3),
(9, 'Pizza', 'Pizza', 'pizzas.jpeg', 'pizza', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `rua` varchar(100) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `bairro` varchar(50) NOT NULL,
  `cidade` varchar(50) NOT NULL,
  `estado` varchar(5) NOT NULL,
  `cep` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `cpf`, `telefone`, `email`, `rua`, `numero`, `bairro`, `cidade`, `estado`, `cep`) VALUES
(1, 'Marcos Santos', '000.000.000-10', '(11) 11111-1111', 'marcos@gmail.com', 'Rua 5', '52', 'Piratininga', 'Belo Horizonte', 'MG', '33333-333'),
(2, 'Hugo Freitas', '111.111.111-11', '(11) 11111-1111', 'hugovasconcelosf@hotmail.com', '', '', '', '', '', ''),
(3, 'Deisi Falcão', '919.743.720-49', '(51) 99564-819', 'deisifalcao@hotmail.com', '', '', '', '', '', ''),
(4, 'Renata Nascimento', '052.237.310-00', '(51) 98015-1502', 'renata.rjn@gmail.com', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `locais`
--

CREATE TABLE `locais` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `valor_tele` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `locais`
--

INSERT INTO `locais` (`id`, `nome`, `valor_tele`) VALUES
(10, 'Aliança', '9.99'),
(11, 'Ana Nery', '8.00'),
(12, 'Arroio Grande', '8.00'),
(13, 'Avenida', '8.00'),
(14, 'Belvedere', '8.00'),
(15, 'Bonfim', '8.00'),
(16, 'Canela', '9.99'),
(17, 'Castelo Branco', '9.99'),
(18, 'Centro', '7.00'),
(19, 'Cohab', '8.00'),
(20, 'Costa Leste', '9.99'),
(21, 'Costa Norte', '9.99'),
(22, 'Country', '9.99'),
(23, 'Distrito Industrial', '9.99'),
(24, 'Dona Carlota', '9.99'),
(25, 'Esmeralda', '9.99'),
(26, 'Faxinal', '9.99'),
(27, 'Figueira', '8.00'),
(28, 'Flamengo', '9.99'),
(29, 'Germânia', '9.99'),
(30, 'Goiás', '8.00'),
(31, 'Higienópolis', '8.00'),
(32, 'Independência', '9.99'),
(33, 'Jardim das Hortências', '9.99'),
(34, 'Jardim Europa', '9.99'),
(35, 'Linha João Alves', '9.99'),
(36, 'Linha Santa Cruz', '9.99'),
(37, 'Linha Santa Cruz Monte Alverne', '9.99'),
(38, 'Lot. Santa Cruz', '9.99'),
(39, 'Lot. Santa Cruz II', '9.99'),
(40, 'Lot. Santa Cruz III', '9.99'),
(41, 'Margarida', '8.00'),
(42, 'Monte Verde', '9.99'),
(43, 'Moradas', '9.99'),
(44, 'Motocross', '9.99'),
(45, 'Ohland', '9.99'),
(46, 'Pedreira', '9.99'),
(47, 'Piratini', '9.99'),
(48, 'Rauber', '9.99'),
(49, 'Renascença', '9.99'),
(50, 'Reserva dos pássaros', '9.99'),
(51, 'Santo Antônio', '9.99'),
(52, 'Santo Inácio', '9.99'),
(53, 'Santuário', '9.99'),
(54, 'São João', '9.99'),
(55, 'Schulz', '8.00'),
(56, 'Senai', '6.00'),
(57, 'Terra Madre', '9.99'),
(58, 'Universitário', '8.00'),
(59, 'Várzea', '9.99'),
(60, 'Verena', '8.00'),
(61, 'Vila Nova', '9.99');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `descricao_longa` varchar(600) NOT NULL,
  `valor` decimal(8,2) NOT NULL,
  `categoria` int(11) NOT NULL,
  `imagem` varchar(100) NOT NULL,
  `nome_url` varchar(50) NOT NULL,
  `combo` varchar(10) DEFAULT NULL,
  `vendas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `descricao`, `descricao_longa`, `valor`, `categoria`, `imagem`, `nome_url`, `combo`, `vendas`) VALUES
(1, 'Açai 600 ML', 'Açaí na Taça', 'Açaí com Leite em pó', '8.99', 7, 'acai 1.jpeg', 'acai-600-ml', NULL, 0),
(2, 'Açaí 300 ML', 'Creme de Açaí', 'Açaí com Leite em pó e Granola!', '1.00', 7, 'acai 2.jpeg', 'acai-300-ml', NULL, 0),
(10, 'Duas Barcas', 'Combo Completo', 'Combo imperdível com duas barcas completas com muito açãi e cheia de incrementos!', '60.00', 7, 'barcas.jpg', 'duas-barcas', 'Sim', 0),
(12, 'Chessburguer', 'Carne e Queijo', 'Delicioso Chessburguer com carne bovina, queijo, maionese, picles, ketchup!!', '9.99', 8, 'sanduiche 1.jpeg', 'chessburguer', NULL, 0),
(13, 'Bufalo Burguer', 'Gigante e Saboroso', 'Um Sanduíche gigantesco, pra quem tem muita fome, a base de carne bovina, cheddar ....', '12.50', 8, 'sanduiche 2.jpeg', 'bufalo-burguer', NULL, 0),
(14, '3 Pizzas Grandes', 'Super Promoção', 'Aproveite já nossa super promoção, são 3 pizzas grande de 8 fatias cada, muito saborosa...', '47.90', 9, 'pizza promocao.jpeg', '3-pizzas-grandes', 'Sim', 0),
(15, 'Sanduiche Gourmet', 'Delicioso Artesanal', 'Um Delicioso sanduiche artesenal, carne de frango ....', '10.00', 2, 'gourmet.jpeg', 'sanduiche-gourmet', NULL, 0),
(16, 'Pizza Grande', '8 Fatias', 'Pizza Grande de 8 Fatias nos sabores frango com catu....', '17.90', 9, 'pizza 1.jpeg', 'pizza-grande', NULL, 0),
(17, 'Pizza Média', '6 Pedaços', 'Pizza Média ...', '11.90', 9, 'pizza 2.jpeg', 'pizza-media', NULL, 0),
(18, 'Combo Artesanais', '2 Sanduiches', 'Dois Deliciosos sanduiches artesanais', '18.00', 2, 'promocao artesanais.jpeg', 'combo-artesanais', 'Sim', 0),
(19, 'Combo Sanduíches', '3 Sanduiches', 'Trez Gigantescos sanduiches...', '29.99', 8, 'promocao sanduinches.jpeg', 'combo-sanduiches', 'Sim', 0),
(20, 'Coca Cola Lata', '350 ML', 'Refrigerante Coca Cola Lata', '3.50', 1, 'WhatsApp Image 2020-05-13 at 22.38.18.jpeg', 'coca-cola-lata', NULL, 0),
(21, 'Agua Mineral', 'Garrafa 200 ML', 'Agua Mineral', '2.00', 1, 'WhatsApp Image 2020-05-13 at 22.41.30.jpeg', 'agua-mineral', NULL, 0),
(22, 'Suco Lata', '290 ML', 'Suco de Lata 290 ML', '2.90', 1, 'WhatsApp Image 2020-05-13 at 22.45.31.jpeg', 'suco-lata', NULL, 0),
(23, 'Cerveja Lata', '350 ML', 'Cerveja Lata', '4.50', 1, 'WhatsApp Image 2020-05-13 at 22.49.20.jpeg', 'cerveja-lata', NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(35) NOT NULL,
  `nivel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `cpf`, `telefone`, `usuario`, `senha`, `nivel`) VALUES
(21, 'Administrador', '042.783.610-76', '51995849537', 'michaelnas84@gmail.com', 'Renata1@@', 'Admin'),
(24, 'Deisi Falcão', '919.743.720-49', '(51) 99564-819', 'deisifalcao@hotmail.com', 'Certificado1@', 'Cliente'),
(25, 'Renata Nascimento', '052.237.310-00', '(51) 98015-1502', 'renata.rjn@gmail.com', 'Ren@tyre10', 'Balconista');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `cliente` varchar(20) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `total_pago` decimal(8,2) NOT NULL,
  `troco` decimal(8,2) NOT NULL,
  `tipo_pgto` varchar(30) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `status` varchar(25) NOT NULL,
  `pago` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`id`, `cliente`, `total`, `total_pago`, `troco`, `tipo_pgto`, `data`, `hora`, `status`, `pago`) VALUES
(20, '919.743.720-49', '27.97', '100.00', '72.03', 'Dinheiro', '2022-07-23', '22:54:31', 'Aguardando', 'Não');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `locais`
--
ALTER TABLE `locais`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `locais`
--
ALTER TABLE `locais`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
