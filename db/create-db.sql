-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Počítač: 127.0.0.1
-- Úpraveno: 5. 11. 2020, 10:40
-- Verze serveru: 10.1.9-MariaDB
-- Verze PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `vydap_projekt`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `mistnosti` ExamRoom
--

CREATE TABLE `ExamRoom` (
  `room_code` varchar(5) COLLATE utf8_czech_ci NOT NULL,
  `description` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `capacity` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `pedagogove` Lecturer
--

CREATE TABLE `Lecturer` (
  `lecturer_code` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `surname` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `user_id` INT COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;


-- --------------------------------------------------------

--
-- Struktura tabulky `pedagogove_predmety`
--

CREATE TABLE `LecturerCourse` (
  `lecturer_code` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `course_code` varchar(5) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

-- --------------------------------------------------------

--
-- Structure of relation `Degree`
--

CREATE TABLE `Degree` (
  `id` INT NOT NULL COLLATE utf8_czech_ci PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_czech_ci UNIQUE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=UTF8_CZECH_CI;

--
-- Structure of relation `LecturerDegree`
--
CREATE TABLE `LecturerDegree` (
  `id` INT NOT NULL COLLATE utf8_czech_ci PRIMARY KEY AUTO_INCREMENT,
  `lecturer_code` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `pre_degree_id` INT COLLATE utf8_czech_ci NULL,
  `post_degree_id` INT COLLATE utf8_czech_ci NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=UTF8_CZECH_CI;


--
-- Structure of relation `predmety Course`
--

CREATE TABLE `Course` (
  `course_code` varchar(5) COLLATE utf8_czech_ci NOT NULL,
  `title` varchar(50) COLLATE utf8_czech_ci NOT NULL,
  `credits` smallint(6) NOT NULL,
  `lecture_hours` smallint(6) NOT NULL,
  `practice_hours` smallint(6) NOT NULL,
  `classification` varchar(2) COLLATE utf8_czech_ci NOT NULL,
  `annotation` text COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------


ALTER TABLE Course
ADD PRIMARY KEY (course_code);



--
-- Structure of relation `Student`
--

CREATE TABLE `Student` (
  `student_code` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `surname` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `user_id` INT COLLATE utf8_czech_ci NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=UTF8_CZECH_CI;

-- --------------------------------------------------------

--
-- Structure of relation `User`
--

CREATE TABLE `User` (
  `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(250) NOT NULL,
  `role` VARCHAR(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=UTF8_CZECH_CI;


-- --------------------------------------------------------


--
-- Relationship bettween `User` and `Student` entity.
--

ALTER TABLE Student
ADD FOREIGN KEY (user_id) REFERENCES User(id);



--
-- Struktura tabulky `studenti_predmety` StudentCourse
--

CREATE TABLE `StudentCourse` (
  `student_code` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `course_code` varchar(5) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

ALTER TABLE StudentCourse
ADD FOREIGN KEY (student_code) REFERENCES Student(student_code);

ALTER TABLE StudentCourse
ADD FOREIGN KEY (course_code) REFERENCES Course(course_code);





--
-- Struktura tabulky `vypsane_terminy` ScheduledExam
--

CREATE TABLE `vypsane_terminy` (
  `id_terminu` int(11) NOT NULL,
  `zkratka_mistnosti` varchar(5) COLLATE utf8_czech_ci NOT NULL,
  `kod_pedagoga` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `zkratka_predmetu` varchar(5) COLLATE utf8_czech_ci NOT NULL,
  `datum_cas` datetime NOT NULL,
  `max_pocet_prihlasenych` smallint(6) NOT NULL,
  `poznamka` varchar(200) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;


-- --------------------------------------------------------

--
-- Struktura tabulky `vysledky`
--

CREATE TABLE `ExamResult` (
  `id` smallint(6) NOT NULL,
  `description` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `type` varchar(2) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Struktura tabulky `zapsane_terminy`
--

CREATE TABLE `zapsane_terminy` (
  `id_terminu` int(11) NOT NULL,
  `kod_studenta` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `id_vysledku` smallint(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

--
-- Klíče pro exportované tabulky
--


--
-- Klíče pro tabulku `pedagogove_predmety`
--
ALTER TABLE `pedagogove_predmety`
  ADD PRIMARY KEY (`kod_pedagoga`,`zkratka_predmetu`),
  ADD KEY `zkratka_predmetu` (`zkratka_predmetu`);

--
-- Klíče pro tabulku `predmety`
--
ALTER TABLE `predmety`
  ADD PRIMARY KEY (`zkratka_predmetu`);





--
-- Klíče pro tabulku `vypsane_terminy`
--
ALTER TABLE `vypsane_terminy`
  ADD PRIMARY KEY (`id_terminu`),
  ADD KEY `id_terminu` (`id_terminu`,`zkratka_mistnosti`,`kod_pedagoga`,`zkratka_predmetu`,`datum_cas`,`max_pocet_prihlasenych`,`poznamka`),
  ADD KEY `zkratka_mistnosti` (`zkratka_mistnosti`),
  ADD KEY `zkratka_predmetu` (`zkratka_predmetu`),
  ADD KEY `kod_pedagoga` (`kod_pedagoga`);


--
-- Klíče pro tabulku `zapsane_terminy`
--
ALTER TABLE `zapsane_terminy`
  ADD PRIMARY KEY (`id_terminu`,`kod_studenta`),
  ADD KEY `kod_studenta` (`kod_studenta`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `vypsane_terminy`
--
ALTER TABLE `vypsane_terminy`
  MODIFY `id_terminu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `pedagogove_predmety`
--
ALTER TABLE `pedagogove_predmety`
  ADD CONSTRAINT `pedagogove_predmety_ibfk_1` FOREIGN KEY (`kod_pedagoga`) REFERENCES `pedagogove` (`kod_pedagoga`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pedagogove_predmety_ibfk_2` FOREIGN KEY (`zkratka_predmetu`) REFERENCES `predmety` (`zkratka_predmetu`) ON DELETE CASCADE ON UPDATE CASCADE;


--
-- Omezení pro tabulku `vypsane_terminy`
--
ALTER TABLE `vypsane_terminy`
  ADD CONSTRAINT `vypsane_terminy_ibfk_1` FOREIGN KEY (`zkratka_predmetu`) REFERENCES `predmety` (`zkratka_predmetu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vypsane_terminy_ibfk_2` FOREIGN KEY (`kod_pedagoga`) REFERENCES `pedagogove` (`kod_pedagoga`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vypsane_terminy_ibfk_3` FOREIGN KEY (`zkratka_mistnosti`) REFERENCES `mistnosti` (`zkratka_mistnosti`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Omezení pro tabulku `zapsane_terminy`
--
ALTER TABLE `zapsane_terminy`
  ADD CONSTRAINT `zapsane_terminy_ibfk_1` FOREIGN KEY (`kod_studenta`) REFERENCES `studenti` (`kod_studenta`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zapsane_terminy_ibfk_2` FOREIGN KEY (`id_terminu`) REFERENCES `vypsane_terminy` (`id_terminu`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


/* Custom edit by Patrik Duch */

ALTER TABLE `Lecturer`
ADD PRIMARY KEY (`lecturer_code`);


ALTER TABLE `Student`
ADD PRIMARY KEY (`student_code`);


ALTER TABLE `ExamRoom`
ADD PRIMARY KEY (`room_code`);


ALTER TABLE `ExamResult`
ADD PRIMARY KEY (`id`);

ALTER TABLE `StudentCourse`
ADD PRIMARY KEY (`student_code`,`course_code`),
ADD KEY `course_code` (`course_code`);

ALTER TABLE `StudentCourse`
ADD CONSTRAINT `StudentCourse_ibfk_1`
FOREIGN KEY (`course_code`) REFERENCES `Course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `StudentCourse_ibfk_2`
FOREIGN KEY (`student_code`) REFERENCES `Student` (`student_code`)
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `LecturerDegree`
ADD CONSTRAINT `LecturerDegree_ibfk_1`
FOREIGN KEY (`lecturer_code`) REFERENCES `Lecturer` (`lecturer_code`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `LecturerDegree_ibfk_2`
FOREIGN KEY (`pre_degree_id`) REFERENCES `Degree` (`id`)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `LecturerDegree`
ADD CONSTRAINT `LecturerDegree_ibfk_3`
FOREIGN KEY (`post_degree_id`) REFERENCES `Degree` (`id`)
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `LecturerCourse`
ADD CONSTRAINT `LecturerCourse_ibfk_1`
FOREIGN KEY (`lecturer_code`) REFERENCES `Lecturer` (`lecturer_code`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `LecturerCourse_ibfk_2`
FOREIGN KEY (`course_code`) REFERENCES `Course` (`course_code`)
ON DELETE CASCADE ON UPDATE CASCADE;


