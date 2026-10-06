-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: data_app_carnicos
-- ------------------------------------------------------
-- Server version	9.7.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '4a656bbd-6e57-11f1-acd0-025084583c87:1-372,
50a95277-aba2-11f1-b503-0250ed410cd9:1-167';

--
-- Table structure for table `tabla_acumulativa_lotes`
--

DROP TABLE IF EXISTS `tabla_acumulativa_lotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_acumulativa_lotes` (
  `id_secuencial` int NOT NULL AUTO_INCREMENT,
  `granja` varchar(100) DEFAULT NULL,
  `lote` varchar(100) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `nombre_galpon` varchar(100) DEFAULT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `dia` int DEFAULT NULL,
  `motivo` varchar(250) DEFAULT NULL,
  `saldo_inicial` int DEFAULT NULL,
  `total_mortalidad` int DEFAULT NULL,
  `traslado` int DEFAULT NULL,
  `saldo_final` int DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_desde` datetime DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `consumos` decimal(12,4) DEFAULT NULL,
  `peso` decimal(12,4) DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `aplica_consumo_conversion` varchar(10) DEFAULT NULL,
  `mortalidad_acumulado` int DEFAULT NULL,
  `consumo_ave_excel` decimal(12,4) DEFAULT NULL,
  `estado2` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_secuencial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_acumulativa_lotes`
--

LOCK TABLES `tabla_acumulativa_lotes` WRITE;
/*!40000 ALTER TABLE `tabla_acumulativa_lotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabla_acumulativa_lotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_calidad_api`
--

DROP TABLE IF EXISTS `tabla_calidad_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_calidad_api` (
  `granja` varchar(100) DEFAULT NULL,
  `lote` varchar(100) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `nombre_galpon` varchar(100) DEFAULT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `dia` int DEFAULT NULL,
  `motivo` varchar(250) DEFAULT NULL,
  `saldo_inicial` int DEFAULT NULL,
  `total_mortalidad` int DEFAULT NULL,
  `traslado` int DEFAULT NULL,
  `saldo_final` int DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_desde` datetime DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `consumos` decimal(10,2) DEFAULT NULL,
  `peso` decimal(10,3) DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `aplica_consumo_conversion` varchar(10) DEFAULT NULL,
  `mortalidad_acumulado` int DEFAULT NULL,
  `consumo_ave_excel` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_calidad_api`
--

LOCK TABLES `tabla_calidad_api` WRITE;
/*!40000 ALTER TABLE `tabla_calidad_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabla_calidad_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabla_usuarios`
--

DROP TABLE IF EXISTS `tabla_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabla_usuarios` (
  `granja` varchar(100) DEFAULT NULL,
  `lote` varchar(100) DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `nombre_galpon` varchar(100) DEFAULT NULL,
  `sexo` varchar(20) DEFAULT NULL,
  `dia` int DEFAULT NULL,
  `motivo` varchar(250) DEFAULT NULL,
  `saldo_inicial` int DEFAULT NULL,
  `total_mortalidad` int DEFAULT NULL,
  `traslado` int DEFAULT NULL,
  `saldo_final` int DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `fecha_desde` datetime DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `consumos` decimal(10,2) DEFAULT NULL,
  `peso` decimal(10,3) DEFAULT NULL,
  `fecha_cierre` datetime DEFAULT NULL,
  `aplica_consumo_conversion` varchar(10) DEFAULT NULL,
  `mortalidad_acumulado` int DEFAULT NULL,
  `consumo_ave_excel` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_usuarios`
--

LOCK TABLES `tabla_usuarios` WRITE;
/*!40000 ALTER TABLE `tabla_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabla_usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_limpiar_peso_usuarios` BEFORE INSERT ON `tabla_usuarios` FOR EACH ROW BEGIN
    -- Si el peso ingresado es menor a 8 (digitado en kilos), lo normaliza a gramos
    IF NEW.peso < 8.000 THEN
        SET NEW.peso = NEW.peso * 1000.000;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vista_consumos_app`
--

DROP TABLE IF EXISTS `vista_consumos_app`;
/*!50001 DROP VIEW IF EXISTS `vista_consumos_app`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_consumos_app` AS SELECT 
 1 AS `Identificador`,
 1 AS `granja`,
 1 AS `lote app`,
 1 AS `lote`,
 1 AS `edad`,
 1 AS `número_galpon`,
 1 AS `nombre sexo`,
 1 AS `sexo`,
 1 AS `nombre_galpon`,
 1 AS `dia`,
 1 AS `motivo`,
 1 AS `saldo_inicial`,
 1 AS `total_mortalidad`,
 1 AS `traslado`,
 1 AS `saldo_final`,
 1 AS `fecha_registro`,
 1 AS `fecha_desde`,
 1 AS `estado`,
 1 AS `peso`,
 1 AS `fecha_cierre`,
 1 AS `aplica_consumo_conversion`,
 1 AS `mortalidad_acumulado`,
 1 AS `consumo_ave_excel`,
 1 AS `estado2`,
 1 AS `id_secuencial`,
 1 AS `consumos_APP`,
 1 AS `Consumos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_hechos_app`
--

DROP TABLE IF EXISTS `vista_hechos_app`;
/*!50001 DROP VIEW IF EXISTS `vista_hechos_app`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_hechos_app` AS SELECT 
 1 AS `Identificador`,
 1 AS `granja`,
 1 AS `lote`,
 1 AS `edad`,
 1 AS `nombre_galpon`,
 1 AS `sexo`,
 1 AS `dia`,
 1 AS `motivo`,
 1 AS `Semana_nueva`,
 1 AS `estado`,
 1 AS `fecha_registro`,
 1 AS `fecha_desde`,
 1 AS `total_mortalidad`,
 1 AS `Mortalidad acumulada`,
 1 AS `Cálculo mortalidad acumulada`,
 1 AS `traslado`,
 1 AS `saldo_final`,
 1 AS `saldo_inicial`,
 1 AS `Fecha de cierre`,
 1 AS `Consumos`,
 1 AS `Consumo / ave excel`,
 1 AS `Consumo acumulado`,
 1 AS `Cálculo consumo acumulado`,
 1 AS `Peso (gr)`,
 1 AS `Aplica consumo conversión`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vista_historica_lotes`
--

DROP TABLE IF EXISTS `vista_historica_lotes`;
/*!50001 DROP VIEW IF EXISTS `vista_historica_lotes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_historica_lotes` AS SELECT 
 1 AS `Identificador`,
 1 AS `granja`,
 1 AS `lote app`,
 1 AS `lote`,
 1 AS `edad`,
 1 AS `número_galpon`,
 1 AS `nombre sexo`,
 1 AS `sexo`,
 1 AS `nombre_galpon`,
 1 AS `dia`,
 1 AS `motivo`,
 1 AS `saldo_inicial`,
 1 AS `total_mortalidad`,
 1 AS `traslado`,
 1 AS `saldo_final`,
 1 AS `fecha_registro`,
 1 AS `fecha_desde`,
 1 AS `estado`,
 1 AS `consumos_APP`,
 1 AS `Consumos`,
 1 AS `peso`,
 1 AS `fecha_cierre`,
 1 AS `aplica_consumo_conversion`,
 1 AS `mortalidad_acumulado`,
 1 AS `consumo_ave_excel`,
 1 AS `estado2`,
 1 AS `Quitar duplicado`,
 1 AS `id_secuencial`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'data_app_carnicos'
--

--
-- Dumping routines for database 'data_app_carnicos'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_validar_y_transferir_lotes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_validar_y_transferir_lotes`()
BEGIN
    DECLARE v_conteo_duplicados INT;

    -- 1. Evaluamos la tabla de tránsito para ver si la API vino con errores hoy
    SELECT COUNT(*) INTO v_conteo_duplicados
    FROM (
        SELECT granja
        FROM tabla_calidad_api
        GROUP BY granja
        HAVING COUNT(DISTINCT lote) > 1
    ) AS granjas_con_multiples_lotes;

    -- 2. REGLA DE ORO: Si hay anomalías, lanzamos un error crítico y limpiamos la aduana
    IF v_conteo_duplicados > 0 THEN
        TRUNCATE TABLE tabla_calidad_api;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CRÍTICO: API rechazada por múltiples lotes en una granja. Tablas protegidas intactas.';
    ELSE
        -- 3. SI TODO ESTÁ PERFECTO: Procedemos a actualizar la tabla de usuarios real de forma segura
        TRUNCATE TABLE tabla_usuarios;
        
        INSERT INTO tabla_usuarios (
            granja, lote, edad, nombre_galpon, sexo, dia, motivo, saldo_inicial, 
            total_mortalidad, traslado, saldo_final, fecha_registro, fecha_desde, 
            estado, consumos, peso, fecha_cierre, aplica_consumo_conversion, 
            mortalidad_acumulado, consumo_ave_excel
        )
        SELECT 
            granja, lote, edad, nombre_galpon, sexo, dia, motivo, saldo_inicial, 
            total_mortalidad, traslado, saldo_final, fecha_registro, fecha_desde, 
            estado, consumos, peso, fecha_cierre, aplica_consumo_conversion, 
            mortalidad_acumulado, consumo_ave_excel
        FROM tabla_calidad_api;
        
        -- Al finalizar con éxito, vaciamos la aduana para la carga del día siguiente
        TRUNCATE TABLE tabla_calidad_api;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vista_consumos_app`
--

/*!50001 DROP VIEW IF EXISTS `vista_consumos_app`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_consumos_app` AS select trim(concat(trim(`t_raw`.`granja`),'-',right(trim(`t_raw`.`lote`),4),'-',concat(trim(`t_raw`.`nombre_galpon`),(case when (trim(`t_raw`.`sexo`) = 'Hembra') then 'H' else 'M' end)),'-',cast(`t_raw`.`edad` as char charset utf8mb4))) AS `Identificador`,trim(`t_raw`.`granja`) AS `granja`,trim(`t_raw`.`lote`) AS `lote app`,right(trim(`t_raw`.`lote`),4) AS `lote`,`t_raw`.`edad` AS `edad`,trim(`t_raw`.`nombre_galpon`) AS `número_galpon`,trim(`t_raw`.`sexo`) AS `nombre sexo`,(case when (trim(`t_raw`.`sexo`) = 'Hembra') then 'H' else 'M' end) AS `sexo`,trim(concat(trim(`t_raw`.`nombre_galpon`),(case when (trim(`t_raw`.`sexo`) = 'Hembra') then 'H' else 'M' end))) AS `nombre_galpon`,`t_raw`.`dia` AS `dia`,trim(replace(`t_raw`.`motivo`,'Semana','SEMANA')) AS `motivo`,max(`t_raw`.`saldo_inicial`) AS `saldo_inicial`,max(`t_raw`.`total_mortalidad`) AS `total_mortalidad`,max(`t_raw`.`traslado`) AS `traslado`,max(`t_raw`.`saldo_final`) AS `saldo_final`,max(`t_raw`.`fecha_registro`) AS `fecha_registro`,max(`t_raw`.`fecha_desde`) AS `fecha_desde`,max(`t_raw`.`estado`) AS `estado`,max(`t_raw`.`peso`) AS `peso`,max(`t_raw`.`fecha_cierre`) AS `fecha_cierre`,max(`t_raw`.`aplica_consumo_conversion`) AS `aplica_consumo_conversion`,max(`t_raw`.`mortalidad_acumulado`) AS `mortalidad_acumulado`,max(`t_raw`.`consumo_ave_excel`) AS `consumo_ave_excel`,max(`t_raw`.`estado2`) AS `estado2`,max(`t_raw`.`id_secuencial`) AS `id_secuencial`,sum(`t_raw`.`consumos`) AS `consumos_APP`,sum((`t_raw`.`consumos` * 40000)) AS `Consumos` from `tabla_acumulativa_lotes` `t_raw` where ((`t_raw`.`granja` is not null) and (`t_raw`.`dia` is not null) and (ifnull(`t_raw`.`consumos`,0) > 0)) group by `t_raw`.`granja`,`t_raw`.`lote`,`t_raw`.`edad`,`t_raw`.`nombre_galpon`,`t_raw`.`sexo`,`t_raw`.`dia`,`t_raw`.`motivo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_hechos_app`
--

/*!50001 DROP VIEW IF EXISTS `vista_hechos_app`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_hechos_app` AS with `capa1_base` as (select `h`.`Identificador` AS `Identificador`,`h`.`granja` AS `granja`,`h`.`lote` AS `lote`,`h`.`edad` AS `edad`,`h`.`nombre_galpon` AS `nombre_galpon`,`h`.`sexo` AS `sexo`,`h`.`dia` AS `dia`,`h`.`motivo` AS `motivo`,`h`.`estado2` AS `estado`,`h`.`fecha_registro` AS `fecha_registro`,`h`.`fecha_desde` AS `fecha_desde`,`h`.`total_mortalidad` AS `total_mortalidad_dia`,`h`.`traslado` AS `traslado_dia`,`h`.`saldo_final` AS `saldo_final_dia`,`h`.`peso` AS `peso_dia`,min(`h`.`dia`) OVER (PARTITION BY `h`.`Identificador`,`h`.`motivo` )  AS `dia_min_motivo`,max(`h`.`dia`) OVER (PARTITION BY `h`.`Identificador`,`h`.`motivo` )  AS `dia_max_motivo`,min(`h`.`dia`) OVER (PARTITION BY `h`.`Identificador` )  AS `dia_min_absoluto_lote`,sum(`h`.`total_mortalidad`) OVER (PARTITION BY `h`.`Identificador`,`h`.`motivo` )  AS `mortalidad_sum_motivo`,first_value(`h`.`total_mortalidad`) OVER (PARTITION BY `h`.`Identificador`,`h`.`motivo` ORDER BY `h`.`dia` )  AS `mortalidad_dia_min`,sum(`h`.`traslado`) OVER (PARTITION BY `h`.`Identificador`,`h`.`motivo` )  AS `traslado_sum_motivo`,first_value(`h`.`traslado`) OVER (PARTITION BY `h`.`Identificador`,`h`.`motivo` ORDER BY `h`.`dia` )  AS `traslado_dia_min`,max(`h`.`peso`) OVER (PARTITION BY `h`.`Identificador`,`h`.`motivo` )  AS `peso_max_motivo` from `vista_historica_lotes` `h`), `capa2_mortalidad` as (select `b`.`Identificador` AS `Identificador`,`b`.`granja` AS `granja`,`b`.`lote` AS `lote`,`b`.`edad` AS `edad`,`b`.`nombre_galpon` AS `nombre_galpon`,`b`.`sexo` AS `sexo`,`b`.`dia` AS `dia`,`b`.`motivo` AS `motivo`,`b`.`estado` AS `estado`,`b`.`fecha_registro` AS `fecha_registro`,`b`.`fecha_desde` AS `fecha_desde`,`b`.`total_mortalidad_dia` AS `total_mortalidad_dia`,`b`.`traslado_dia` AS `traslado_dia`,`b`.`saldo_final_dia` AS `saldo_final_dia`,`b`.`peso_dia` AS `peso_dia`,`b`.`dia_min_motivo` AS `dia_min_motivo`,`b`.`dia_max_motivo` AS `dia_max_motivo`,`b`.`dia_min_absoluto_lote` AS `dia_min_absoluto_lote`,`b`.`mortalidad_sum_motivo` AS `mortalidad_sum_motivo`,`b`.`mortalidad_dia_min` AS `mortalidad_dia_min`,`b`.`traslado_sum_motivo` AS `traslado_sum_motivo`,`b`.`traslado_dia_min` AS `traslado_dia_min`,`b`.`peso_max_motivo` AS `peso_max_motivo`,(case when (`b`.`motivo` = 'SEMANA 1') then (case when (`b`.`dia` = `b`.`dia_min_motivo`) then `b`.`total_mortalidad_dia` else (`b`.`mortalidad_sum_motivo` - `b`.`mortalidad_dia_min`) end) when (`b`.`dia` < 29) then `b`.`mortalidad_sum_motivo` else `b`.`total_mortalidad_dia` end) AS `total_mortalidad`,max((case when (`b`.`dia` > `b`.`dia_min_motivo`) then `b`.`peso_dia` end)) OVER (PARTITION BY `b`.`Identificador`,`b`.`motivo` )  AS `peso_max_sem1_sin_min` from `capa1_base` `b`), `capa3_filtrada` as (select `m`.`Identificador` AS `Identificador`,`m`.`granja` AS `granja`,`m`.`lote` AS `lote`,`m`.`edad` AS `edad`,`m`.`nombre_galpon` AS `nombre_galpon`,`m`.`sexo` AS `sexo`,`m`.`dia` AS `dia`,`m`.`motivo` AS `motivo`,`m`.`estado` AS `estado`,`m`.`fecha_registro` AS `fecha_registro`,`m`.`fecha_desde` AS `fecha_desde`,`m`.`total_mortalidad_dia` AS `total_mortalidad_dia`,`m`.`traslado_dia` AS `traslado_dia`,`m`.`saldo_final_dia` AS `saldo_final_dia`,`m`.`peso_dia` AS `peso_dia`,`m`.`dia_min_motivo` AS `dia_min_motivo`,`m`.`dia_max_motivo` AS `dia_max_motivo`,`m`.`dia_min_absoluto_lote` AS `dia_min_absoluto_lote`,`m`.`mortalidad_sum_motivo` AS `mortalidad_sum_motivo`,`m`.`mortalidad_dia_min` AS `mortalidad_dia_min`,`m`.`traslado_sum_motivo` AS `traslado_sum_motivo`,`m`.`traslado_dia_min` AS `traslado_dia_min`,`m`.`peso_max_motivo` AS `peso_max_motivo`,`m`.`total_mortalidad` AS `total_mortalidad`,`m`.`peso_max_sem1_sin_min` AS `peso_max_sem1_sin_min` from `capa2_mortalidad` `m` where (((`m`.`motivo` = 'SEMANA 1') and ((`m`.`dia` = `m`.`dia_min_motivo`) or (`m`.`dia` = `m`.`dia_max_motivo`))) or ((`m`.`motivo` = 'SEMANA 2') and (`m`.`dia` = `m`.`dia_max_motivo`)) or ((`m`.`motivo` = 'SEMANA 3') and (`m`.`dia` = `m`.`dia_max_motivo`)) or ((`m`.`motivo` = 'SEMANA 4') and (`m`.`dia` = `m`.`dia_max_motivo`)) or (`m`.`dia` >= 29))), `capa4_acumulados` as (select `f`.`Identificador` AS `Identificador`,`f`.`granja` AS `granja`,`f`.`lote` AS `lote`,`f`.`edad` AS `edad`,`f`.`nombre_galpon` AS `nombre_galpon`,`f`.`sexo` AS `sexo`,`f`.`dia` AS `dia`,`f`.`motivo` AS `motivo`,`f`.`estado` AS `estado`,`f`.`fecha_registro` AS `fecha_registro`,`f`.`fecha_desde` AS `fecha_desde`,`f`.`total_mortalidad_dia` AS `total_mortalidad_dia`,`f`.`traslado_dia` AS `traslado_dia`,`f`.`saldo_final_dia` AS `saldo_final_dia`,`f`.`peso_dia` AS `peso_dia`,`f`.`dia_min_motivo` AS `dia_min_motivo`,`f`.`dia_max_motivo` AS `dia_max_motivo`,`f`.`dia_min_absoluto_lote` AS `dia_min_absoluto_lote`,`f`.`mortalidad_sum_motivo` AS `mortalidad_sum_motivo`,`f`.`mortalidad_dia_min` AS `mortalidad_dia_min`,`f`.`traslado_sum_motivo` AS `traslado_sum_motivo`,`f`.`traslado_dia_min` AS `traslado_dia_min`,`f`.`peso_max_motivo` AS `peso_max_motivo`,`f`.`total_mortalidad` AS `total_mortalidad`,`f`.`peso_max_sem1_sin_min` AS `peso_max_sem1_sin_min`,sum(`f`.`total_mortalidad`) OVER (PARTITION BY `f`.`Identificador` ORDER BY `f`.`dia` )  AS `mortalidad_acumulada_lineal` from `capa3_filtrada` `f`), `capa5_maxsemanal` as (select `a`.`Identificador` AS `Identificador`,`a`.`granja` AS `granja`,`a`.`lote` AS `lote`,`a`.`edad` AS `edad`,`a`.`nombre_galpon` AS `nombre_galpon`,`a`.`sexo` AS `sexo`,`a`.`dia` AS `dia`,`a`.`motivo` AS `motivo`,`a`.`estado` AS `estado`,`a`.`fecha_registro` AS `fecha_registro`,`a`.`fecha_desde` AS `fecha_desde`,`a`.`total_mortalidad_dia` AS `total_mortalidad_dia`,`a`.`traslado_dia` AS `traslado_dia`,`a`.`saldo_final_dia` AS `saldo_final_dia`,`a`.`peso_dia` AS `peso_dia`,`a`.`dia_min_motivo` AS `dia_min_motivo`,`a`.`dia_max_motivo` AS `dia_max_motivo`,`a`.`dia_min_absoluto_lote` AS `dia_min_absoluto_lote`,`a`.`mortalidad_sum_motivo` AS `mortalidad_sum_motivo`,`a`.`mortalidad_dia_min` AS `mortalidad_dia_min`,`a`.`traslado_sum_motivo` AS `traslado_sum_motivo`,`a`.`traslado_dia_min` AS `traslado_dia_min`,`a`.`peso_max_motivo` AS `peso_max_motivo`,`a`.`total_mortalidad` AS `total_mortalidad`,`a`.`peso_max_sem1_sin_min` AS `peso_max_sem1_sin_min`,`a`.`mortalidad_acumulada_lineal` AS `mortalidad_acumulada_lineal`,max(`a`.`mortalidad_acumulada_lineal`) OVER (PARTITION BY `a`.`Identificador`,`a`.`motivo` )  AS `mortalidad_acum_max_semana` from `capa4_acumulados` `a`), `consumo_semanal_plano` as (select `vista_consumos_app`.`Identificador` AS `Identificador`,`vista_consumos_app`.`motivo` AS `motivo`,sum(`vista_consumos_app`.`Consumos`) AS `consumo_total_semana` from `vista_consumos_app` group by `vista_consumos_app`.`Identificador`,`vista_consumos_app`.`motivo`), `consumo_diamin_plano` as (select `c_sub`.`Identificador` AS `Identificador`,`c_sub`.`motivo` AS `motivo`,sum(`c_sub`.`Consumos`) AS `consumo_total_min` from (`vista_consumos_app` `c_sub` join (select `vista_historica_lotes`.`Identificador` AS `Identificador`,`vista_historica_lotes`.`motivo` AS `motivo`,min(`vista_historica_lotes`.`dia`) AS `min_dia` from `vista_historica_lotes` group by `vista_historica_lotes`.`Identificador`,`vista_historica_lotes`.`motivo`) `h_min` on(((`c_sub`.`Identificador` = `h_min`.`Identificador`) and (`c_sub`.`motivo` = `h_min`.`motivo`) and (`c_sub`.`dia` = `h_min`.`min_dia`)))) group by `c_sub`.`Identificador`,`c_sub`.`motivo`), `capa6_consumosbase` as (select `fin`.`Identificador` AS `Identificador`,`fin`.`granja` AS `granja`,`fin`.`lote` AS `lote`,`fin`.`edad` AS `edad`,`fin`.`nombre_galpon` AS `nombre_galpon`,`fin`.`sexo` AS `sexo`,`fin`.`dia` AS `dia`,`fin`.`motivo` AS `motivo`,`fin`.`estado` AS `estado`,`fin`.`fecha_registro` AS `fecha_registro`,`fin`.`fecha_desde` AS `fecha_desde`,`fin`.`total_mortalidad_dia` AS `total_mortalidad_dia`,`fin`.`traslado_dia` AS `traslado_dia`,`fin`.`saldo_final_dia` AS `saldo_final_dia`,`fin`.`peso_dia` AS `peso_dia`,`fin`.`dia_min_motivo` AS `dia_min_motivo`,`fin`.`dia_max_motivo` AS `dia_max_motivo`,`fin`.`dia_min_absoluto_lote` AS `dia_min_absoluto_lote`,`fin`.`mortalidad_sum_motivo` AS `mortalidad_sum_motivo`,`fin`.`mortalidad_dia_min` AS `mortalidad_dia_min`,`fin`.`traslado_sum_motivo` AS `traslado_sum_motivo`,`fin`.`traslado_dia_min` AS `traslado_dia_min`,`fin`.`peso_max_motivo` AS `peso_max_motivo`,`fin`.`total_mortalidad` AS `total_mortalidad`,`fin`.`peso_max_sem1_sin_min` AS `peso_max_sem1_sin_min`,`fin`.`mortalidad_acumulada_lineal` AS `mortalidad_acumulada_lineal`,`fin`.`mortalidad_acum_max_semana` AS `mortalidad_acum_max_semana`,ifnull(`cd`.`Consumos`,0) AS `consumo_real_dia`,ifnull(`cs`.`consumo_total_semana`,0) AS `consumo_real_semana`,ifnull(`cm`.`consumo_total_min`,0) AS `consumo_real_dia_min` from (((`capa5_maxsemanal` `fin` left join `vista_consumos_app` `cd` on(((`fin`.`Identificador` = `cd`.`Identificador`) and (`fin`.`dia` = `cd`.`dia`)))) left join `consumo_semanal_plano` `cs` on(((`fin`.`Identificador` = `cs`.`Identificador`) and (`fin`.`motivo` = `cs`.`motivo`)))) left join `consumo_diamin_plano` `cm` on(((`fin`.`Identificador` = `cm`.`Identificador`) and (`fin`.`motivo` = `cm`.`motivo`))))), `capa9_preindicadores` as (select `cb`.`Identificador` AS `Identificador`,`cb`.`granja` AS `granja`,`cb`.`lote` AS `lote`,`cb`.`edad` AS `edad`,`cb`.`nombre_galpon` AS `nombre_galpon`,`cb`.`sexo` AS `sexo`,`cb`.`dia` AS `dia`,`cb`.`motivo` AS `motivo`,`cb`.`estado` AS `estado`,`cb`.`fecha_registro` AS `fecha_registro`,`cb`.`fecha_desde` AS `fecha_desde`,`cb`.`total_mortalidad_dia` AS `total_mortalidad_dia`,`cb`.`traslado_dia` AS `traslado_dia`,`cb`.`saldo_final_dia` AS `saldo_final_dia`,`cb`.`peso_dia` AS `peso_dia`,`cb`.`dia_min_motivo` AS `dia_min_motivo`,`cb`.`dia_max_motivo` AS `dia_max_motivo`,`cb`.`dia_min_absoluto_lote` AS `dia_min_absoluto_lote`,`cb`.`mortalidad_sum_motivo` AS `mortalidad_sum_motivo`,`cb`.`mortalidad_dia_min` AS `mortalidad_dia_min`,`cb`.`traslado_sum_motivo` AS `traslado_sum_motivo`,`cb`.`traslado_dia_min` AS `traslado_dia_min`,`cb`.`peso_max_motivo` AS `peso_max_motivo`,`cb`.`total_mortalidad` AS `total_mortalidad`,`cb`.`peso_max_sem1_sin_min` AS `peso_max_sem1_sin_min`,`cb`.`mortalidad_acumulada_lineal` AS `mortalidad_acumulada_lineal`,`cb`.`mortalidad_acum_max_semana` AS `mortalidad_acum_max_semana`,`cb`.`consumo_real_dia` AS `consumo_real_dia`,`cb`.`consumo_real_semana` AS `consumo_real_semana`,`cb`.`consumo_real_dia_min` AS `consumo_real_dia_min`,(case when (`cb`.`motivo` = 'SEMANA 1') then (case when (`cb`.`dia` = `cb`.`dia_min_motivo`) then `cb`.`consumo_real_dia` else (`cb`.`consumo_real_semana` - `cb`.`consumo_real_dia_min`) end) when (`cb`.`dia` < 29) then `cb`.`consumo_real_semana` else `cb`.`consumo_real_dia` end) AS `Consumos_final`,(case when ((`cb`.`saldo_final_dia` + (case when (`cb`.`motivo` = 'SEMANA 1') then (case when (`cb`.`dia` = `cb`.`dia_min_motivo`) then `cb`.`traslado_dia` else (`cb`.`traslado_sum_motivo` - `cb`.`traslado_dia_min`) end) when (`cb`.`dia` < 29) then `cb`.`traslado_sum_motivo` else `cb`.`traslado_dia` end)) <= 0) then 0 else ((case when (`cb`.`motivo` = 'SEMANA 1') then (case when (`cb`.`dia` = `cb`.`dia_min_motivo`) then `cb`.`consumo_real_dia` else (`cb`.`consumo_real_semana` - `cb`.`consumo_real_dia_min`) end) when (`cb`.`dia` < 29) then `cb`.`consumo_real_semana` else `cb`.`consumo_real_dia` end) / (`cb`.`saldo_final_dia` + (case when (`cb`.`motivo` = 'SEMANA 1') then (case when (`cb`.`dia` = `cb`.`dia_min_motivo`) then `cb`.`traslado_dia` else (`cb`.`traslado_sum_motivo` - `cb`.`traslado_dia_min`) end) when (`cb`.`dia` < 29) then `cb`.`traslado_sum_motivo` else `cb`.`traslado_dia` end))) end) AS `Consumo_ave_excel_final` from `capa6_consumosbase` `cb`), `capa10_consumoacumuladolineal` as (select `p`.`Identificador` AS `Identificador`,`p`.`granja` AS `granja`,`p`.`lote` AS `lote`,`p`.`edad` AS `edad`,`p`.`nombre_galpon` AS `nombre_galpon`,`p`.`sexo` AS `sexo`,`p`.`dia` AS `dia`,`p`.`motivo` AS `motivo`,`p`.`estado` AS `estado`,`p`.`fecha_registro` AS `fecha_registro`,`p`.`fecha_desde` AS `fecha_desde`,`p`.`total_mortalidad_dia` AS `total_mortalidad_dia`,`p`.`traslado_dia` AS `traslado_dia`,`p`.`saldo_final_dia` AS `saldo_final_dia`,`p`.`peso_dia` AS `peso_dia`,`p`.`dia_min_motivo` AS `dia_min_motivo`,`p`.`dia_max_motivo` AS `dia_max_motivo`,`p`.`dia_min_absoluto_lote` AS `dia_min_absoluto_lote`,`p`.`mortalidad_sum_motivo` AS `mortalidad_sum_motivo`,`p`.`mortalidad_dia_min` AS `mortalidad_dia_min`,`p`.`traslado_sum_motivo` AS `traslado_sum_motivo`,`p`.`traslado_dia_min` AS `traslado_dia_min`,`p`.`peso_max_motivo` AS `peso_max_motivo`,`p`.`total_mortalidad` AS `total_mortalidad`,`p`.`peso_max_sem1_sin_min` AS `peso_max_sem1_sin_min`,`p`.`mortalidad_acumulada_lineal` AS `mortalidad_acumulada_lineal`,`p`.`mortalidad_acum_max_semana` AS `mortalidad_acum_max_semana`,`p`.`consumo_real_dia` AS `consumo_real_dia`,`p`.`consumo_real_semana` AS `consumo_real_semana`,`p`.`consumo_real_dia_min` AS `consumo_real_dia_min`,`p`.`Consumos_final` AS `Consumos_final`,`p`.`Consumo_ave_excel_final` AS `Consumo_ave_excel_final`,sum(`p`.`Consumo_ave_excel_final`) OVER (PARTITION BY `p`.`Identificador` ORDER BY `p`.`dia` )  AS `consumo_acumulado_lineal` from `capa9_preindicadores` `p`), `capa11_maxconsumosemanal` as (select `cl`.`Identificador` AS `Identificador`,`cl`.`granja` AS `granja`,`cl`.`lote` AS `lote`,`cl`.`edad` AS `edad`,`cl`.`nombre_galpon` AS `nombre_galpon`,`cl`.`sexo` AS `sexo`,`cl`.`dia` AS `dia`,`cl`.`motivo` AS `motivo`,`cl`.`estado` AS `estado`,`cl`.`fecha_registro` AS `fecha_registro`,`cl`.`fecha_desde` AS `fecha_desde`,`cl`.`total_mortalidad_dia` AS `total_mortalidad_dia`,`cl`.`traslado_dia` AS `traslado_dia`,`cl`.`saldo_final_dia` AS `saldo_final_dia`,`cl`.`peso_dia` AS `peso_dia`,`cl`.`dia_min_motivo` AS `dia_min_motivo`,`cl`.`dia_max_motivo` AS `dia_max_motivo`,`cl`.`dia_min_absoluto_lote` AS `dia_min_absoluto_lote`,`cl`.`mortalidad_sum_motivo` AS `mortalidad_sum_motivo`,`cl`.`mortalidad_dia_min` AS `mortalidad_dia_min`,`cl`.`traslado_sum_motivo` AS `traslado_sum_motivo`,`cl`.`traslado_dia_min` AS `traslado_dia_min`,`cl`.`peso_max_motivo` AS `peso_max_motivo`,`cl`.`total_mortalidad` AS `total_mortalidad`,`cl`.`peso_max_sem1_sin_min` AS `peso_max_sem1_sin_min`,`cl`.`mortalidad_acumulada_lineal` AS `mortalidad_acumulada_lineal`,`cl`.`mortalidad_acum_max_semana` AS `mortalidad_acum_max_semana`,`cl`.`consumo_real_dia` AS `consumo_real_dia`,`cl`.`consumo_real_semana` AS `consumo_real_semana`,`cl`.`consumo_real_dia_min` AS `consumo_real_dia_min`,`cl`.`Consumos_final` AS `Consumos_final`,`cl`.`Consumo_ave_excel_final` AS `Consumo_ave_excel_final`,`cl`.`consumo_acumulado_lineal` AS `consumo_acumulado_lineal`,max(`cl`.`consumo_acumulado_lineal`) OVER (PARTITION BY `cl`.`Identificador`,`cl`.`motivo` )  AS `consumo_acum_max_semana` from `capa10_consumoacumuladolineal` `cl`) select concat(`c`.`granja`,'-',right(`c`.`lote`,4),'-',concat(`c`.`nombre_galpon`,(case when (`c`.`sexo` = 'Hembra') then 'H' else 'M' end)),'-',cast(`c`.`edad` as char charset utf8mb4)) AS `Identificador`,`c`.`granja` AS `granja`,`c`.`lote` AS `lote`,`c`.`edad` AS `edad`,`c`.`nombre_galpon` AS `nombre_galpon`,`c`.`sexo` AS `sexo`,(case when ((`c`.`motivo` = 'SEMANA 1') and (`c`.`dia` = `c`.`dia_min_motivo`)) then `c`.`dia_min_motivo` when (`c`.`motivo` = 'SEMANA 1') then 7 when (`c`.`motivo` = 'SEMANA 2') then 14 when (`c`.`motivo` = 'SEMANA 3') then 21 when (`c`.`motivo` = 'SEMANA 4') then 28 else `c`.`dia` end) AS `dia`,`c`.`motivo` AS `motivo`,(case when ((`c`.`motivo` = 'SEMANA 1') and (`c`.`dia` = `c`.`dia_min_motivo`)) then 'SEMANA 0' else `c`.`motivo` end) AS `Semana_nueva`,`c`.`estado` AS `estado`,`c`.`fecha_registro` AS `fecha_registro`,`c`.`fecha_desde` AS `fecha_desde`,`c`.`total_mortalidad` AS `total_mortalidad`,`c`.`mortalidad_acumulada_lineal` AS `Mortalidad acumulada`,(case when (`c`.`motivo` = 'SEMANA 1') then (case when ((`c`.`dia` = `c`.`dia_max_motivo`) and (`c`.`dia` <> `c`.`dia_min_motivo`)) then `c`.`mortalidad_acumulada_lineal` else 0 end) when (`c`.`dia` < 29) then `c`.`mortalidad_acumulada_lineal` else (case when (`c`.`dia` = `c`.`dia_min_motivo`) then `c`.`mortalidad_acum_max_semana` else 0 end) end) AS `Cálculo mortalidad acumulada`,(case when (`c`.`motivo` = 'SEMANA 1') then (case when (`c`.`dia` = `c`.`dia_min_motivo`) then `c`.`traslado_dia` else (`c`.`traslado_sum_motivo` - `c`.`traslado_dia_min`) end) when (`c`.`dia` < 29) then `c`.`traslado_sum_motivo` else `c`.`traslado_dia` end) AS `traslado`,`c`.`saldo_final_dia` AS `saldo_final`,((`c`.`saldo_final_dia` + (case when (`c`.`motivo` = 'SEMANA 1') then (case when (`c`.`dia` = `c`.`dia_min_motivo`) then `c`.`traslado_dia` else (`c`.`traslado_sum_motivo` - `c`.`traslado_dia_min`) end) when (`c`.`dia` < 29) then `c`.`traslado_sum_motivo` else `c`.`traslado_dia` end)) + `c`.`total_mortalidad`) AS `saldo_inicial`,`c`.`fecha_registro` AS `Fecha de cierre`,`c`.`Consumos_final` AS `Consumos`,`c`.`Consumo_ave_excel_final` AS `Consumo / ave excel`,`c`.`consumo_acumulado_lineal` AS `Consumo acumulado`,(case when (`c`.`motivo` = 'SEMANA 1') then (case when ((`c`.`dia` = `c`.`dia_max_motivo`) and (`c`.`dia` <> `c`.`dia_min_motivo`)) then `c`.`consumo_acumulado_lineal` else 0 end) when (`c`.`dia` < 29) then `c`.`consumo_acumulado_lineal` else (case when (`c`.`dia` = `c`.`dia_min_motivo`) then `c`.`consumo_acum_max_semana` else 0 end) end) AS `Cálculo consumo acumulado`,(case when ((`c`.`motivo` = 'SEMANA 1') and (`c`.`dia` = `c`.`dia_min_motivo`)) then if((ifnull(`c`.`peso_dia`,0) = 0),40,`c`.`peso_dia`) when (`c`.`motivo` = 'SEMANA 1') then ifnull(`c`.`peso_dia`,0) when (`c`.`motivo` = 'SEMANA 2') then ifnull(`c`.`peso_dia`,0) when (`c`.`motivo` = 'SEMANA 3') then ifnull(`c`.`peso_dia`,0) when (`c`.`motivo` = 'SEMANA 4') then ifnull(`t_raw`.`peso`,0) when (`c`.`dia` = 35) then ifnull(`c`.`peso_dia`,0) when (`c`.`dia` = 42) then ifnull(`c`.`peso_dia`,0) when (`c`.`dia` = 49) then ifnull(`c`.`peso_dia`,0) else 0 end) AS `Peso (gr)`,(case when (`c`.`dia` < 29) then (case when ((case when ((`c`.`motivo` = 'SEMANA 1') and (`c`.`dia` = `c`.`dia_min_motivo`)) then if((ifnull(`c`.`peso_dia`,0) = 0),40,`c`.`peso_dia`) when (`c`.`motivo` in ('SEMANA 1','SEMANA 2','SEMANA 3','SEMANA 4')) then ifnull(`c`.`peso_dia`,0) else 0 end) = 0) then 'No' when (`c`.`dia` = `c`.`dia_min_absoluto_lote`) then 'No' else 'Si' end) else if(((`c`.`dia` in (35,42,49)) and (ifnull(`c`.`peso_dia`,0) > 0)),'Si','No') end) AS `Aplica consumo conversión` from (`capa11_maxconsumosemanal` `c` left join `vista_historica_lotes` `t_raw` on(((`c`.`Identificador` = `t_raw`.`Identificador`) and (`c`.`dia` = `t_raw`.`dia`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_historica_lotes`
--

/*!50001 DROP VIEW IF EXISTS `vista_historica_lotes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_historica_lotes` AS select concat(trim(`tabla_acumulativa_lotes`.`granja`),'-',right(`tabla_acumulativa_lotes`.`lote`,4),'-',concat(trim(`tabla_acumulativa_lotes`.`nombre_galpon`),(case when (`tabla_acumulativa_lotes`.`sexo` = 'Hembra') then 'H' else 'M' end)),'-',cast(`tabla_acumulativa_lotes`.`edad` as char charset utf8mb4)) AS `Identificador`,trim(`tabla_acumulativa_lotes`.`granja`) AS `granja`,`tabla_acumulativa_lotes`.`lote` AS `lote app`,right(`tabla_acumulativa_lotes`.`lote`,4) AS `lote`,`tabla_acumulativa_lotes`.`edad` AS `edad`,trim(`tabla_acumulativa_lotes`.`nombre_galpon`) AS `número_galpon`,`tabla_acumulativa_lotes`.`sexo` AS `nombre sexo`,(case when (`tabla_acumulativa_lotes`.`sexo` = 'Hembra') then 'H' else 'M' end) AS `sexo`,concat(trim(`tabla_acumulativa_lotes`.`nombre_galpon`),(case when (`tabla_acumulativa_lotes`.`sexo` = 'Hembra') then 'H' else 'M' end)) AS `nombre_galpon`,`tabla_acumulativa_lotes`.`dia` AS `dia`,replace(`tabla_acumulativa_lotes`.`motivo`,'Semana','SEMANA') AS `motivo`,`tabla_acumulativa_lotes`.`saldo_inicial` AS `saldo_inicial`,`tabla_acumulativa_lotes`.`total_mortalidad` AS `total_mortalidad`,`tabla_acumulativa_lotes`.`traslado` AS `traslado`,`tabla_acumulativa_lotes`.`saldo_final` AS `saldo_final`,`tabla_acumulativa_lotes`.`fecha_registro` AS `fecha_registro`,`tabla_acumulativa_lotes`.`fecha_desde` AS `fecha_desde`,`tabla_acumulativa_lotes`.`estado` AS `estado`,`tabla_acumulativa_lotes`.`consumos` AS `consumos_APP`,(`tabla_acumulativa_lotes`.`consumos` * 40000) AS `Consumos`,`tabla_acumulativa_lotes`.`peso` AS `peso`,`tabla_acumulativa_lotes`.`fecha_cierre` AS `fecha_cierre`,`tabla_acumulativa_lotes`.`aplica_consumo_conversion` AS `aplica_consumo_conversion`,`tabla_acumulativa_lotes`.`mortalidad_acumulado` AS `mortalidad_acumulado`,`tabla_acumulativa_lotes`.`consumo_ave_excel` AS `consumo_ave_excel`,`tabla_acumulativa_lotes`.`estado2` AS `estado2`,concat_ws(',',`tabla_acumulativa_lotes`.`granja`,`tabla_acumulativa_lotes`.`lote`,cast(`tabla_acumulativa_lotes`.`edad` as char charset utf8mb4),`tabla_acumulativa_lotes`.`nombre_galpon`,`tabla_acumulativa_lotes`.`sexo`,cast(`tabla_acumulativa_lotes`.`dia` as char charset utf8mb4),replace(`tabla_acumulativa_lotes`.`motivo`,'Semana','SEMANA'),cast(`tabla_acumulativa_lotes`.`saldo_inicial` as char charset utf8mb4),cast(`tabla_acumulativa_lotes`.`total_mortalidad` as char charset utf8mb4),cast(`tabla_acumulativa_lotes`.`traslado` as char charset utf8mb4),cast(`tabla_acumulativa_lotes`.`saldo_final` as char charset utf8mb4)) AS `Quitar duplicado`,`tabla_acumulativa_lotes`.`id_secuencial` AS `id_secuencial` from `tabla_acumulativa_lotes` where (`tabla_acumulativa_lotes`.`id_secuencial` in (select min(`tabla_temporal`.`id_secuencial`) from (select `tabla_acumulativa_lotes`.`id_secuencial` AS `id_secuencial`,concat_ws(',',`tabla_acumulativa_lotes`.`granja`,`tabla_acumulativa_lotes`.`lote`,cast(`tabla_acumulativa_lotes`.`edad` as char charset utf8mb4),`tabla_acumulativa_lotes`.`nombre_galpon`,`tabla_acumulativa_lotes`.`sexo`,cast(`tabla_acumulativa_lotes`.`dia` as char charset utf8mb4),replace(`tabla_acumulativa_lotes`.`motivo`,'Semana','SEMANA'),cast(`tabla_acumulativa_lotes`.`saldo_inicial` as char charset utf8mb4),cast(`tabla_acumulativa_lotes`.`total_mortalidad` as char charset utf8mb4),cast(`tabla_acumulativa_lotes`.`traslado` as char charset utf8mb4),cast(`tabla_acumulativa_lotes`.`saldo_final` as char charset utf8mb4)) AS `cadena_duplicado` from `tabla_acumulativa_lotes`) `tabla_temporal` group by `tabla_temporal`.`cadena_duplicado`) and (`tabla_acumulativa_lotes`.`saldo_inicial` <> 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-06 10:44:19
