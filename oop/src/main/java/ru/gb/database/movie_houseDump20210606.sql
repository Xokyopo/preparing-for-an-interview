-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: movie_house
-- ------------------------------------------------------
-- Server version	8.0.20

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

--
-- Temporary view structure for view `1_movie_overlay_error`
--

DROP TABLE IF EXISTS `1_movie_overlay_error`;
/*!50001 DROP VIEW IF EXISTS `1_movie_overlay_error`*/;
SET
@saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `1_movie_overlay_error` AS SELECT 
 1 AS `фильм 1`,
 1 AS `время начала (фильм 1)`,
 1 AS `длительность (фильм 1)`,
 1 AS `фильм 2`,
 1 AS `время начала (фильм 2)`,
 1 AS `длительность (фильм 2)`*/;
SET
character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `2_interval_more_then_30_minutes`
--

DROP TABLE IF EXISTS `2_interval_more_then_30_minutes`;
/*!50001 DROP VIEW IF EXISTS `2_interval_more_then_30_minutes`*/;
SET
@saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `2_interval_more_then_30_minutes` AS SELECT 
 1 AS `номер сесси первого фильма`,
 1 AS `фильм 1`,
 1 AS `время начала`,
 1 AS `длительность`,
 1 AS `номер сесси второго фильма`,
 1 AS `время начала 2 фильма`,
 1 AS `длительность перерыва (минут)`*/;
SET
character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `3_movie_sale_statistick_with_itog`
--

DROP TABLE IF EXISTS `3_movie_sale_statistick_with_itog`;
/*!50001 DROP VIEW IF EXISTS `3_movie_sale_statistick_with_itog`*/;
SET
@saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `3_movie_sale_statistick_with_itog` AS SELECT 
 1 AS `фильм`,
 1 AS `числа посетителей за все время`,
 1 AS `среднего числа зрителей за сеанс`,
 1 AS `общей суммы сборов по каждому фильму`*/;
SET
character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `4_visitors_and_box_office_receipts_grouped_by_movie_start_time`
--

DROP TABLE IF EXISTS `4_visitors_and_box_office_receipts_grouped_by_movie_start_time`;
/*!50001 DROP VIEW IF EXISTS `4_visitors_and_box_office_receipts_grouped_by_movie_start_time`*/;
SET
@saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `4_visitors_and_box_office_receipts_grouped_by_movie_start_time` AS SELECT 
 1 AS `временной диапазон`,
 1 AS `фильм`,
 1 AS `кассовые сборы`,
 1 AS `число посетителей`*/;
SET
character_set_client = @saved_cs_client;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie`
(
    `id`       bigint unsigned NOT NULL AUTO_INCREMENT,
    `name`     varchar(500) NOT NULL,
    `duration` int          NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK
TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie`
VALUES (1, 'Побег из Шоушенка (1994)', 142),
       (2, 'Зеленая миля (1999)', 189),
       (3, 'Властелин колец: Возвращение короля (2003)', 201),
       (4, 'Варкрафт', 201),
       (5, 'Интерстеллар (2014)', 169),
       (6, 'Властелин колец: Две крепости (2002)', 179),
       (7, 'Властелин колец: Братство Кольца (2001)', 178),
       (8, 'Друзья: Воссоединение (2021)', 104),
       (9, 'Форрест Гамп (1994)', 142),
       (10, 'Список Шиндлера (1993)', 195);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Temporary view structure for view `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!50001 DROP VIEW IF EXISTS `sales`*/;
SET
@saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales` AS SELECT 
 1 AS `ticket_id`,
 1 AS `session_id`,
 1 AS `movie_id`,
 1 AS `sessions_price`,
 1 AS `sessions_start_in`*/;
SET
character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `session_normal_view`
--

DROP TABLE IF EXISTS `session_normal_view`;
/*!50001 DROP VIEW IF EXISTS `session_normal_view`*/;
SET
@saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `session_normal_view` AS SELECT 
 1 AS `№`,
 1 AS `Название кина`,
 1 AS `Время начала`,
 1 AS `Стоимость билета`*/;
SET
character_set_client = @saved_cs_client;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions`
(
    `id`       bigint unsigned NOT NULL AUTO_INCREMENT,
    `movie_id` bigint unsigned NOT NULL,
    `start_in` datetime       NOT NULL,
    `price`    decimal(10, 2) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id`),
    KEY        `fk__session.movie_id__move.id_idx` (`movie_id`),
    CONSTRAINT `fk__session.movie_id__move.id` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK
TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions`
VALUES (1, 1, '2021-06-04 14:46:07', 200.00),
       (2, 2, '2021-06-04 15:46:07', 300.00),
       (3, 3, '2021-06-04 17:46:07', 250.00),
       (4, 4, '2021-06-04 20:46:07', 150.00),
       (5, 5, '2021-06-04 12:46:07', 500.00),
       (6, 6, '2021-06-04 10:46:07', 670.00),
       (8, 8, '2021-06-04 08:46:07', 100.00),
       (9, 9, '2021-06-04 02:46:07', 100.00),
       (10, 10, '2021-06-04 05:46:07', 50.00);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Temporary view structure for view `sessions_full_info`
--

DROP TABLE IF EXISTS `sessions_full_info`;
/*!50001 DROP VIEW IF EXISTS `sessions_full_info`*/;
SET
@saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sessions_full_info` AS SELECT 
 1 AS `session_id`,
 1 AS `movie_id`,
 1 AS `movie_name`,
 1 AS `start_in`,
 1 AS `duration`,
 1 AS `price`,
 1 AS `end_in`*/;
SET
character_set_client = @saved_cs_client;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket`
(
    `id`         bigint unsigned NOT NULL AUTO_INCREMENT,
    `session_id` bigint unsigned NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `id_UNIQUE` (`id`),
    KEY          `fk__ticket.session_id__session.id_idx` (`session_id`),
    CONSTRAINT `fk__ticket.session_id__session.id` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK
TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket`
VALUES (1, 1),
       (5, 1),
       (2, 2),
       (6, 2),
       (11, 2),
       (3, 3),
       (9, 3),
       (12, 3),
       (4, 4),
       (7, 6),
       (10, 6),
       (8, 9);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Final view structure for view `1_movie_overlay_error`
--

