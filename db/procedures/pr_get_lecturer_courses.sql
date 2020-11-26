DELIMITER $$
CREATE PROCEDURE get_lecturer_courses (IN lecturerCode VARCHAR(60))
BEGIN
	SELECT LC.course_code, title, credits, lecture_hours, practice_hours, classification, annotation
    FROM LecturerCourse LC
    JOIN Course C ON LC.course_code = C.course_code
    WHERE lecturer_code = lecturerCode;
END$$