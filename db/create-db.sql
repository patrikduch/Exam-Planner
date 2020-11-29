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
-- Relationship between `User` and `Student` entity.
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


--
-- Struktura tabulky `vypsane_terminy` ScheduledExam
--

CREATE TABLE `ExamDate` (
  `exam_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `room_code` varchar(5) COLLATE utf8_czech_ci NOT NULL,
  `lecturer_code` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `course_code` varchar(5) COLLATE utf8_czech_ci NOT NULL,
  `exam_start_date` datetime NOT NULL,
  `exam_end_date` datetime NOT NULL,
  `max_participants` smallint(6) NOT NULL,
  `note` varchar(200) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;


--
-- Struktura tabulky `mistnosti` ExamRoom
--

CREATE TABLE `ExamRoom` (
  `room_code` varchar(5) COLLATE utf8_czech_ci NOT NULL PRIMARY KEY,
  `description` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `capacity` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------




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
-- Structure of relation `ActiveExam zapsane_terminy`
--

CREATE TABLE `ScheduledExam` (
  `exam_id` int(11) NOT NULL,
  `student_code` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `result_id` smallint(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


/* Custom edit by Patrik Duch */

ALTER TABLE StudentCourse
ADD FOREIGN KEY (student_code) REFERENCES Student(student_code);

ALTER TABLE StudentCourse
ADD FOREIGN KEY (course_code) REFERENCES Course(course_code);

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


ALTER TABLE `ExamDate`
ADD CONSTRAINT `ExamDateToExamRoom_ibfk_1`
FOREIGN KEY (`room_code`) REFERENCES `ExamRoom` (`room_code`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `ExamDate`
ADD CONSTRAINT `ExamDateToLecture_ibfk_1`
FOREIGN KEY (`lecturer_code`) REFERENCES `Lecturer` (`lecturer_code`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `ExamDate`
ADD CONSTRAINT `ExamDateToCourse_ibfk_1`
FOREIGN KEY (`course_code`) REFERENCES `Course` (`course_code`) ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE `ScheduledExam`
ADD CONSTRAINT `ScheduledExamToExamDate_ibfk_1`
FOREIGN KEY (`exam_id`) REFERENCES `ExamDate` (`exam_id`);

ALTER TABLE `ScheduledExam`
ADD CONSTRAINT `ScheduledExamToStudent_ibfk_1`
FOREIGN KEY (`student_code`) REFERENCES `Student` (`student_code`);



/* Fix for charset of the database */
ALTER DATABASE `db` CHARACTER SET utf8 COLLATE utf8_general_ci;

/* Set czech time zone */
set time_zone = '+01:00';