/*!50001 DROP VIEW IF EXISTS `1_movie_overlay_error`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `1_movie_overlay_error` AS select `sessions_full_info`.`movie_name` AS `фильм 1`,`sessions_full_info`.`start_in` AS `время начала (фильм 1)`,`sessions_full_info`.`duration` AS `длительность (фильм 1)`,`overlay`.`movie_name` AS `фильм 2`,`overlay`.`start_in` AS `время начала (фильм 2)`,`overlay`.`duration` AS `длительность (фильм 2)` from (`sessions_full_info` join `sessions_full_info` `overlay` on(((`overlay`.`start_in` between `sessions_full_info`.`start_in` and `sessions_full_info`.`end_in`) and (`sessions_full_info`.`session_id` <> `overlay`.`session_id`) and (`sessions_full_info`.`start_in` <= `overlay`.`start_in`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `2_interval_more_then_30_minutes`
--

/*!50001 DROP VIEW IF EXISTS `2_interval_more_then_30_minutes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `2_interval_more_then_30_minutes` AS select `a`.`номер сесси первого фильма` AS `номер сесси первого фильма`,`a`.`фильм 1` AS `фильм 1`,`a`.`время начала` AS `время начала`,`a`.`длительность` AS `длительность`,`a`.`номер сесси второго фильма` AS `номер сесси второго фильма`,`a`.`время начала 2 фильма` AS `время начала 2 фильма`,`a`.`длительность перерыва (минут)` AS `длительность перерыва (минут)` from (with `sessions_fi` as (select row_number() OVER (ORDER BY `sfi`.`start_in` )  AS `it`,`sfi`.`session_id` AS `session_id`,`sfi`.`movie_id` AS `movie_id`,`sfi`.`movie_name` AS `movie_name`,`sfi`.`start_in` AS `start_in`,`sfi`.`duration` AS `duration`,`sfi`.`price` AS `price`,`sfi`.`end_in` AS `end_in` from `sessions_full_info` `sfi` order by `sfi`.`start_in`) select `sfi_1`.`session_id` AS `номер сесси первого фильма`,`sfi_1`.`movie_name` AS `фильм 1`,`sfi_1`.`start_in` AS `время начала`,`sfi_1`.`duration` AS `длительность`,`sfi_2`.`session_id` AS `номер сесси второго фильма`,`sfi_2`.`start_in` AS `время начала 2 фильма`,minute((`sfi_2`.`start_in` - `sfi_1`.`end_in`)) AS `длительность перерыва (минут)` from (`sessions_fi` `sfi_1` join `sessions_fi` `sfi_2` on((((`sfi_1`.`it` + 1) = `sfi_2`.`it`) and (minute((`sfi_2`.`start_in` - `sfi_1`.`end_in`)) >= 30))))) `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `3_movie_sale_statistick_with_itog`
--

/*!50001 DROP VIEW IF EXISTS `3_movie_sale_statistick_with_itog`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `3_movie_sale_statistick_with_itog` AS select if((grouping(`a`.`фильм`) = 1),'ИТОГО',`a`.`фильм`) AS `фильм`,sum(`a`.`числа посетителей за все время`) AS `числа посетителей за все время`,sum(`a`.`среднего числа зрителей за сеанс`) AS `среднего числа зрителей за сеанс`,sum(`a`.`общей суммы сборов по каждому фильму`) AS `общей суммы сборов по каждому фильму` from (select `m`.`name` AS `фильм`,`cc`.`userCount` AS `числа посетителей за все время`,`sac`.`avgUserCount` AS `среднего числа зрителей за сеанс`,`fp`.`priceSumm` AS `общей суммы сборов по каждому фильму` from (((`movie` `m` join (select `sales`.`movie_id` AS `movie_id`,count(`sales`.`movie_id`) AS `userCount` from `sales` group by `sales`.`movie_id`) `cc` on((`cc`.`movie_id` = `m`.`id`))) join (select `aus`.`movie_id` AS `movie_id`,avg(`aus`.`userCount`) AS `avgUserCount` from (select `sales`.`movie_id` AS `movie_id`,`sales`.`session_id` AS `session_id`,count(`sales`.`session_id`) AS `userCount` from `sales` group by `sales`.`session_id`) `aus` group by `aus`.`movie_id`) `sac` on((`sac`.`movie_id` = `m`.`id`))) join (select `sales`.`movie_id` AS `movie_id`,sum(`sales`.`sessions_price`) AS `priceSumm` from `sales` group by `sales`.`movie_id`) `fp` on((`fp`.`movie_id` = `m`.`id`)))) `a` group by `a`.`фильм` with rollup order by `a`.`общей суммы сборов по каждому фильму` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `4_visitors_and_box_office_receipts_grouped_by_movie_start_time`
--

/*!50001 DROP VIEW IF EXISTS `4_visitors_and_box_office_receipts_grouped_by_movie_start_time`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `4_visitors_and_box_office_receipts_grouped_by_movie_start_time` AS with `sbor` as (select `s`.`id` AS `id`,`s`.`movie_id` AS `movie_id`,`s`.`start_in` AS `start_in`,`s`.`price` AS `price`,`t`.`id` AS `tiket_id` from (`sessions` `s` join `ticket` `t` on((`t`.`session_id` = `s`.`id`)))) select `stf`.`time_range` AS `временной диапазон`,`m`.`name` AS `фильм`,`stf`.`full_price` AS `кассовые сборы`,`stf`.`suctomer_count` AS `число посетителей` from ((select `sbor`.`id` AS `id`,`sbor`.`movie_id` AS `movie_id`,sum(`sbor`.`price`) AS `full_price`,count(`sbor`.`tiket_id`) AS `suctomer_count`,'с 09 до 15' AS `time_range` from `sbor` where ((hour(`sbor`.`start_in`) >= 9) and (hour(`sbor`.`start_in`) < 15)) group by `sbor`.`start_in` union all select `sbor`.`id` AS `id`,`sbor`.`movie_id` AS `movie_id`,sum(`sbor`.`price`) AS `full_price`,count(`sbor`.`tiket_id`) AS `suctomer_count`,'с 15 до 18' AS `time_range` from `sbor` where ((hour(`sbor`.`start_in`) >= 15) and (hour(`sbor`.`start_in`) < 18)) group by `sbor`.`start_in` union all select `sbor`.`id` AS `id`,`sbor`.`movie_id` AS `movie_id`,sum(`sbor`.`price`) AS `full_price`,count(`sbor`.`tiket_id`) AS `suctomer_count`,'с 18 до 21' AS `time_range` from `sbor` where ((hour(`sbor`.`start_in`) >= 18) and (hour(`sbor`.`start_in`) < 21)) group by `sbor`.`start_in` union all select `sbor`.`id` AS `id`,`sbor`.`movie_id` AS `movie_id`,sum(`sbor`.`price`) AS `full_price`,count(`sbor`.`tiket_id`) AS `suctomer_count`,'с 21 до 00' AS `time_range` from `sbor` where ((hour(`sbor`.`start_in`) >= 21) and (hour(`sbor`.`start_in`) < 0)) group by `sbor`.`start_in`) `stf` join `movie` `m` on((`stf`.`movie_id` = `m`.`id`))) order by `stf`.`time_range` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales`
--

/*!50001 DROP VIEW IF EXISTS `sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `sales` AS select `t`.`id` AS `ticket_id`,`s`.`id` AS `session_id`,`s`.`movie_id` AS `movie_id`,`s`.`price` AS `sessions_price`,`s`.`start_in` AS `sessions_start_in` from (`ticket` `t` join `sessions` `s` on((`s`.`id` = `t`.`session_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `session_normal_view`
--

/*!50001 DROP VIEW IF EXISTS `session_normal_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `session_normal_view` AS select `sessions`.`id` AS `№`,`movie`.`name` AS `Название кина`,`sessions`.`start_in` AS `Время начала`,`sessions`.`price` AS `Стоимость билета` from (`sessions` join `movie` on((`movie`.`id` = `sessions`.`movie_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sessions_full_info`
--

/*!50001 DROP VIEW IF EXISTS `sessions_full_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `sessions_full_info` AS select `sessions`.`id` AS `session_id`,`sessions`.`movie_id` AS `movie_id`,`movie`.`name` AS `movie_name`,`sessions`.`start_in` AS `start_in`,`movie`.`duration` AS `duration`,`sessions`.`price` AS `price`,(`sessions`.`start_in` + interval `movie`.`duration` minute) AS `end_in` from (`sessions` join `movie` on((`movie`.`id` = `sessions`.`movie_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-06 22:42:08
