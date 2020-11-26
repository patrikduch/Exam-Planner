DELIMITER $$
CREATE PROCEDURE pr_get_lecturer_post_degrees(IN lecturerCode VARCHAR(60))
BEGIN
	 SELECT name FROM Degree D
    JOIN  LecturerDegree LD  ON LD.post_degree_id = D.id
    WHERE LD.lecturer_code = lecturerCode;
END$$
