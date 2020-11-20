-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Jun-2020 às 06:25
-- Versão do servidor: 10.4.11-MariaDB
-- versão do PHP: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Banco de dados: `ai_aquario`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `local`
--

CREATE TABLE `local` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `TAG_LOCAL` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_acao`
--

CREATE TABLE `log_acao` (
  `codigo` int(11) NOT NULL,
  `cod_periferico` int(11) NOT NULL,
  `ESTADO_NOVO` varchar(200) NOT NULL,
  `data` datetime NOT NULL,
  `cod_usuario` int(11) NOT NULL,
  `ESTADO_ANTIGO` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_bruto`
--

CREATE TABLE `log_bruto` (
  `codigo` int(11) NOT NULL,
  `cod_periferico` int(11) NOT NULL,
  `valor` varchar(100) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `periferico`
--

CREATE TABLE `periferico` (
  `codigo` int(11) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `cod_local` int(11) NOT NULL,
  `cod_tipo` int(11) NOT NULL,
  `estado` char(2) NOT NULL COMMENT '1 - ativo / 0 - desativo',
  `pino_entrada` varchar(200) NOT NULL,
  `descricao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_sensor`
--

CREATE TABLE `tipo_sensor` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `unidade_medida` varchar(100) NOT NULL,
  `tipo_sensor` varchar(10) NOT NULL COMMENT 'acao - tipo rele, sensor e etc.\r\n\r\n\r\nmedi - tipo luminosidade e entre outros.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `local`
--
ALTER TABLE `local`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `log_acao`
--
ALTER TABLE `log_acao`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `log_bruto`
--
ALTER TABLE `log_bruto`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `periferico`
--
ALTER TABLE `periferico`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `tipo_sensor`
--
ALTER TABLE `tipo_sensor`
  ADD PRIMARY KEY (`codigo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `local`
--
ALTER TABLE `local`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log_acao`
--
ALTER TABLE `log_acao`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `log_bruto`
--
ALTER TABLE `log_bruto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `periferico`
--
ALTER TABLE `periferico`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_sensor`
--
ALTER TABLE `tipo_sensor`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;
