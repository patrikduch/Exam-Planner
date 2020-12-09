/* Custom edit by Patrik Duch */

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


