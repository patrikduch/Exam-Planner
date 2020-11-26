DELIMITER $$
CREATE PROCEDURE pr_get_finished_exams (IN lecturerCode VARCHAR(60))
BEGIN
	  SELECT ED.course_code, ED.room_code, ED.note, ED.exam_date
     FROM ScheduledExam SE
     JOIN ExamDate ED ON ED.exam_id = SE.exam_id
       AND ED.lecturer_code = lecturerCode AND ED.exam_id NOT IN (SELECT id FROM ExamResult);
END$$
