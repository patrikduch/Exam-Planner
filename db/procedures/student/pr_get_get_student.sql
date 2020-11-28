DELIMITER $$
CREATE PROCEDURE pr_get_student (IN p_user_id INT)
BEGIN
	SELECT *
	FROM Student
	WHERE user_id = p_user_id;
END$$
