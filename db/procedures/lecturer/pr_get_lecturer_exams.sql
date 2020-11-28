DELIMITER $$
CREATE PROCEDURE pr_get_lecturer_exams (IN lecturerCode VARCHAR(60), IN onlyActiveItems BOOLEAN)
BEGIN

	  IF onlyActiveItems THEN
   		SELECT exam_id, room_code, lecturer_code, course_code, exam_start_date, exam_end_date
	  		max_participants, note
	  		FROM ExamDate
	  		WHERE exam_date > CURDATE() AND lecturer_code = lecturerCode;
	  ELSE
     		SELECT exam_id, room_code, lecturer_code, course_code, exam_start_date, exam_end_date,
	  		max_participants, note
	  		FROM ExamDate
	  		WHERE exam_date < CURDATE() AND lecturer_code = lecturerCode;
	  END IF;


END$$