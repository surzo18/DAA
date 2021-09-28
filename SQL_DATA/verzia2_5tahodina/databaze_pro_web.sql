-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1:3306
-- Vytvořeno: Pon 22. čen 2020, 17:41
-- Verze serveru: 10.4.10-MariaDB
-- Verze PHP: 7.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `databaze_pro_web`
--
CREATE DATABASE IF NOT EXISTS `databaze_pro_web` DEFAULT CHARACTER SET utf8 COLLATE utf8_czech_ci;
USE `databaze_pro_web`;

-- --------------------------------------------------------

--
-- Zástupná struktura pro pohled `algoritmy`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `algoritmy`;
CREATE TABLE IF NOT EXISTS `algoritmy` (
`clanky_id` int(11)
,`autor_id` int(11)
,`popis` varchar(155)
,`url` varchar(155)
,`klicova_slova` varchar(155)
,`titulek` varchar(155)
,`obsah` text
,`publikovano` datetime
);

-- --------------------------------------------------------

--
-- Struktura tabulky `clanek_sekce`
--

DROP TABLE IF EXISTS `clanek_sekce`;
CREATE TABLE IF NOT EXISTS `clanek_sekce` (
  `clanek_sekce_id` int(11) NOT NULL AUTO_INCREMENT,
  `clanek_id` int(11) DEFAULT NULL,
  `sekce_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`clanek_sekce_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `clanek_sekce`
--

INSERT INTO `clanek_sekce` (`clanek_sekce_id`, `clanek_id`, `sekce_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 2),
(4, 3, 2),
(5, 4, 2);

-- --------------------------------------------------------

--
-- Struktura tabulky `clanky`
--

DROP TABLE IF EXISTS `clanky`;
CREATE TABLE IF NOT EXISTS `clanky` (
  `clanky_id` int(11) NOT NULL AUTO_INCREMENT,
  `autor_id` int(11) DEFAULT NULL,
  `popis` varchar(155) COLLATE utf8_czech_ci DEFAULT NULL,
  `url` varchar(155) COLLATE utf8_czech_ci DEFAULT NULL,
  `klicova_slova` varchar(155) COLLATE utf8_czech_ci DEFAULT NULL,
  `titulek` varchar(155) COLLATE utf8_czech_ci DEFAULT NULL,
  `obsah` text COLLATE utf8_czech_ci DEFAULT NULL,
  `publikovano` datetime DEFAULT NULL,
  PRIMARY KEY (`clanky_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `clanky`
--

INSERT INTO `clanky` (`clanky_id`, `autor_id`, `popis`, `url`, `klicova_slova`, `titulek`, `obsah`, `publikovano`) VALUES
(1, 1, 'Co je to algoritmus? Pokud to nevíte, přečtěte si tento článek.', 'co-je-to-algoritmus', 'algoritmus, co je to, vysvětlení', 'Algoritmus', 'Když se bavíme o algoritmech, pojďme se tedy shodnout na tom, co ten algoritmus vůbec je. Jednoduše řečeno, algoritmus je návod k řešení nějakého problému. Když se na to podíváme z lidského pohledu, algoritmus by mohl být třeba návod, jak ráno vstát. I když to zní jednoduše, je to docela problém. Počítače jsou totiž stroje a ty nemyslí. Musíme tedy dopodrobna popsat všechny kroky algoritmu. Tím se dostáváme k první vlastnosti algoritmu - musí být elementární (skládat se z konečného počtu jednoduchých a snadno srozumitelných kroků, tedy příkazů). \"Vstaň z postele\" určitě není algoritmus. \"Otevři oči, sundej peřinu, posaň se, dej nohy na zem a stoupni si\" - to už zní docela podrobně a jednalo by se tedy o pravý algoritmus. My se však budeme pohybovat v IT, takže budeme řešit problémy jako seřaď prvky podle velikosti nebo vyhledej prvek podle jeho obsahu. To jsou totiž 2 základní úlohy, které počítače dělají nejčastěji a které je potřeba dokonale promýšlet a optimalizovat, aby trvaly co nejkratší dobu. Z dalších příkladů algoritmů mě napadá třeba vyřeš kvadratickou rovnici nebo vyřeš sudoku.', '2012-03-21 00:00:00'),
(2, 2, 'Bakterie jsou obdoba buněčného automatu v kombinaci s hrou.', 'bakterie-bunecny-automat', 'bakterie, automat, algoritmus', 'Bakterie', 'Bakterie jsou obdoba buněčného automatu, který vymyslel britský matematik John Horton Conway v roce 1970. Celou tuto hru řídí čtyři jednoduchá pravidla:/n/n\r\n1. Živá bakterie s méně, než dvěma živými sousedy umírá./n\r\n2. Živá bakterie s více, než třemi živými sousedy umírá na přemnožení./n\r\n3. Živá bakterie s dvoumi nebo třemi sousedy přežívá beze změny do další generace./n\r\n4. Mrtvá bakterie, s přesně třemi živými sousedy, opět ožívá./n\r\nTyto zdánlivě naprosto primitivní pravidla dokáží za správného počátečního rozmístění bakterií vytvořit pochodující skupinky, shluky \"vystřelující\" pochodující pětice, překvapivě složité souměrné exploze, oscilátory (periodicky kmitající skupinky), či nekonečnou podívanou na to, jak složité a dokonalé obrazce dokáží tyto dvě podmínky vytvořit. Celý program je koncipován jako hra, máte za úkol vytvořit co nejdéle žijící kolonii. &lt;a href=&quot;soubory/bakterie.zip&quot; ', '2012-02-14 00:00:00'),
(3, 3, 'Cheese Mouse je oddechová plošinovka.', 'cheese-mouse-oddechova-plosinovka', 'myš, sýr, hra', 'Cheese Mouse', 'Cheese mouse je plošinovka s \"horkou ostrovní atmosférou\", kde ovládáte myš a musíte se dostat k sýru. V tom vám ale brání nejrůznější nástrahy a nepřatelé jako hadi, krysy, pirane, ale i roboti, mumie a nejrůznější havěť. Hru s několika petrobarevnými světy jsem dělal ještě na základní škole s Veisenem a může se pochlubit 2. místem v Bonusweb game competition, kde vyhrála 5.000 Kč. Vznikala v Game makeru o letních prázdninách, ještě v bezstarostném dětství, což značně ovlivnilo její grafickou stránku. Rád si ji občas zahraji na odreagování a zlepšní nálady. &lt;a href=&quot;soubory/cheesemouse.zip&quot; /&gt;', '2004-06-22 00:00:00'),
(4, 2, 'Pacman je remake kultovní hry.', 'pacman-remake', 'pacman, remake, pampuch, hra, zdarma', 'Pacman', 'Jedná se o naprosto základní verzi této hry s editorem levelů, takže si můžete vytvořit svá vlastní kola. Postupem času ji hodlám ještě trochu upravit a přidat nějaké nové prvky, fullscreen a lepší grafiku. Engine hry bude také základem mého nového projektu Geckon man, který je zatím ve fázi psaní scénáře. &lt;a href=&quot;soubory/pacman.zip&quot; /&gt;', '2011-06-03 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabulky `komentare`
--

DROP TABLE IF EXISTS `komentare`;
CREATE TABLE IF NOT EXISTS `komentare` (
  `komentare_id` int(11) NOT NULL AUTO_INCREMENT,
  `clanek_id` int(11) DEFAULT NULL,
  `uzivatel_id` int(11) DEFAULT NULL,
  `obsah` text COLLATE utf8_czech_ci DEFAULT NULL,
  `datum` datetime DEFAULT NULL,
  PRIMARY KEY (`komentare_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `komentare`
--

INSERT INTO `komentare` (`komentare_id`, `clanek_id`, `uzivatel_id`, `obsah`, `datum`) VALUES
(1, 1, 4, 'Super článek!', '2012-04-06 00:00:00'),
(2, 2, 4, 'Jak je tedy přesně ta podmínka pro vznik bakterie?', '2011-01-28 00:00:00'),
(3, 3, 1, 'Zasekla jsem se v této hře, kde najdu klíč do 3. levelu?', '2011-09-30 00:00:00'),
(4, 3, 4, 'Jak rozjedu plošinu v 5. levelu?', '2010-08-01 00:00:00'),
(5, 4, 1, 'Umřel jsem a nemám hru uloženou, co mám dělat?', '2012-04-14 00:00:00'),
(6, 4, 3, 'Dobrá hra!', '2012-04-06 00:00:00'),
(7, 1, 3, 'Nerozumím tomu!', '2011-04-06 00:00:00'),
(8, 1, 2, 'Super článek!', '2012-05-06 00:00:00');

-- --------------------------------------------------------

--
-- Struktura tabulky `sekce`
--

DROP TABLE IF EXISTS `sekce`;
CREATE TABLE IF NOT EXISTS `sekce` (
  `sekce_id` int(11) NOT NULL AUTO_INCREMENT,
  `nazev` varchar(155) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`sekce_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `sekce`
--

INSERT INTO `sekce` (`sekce_id`, `nazev`) VALUES
(1, 'Algoritmy'),
(2, 'Hry');

-- --------------------------------------------------------

--
-- Struktura tabulky `uzivatele`
--

DROP TABLE IF EXISTS `uzivatele`;
CREATE TABLE IF NOT EXISTS `uzivatele` (
  `uzivatele_id` int(11) NOT NULL AUTO_INCREMENT,
  `prezdivka` varchar(155) COLLATE utf8_czech_ci DEFAULT NULL,
  `email` varchar(155) COLLATE utf8_czech_ci DEFAULT NULL,
  `heslo` varchar(255) COLLATE utf8_czech_ci DEFAULT NULL,
  PRIMARY KEY (`uzivatele_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Vypisuji data pro tabulku `uzivatele`
--

INSERT INTO `uzivatele` (`uzivatele_id`, `prezdivka`, `email`, `heslo`) VALUES
(1, 'Míša', 'misaslavikova@gmail.com', 'dGg#@$DetA53d'),
(2, 'David', 'capkadavid@seznam.cz', '$#fdfgfHBKBKS'),
(3, 'Denny', 'denny@hotmail.com', 'Jmls_aSW2RFss'),
(4, 'Ema', 'ema@centrum.cz', 'fw8QT32qmcsld');

-- --------------------------------------------------------

--
-- Struktura pro pohled `algoritmy`
--
DROP TABLE IF EXISTS `algoritmy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `algoritmy`  AS  select `clanky`.`clanky_id` AS `clanky_id`,`clanky`.`autor_id` AS `autor_id`,`clanky`.`popis` AS `popis`,`clanky`.`url` AS `url`,`clanky`.`klicova_slova` AS `klicova_slova`,`clanky`.`titulek` AS `titulek`,`clanky`.`obsah` AS `obsah`,`clanky`.`publikovano` AS `publikovano` from `clanky` where `clanky`.`clanky_id` in (select `clanek_sekce`.`clanek_id` from `clanek_sekce` where `clanek_sekce`.`sekce_id` = (select `sekce`.`sekce_id` from `sekce` where `sekce`.`nazev` = 'Algoritmy')) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
