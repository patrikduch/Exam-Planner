DELIMITER $$
CREATE PROCEDURE pr_get_exam_detail (IN p_exam_id INT)
BEGIN

	SELECT * FROM ExamDate
	WHERE exam_id = p_exam_id;

END$$
