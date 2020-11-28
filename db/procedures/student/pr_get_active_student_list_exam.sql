DELIMITER $$
CREATE PROCEDURE pr_get_active_student_list_exams (IN p_student_code VARCHAR(25))
BEGIN
		SELECT EX.exam_id, SC.student_code, EX.room_code, EX.lecturer_code, EX.course_code, EX.exam_start_date, EX.exam_end_date, C.title AS course_title,
		C.credits AS course_credits  FROM ExamDate EX
		JOIN Course C
			ON C.course_code = EX.course_code
		JOIN StudentCourse SC
			ON SC.course_code = EX.course_code

		WHERE exam_start_date >= NOW() AND exam_end_date <= NOW() OR NOW() < exam_start_date AND  exam_id IN (
			SELECT exam_id FROM ScheduledExam
			WHERE student_code = p_student_code
		) AND SC.student_code = p_student_code;
END$$
