DELIMITER $$
CREATE PROCEDURE pr_get_student_list_exams (IN p_student_code VARCHAR(25))
BEGIN
	SELECT exam_id, 0 AS is_exam_active, C.course_code, C.credits AS course_credits, C.title AS course_title, EX1.exam_start_date, EX1.exam_end_date
	FROM ExamDate EX1
	JOIN Course C
		ON C.course_code =  EX1.course_code
	JOIN StudentCourse SC
			ON SC.course_code = EX1.course_code AND SC.student_code = p_student_code
	WHERE EX1.exam_id NOT IN (SELECT exam_id FROM ScheduledExam WHERE student_code = p_student_code) AND EX1.exam_start_date > NOW() AND  SC.student_code = p_student_code
	UNION

	SELECT exam_id, 1 AS is_exam_active, C.course_code, C.credits AS course_credits, C.title AS course_title, EX2.exam_start_date, EX2.exam_end_date
	FROM ExamDate EX2
	JOIN Course C
		ON C.course_code =  EX2.course_code
	JOIN StudentCourse SC
			ON SC.course_code = EX2.course_code AND SC.student_code = p_student_code
	WHERE EX2.exam_id IN (SELECT exam_id FROM ScheduledExam WHERE student_code = p_student_code) AND CAST(EX2.exam_end_date AS DATE) > NOW();

END$$
