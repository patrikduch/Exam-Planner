DELIMITER $$
CREATE PROCEDURE pr_get_students_assignment_list (IN p_course_code VARCHAR(25), IN p_exam_id INT)
BEGIN
	SELECT S.student_code, S.first_name, S.surname
	FROM ScheduledExam SE

	JOIN ExamDate EX
		ON EX.exam_id = SE.exam_id AND EX.course_code = p_course_code

	JOIN Student S
		ON S.student_code = SE.student_code

	WHERE EX.exam_id = p_exam_id;

END$$
