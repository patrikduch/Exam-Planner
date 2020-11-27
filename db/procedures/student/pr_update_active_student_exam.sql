
DELIMITER $$
CREATE PROCEDURE pr_update_active_student_exam (IN p_exam_id INT)
BEGIN

	DECLARE v_exam_id INT DEFAULT 0;

	SELECT exam_id INTO v_exam_id FROM ScheduledExam WHERE exam_id = p_exam_id;

	IF v_exam_id > 0 THEN
		DELETE FROM ScheduledExam WHERE exam_id = p_exam_id;
	ELSE
		INSERT INTO ScheduledExam (exam_id, student_code, result_id) VALUES (4, 'duc0016', NULL);
	END IF;

	COMMIT;

END$$



