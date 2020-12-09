DELIMITER $$
CREATE PROCEDURE pr_get_lecturer_exams (IN lecturerCode VARCHAR(60), IN onlyActiveItems BOOLEAN)
BEGIN
	  IF onlyActiveItems THEN
   		SELECT EX.exam_id, EX.room_code, EX.lecturer_code, EX.course_code, C.title, EX.exam_start_date, EX.exam_end_date,
	  		EX.max_participants, EX.note
	  		FROM ExamDate EX
	  		JOIN Course C
	  			ON C.course_code = EX.course_code
	  		WHERE EX.exam_start_date > CURDATE() AND EX.lecturer_code = lecturerCode;
	  ELSE
     		SELECT EX.exam_id, EX.room_code, EX.lecturer_code, C.course_code, C.title, EX.exam_start_date, EX.exam_end_date,
	  		EX.max_participants, EX.note
	  		FROM ExamDate EX
	  		JOIN Course C
	  			ON C.course_code = EX.course_code
	  		WHERE EX.exam_start_date < CURDATE() AND EX.lecturer_code = lecturerCode;
	  END IF;
END$$