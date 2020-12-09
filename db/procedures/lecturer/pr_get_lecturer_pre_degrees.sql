DELIMITER $$
CREATE PROCEDURE pr_get_lecturer_pre_degrees (IN lecturerCode VARCHAR(60))
BEGIN
	SELECT name FROM Degree D
    JOIN  LecturerDegree LD  ON LD.pre_degree_id = D.id
    WHERE LD.lecturer_code= lecturerCode;
END$$
