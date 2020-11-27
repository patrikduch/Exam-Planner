DELIMITER $$
CREATE PROCEDURE pr_get_student_list_exams (IN p_studentCode VARCHAR(25))
BEGIN

		
	SELECT EX.exam_id, SC.student_code, C.title AS course_title, C.credits AS course_credits, EX.course_code, EX.exam_date, EX.room_code,
	CASE
    WHEN exam_id = (SELECT ED.exam_id FROM ExamDate ED WHERE ED.exam_id NOT IN (
	 	SELECT exam_id FROM ScheduledExam
	 )) 
	 
	 THEN 0
	 ELSE 1
	
    
	END AS is_exam_active
	FROM ExamDate EX
	JOIN Course C 
		ON C.course_code = EX.course_code
	
	JOIN StudentCourse SC
		ON SC.course_code = C.course_code
	
	WHERE SC.student_code = p_studentCode AND EX.exam_date > CURDATE();

	
END$$
