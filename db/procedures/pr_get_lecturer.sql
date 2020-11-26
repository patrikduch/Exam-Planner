DELIMITER $$
CREATE PROCEDURE get_lecturer (IN lecturerID INT)
BEGIN
	SELECT lecturer_code, first_name, surname
	FROM Lecturer
	WHERE user_id = lecturerId;
END$$

