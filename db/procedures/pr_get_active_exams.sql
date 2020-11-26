DELIMITER $$
CREATE PROCEDURE pr_get_active_exams (IN lecturerCode VARCHAR(60))
BEGIN
	SELECT E.room_code, E.lecturer_code, E.course_code, E.exam_date, E.max_participants,
    E.note, C.title AS course_title
    FROM ExamDate E
    JOIN Course C ON C.course_code = E.course_code
    WHERE E.lecturer_code = lecturerCode;
END$$