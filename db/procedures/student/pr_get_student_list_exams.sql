DELIMITER $$
CREATE PROCEDURE pr_get_student_list_exams (IN p_studentCode VARCHAR(25))
BEGIN
	SELECT exam_id, 0 AS is_exam_active, C.course_code, C.credits AS course_credits, C.title AS course_title, EX.exam_date
	FROM ExamDate EX
	JOIN Course C
		ON C.course_code =  EX.course_code
	WHERE EX.exam_id NOT IN (SELECT exam_id FROM ScheduledExam) AND EX.exam_date > CURDATE()

	UNION

	SELECT exam_id, 1 AS is_exam_active, C.course_code, C.credits AS course_credits, C.title AS course_title, EX.exam_date
	FROM ExamDate EX
	JOIN Course C
		ON C.course_code =  EX.course_code
	WHERE EX.exam_id IN (SELECT exam_id FROM ScheduledExam) AND EX.exam_date > CURDATE();

END$$

