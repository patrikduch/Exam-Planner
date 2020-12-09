SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+01:00";

ALTER DATABASE `db` CHARACTER SET utf8 COLLATE utf8_czech_ci;

-- --------------------------------------------------------
--
-- Structure of relation `ProjectDetail`
--
CREATE TABLE ProjectDetail (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(35) NOT NULL UNIQUE
);


-- --------------------------------------------------------
--
-- Structure of relation `Lecturer`
--

CREATE TABLE `Lecturer` (
  `lecturer_code` varchar(10) COLLATE utf8_czech_ci NOT NULL PRIMARY KEY,
  `first_name` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `surname` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `user_id` INT COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;


-- --------------------------------------------------------

--
-- Structure of relation `LecturerCourse`
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
-- Structure of relation `Course`
--

CREATE TABLE `Course` (
  `course_code` varchar(5) COLLATE utf8_czech_ci NOT NULL PRIMARY KEY,
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
  `student_code` varchar(10) COLLATE utf8_czech_ci NOT NULL PRIMARY KEY,
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
  `username` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(250) NOT NULL,
  `role` VARCHAR(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=UTF8_CZECH_CI;


-- --------------------------------------------------------

--
-- Structure of relation `StudentCourse`
--

CREATE TABLE `StudentCourse` (
  `student_code` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `course_code` varchar(5) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- --------------------------------------------------------

--
-- Structure of relation `ScheduledExam`
--

CREATE TABLE `ExamDate` (
  `exam_id` INT(11) COLLATE utf8_czech_ci NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `room_code` VARCHAR(5) COLLATE utf8_czech_ci NOT NULL,
  `lecturer_code` VARCHAR(10) COLLATE utf8_czech_ci NOT NULL,
  `course_code` VARCHAR(5) COLLATE utf8_czech_ci NOT NULL,
  `exam_start_date` DATETIME COLLATE utf8_czech_ci NOT NULL,
  `exam_end_date` DATETIME COLLATE utf8_czech_ci NOT NULL,
  `max_participants` smallint(6) COLLATE utf8_czech_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_czech_ci  NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;


--
-- Structure of relation `ExamRoom`
--

CREATE TABLE `ExamRoom` (
  `room_code` varchar(5) COLLATE utf8_czech_ci NOT NULL PRIMARY KEY,
  `description` varchar(30) COLLATE utf8_czech_ci NOT NULL,
  `capacity` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;

-- ----------------------------------------------------------
-- Structure of relation `ExamResult`
--

CREATE TABLE `ExamResult` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `description` varchar(20) COLLATE utf8_czech_ci NOT NULL,
  `type` varchar(2) COLLATE utf8_czech_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
-- --------------------------------------------------------

--
-- Structure of relation `ActiveExam`
--

CREATE TABLE `ScheduledExam` (
  `exam_id` int(11) NOT NULL,
  `student_code` varchar(10) COLLATE utf8_czech_ci NOT NULL,
  `result_id` smallint(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_czech_ci;
