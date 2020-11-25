<?php

namespace  App\Infrastructure\Repositories;

use App\Core\Interfaces\Repositories\ILecturerRepository;
use Nette;

/**
 * Class LecturerRepository
 * @package App\Infrastructure\Repositories
 */
class LecturerRepository implements ILecturerRepository {

    /**
     * @var Nette\Database\Context  $database  Instance of Nette database.
     */
    private $database;

    /**
     * LecturerRepository constructor.
     * @param Nette\Database\Context $database
     */
    public function __construct(Nette\Database\Context $database)
    {
        $this->database = $database;
    }

    /**
     * Fetch single lecturer entity by numeric identifier.
     * @param int $id
     */
    public function getLecturer(int $id)
    {
        $resultSet = $this->database->fetch(
            'SELECT lecturer_code, first_name, surname FROM Lecturer WHERE user_id = ?', $id
        );

        return $resultSet;
    }

    /**
     * Fetch lecturer courses by lecturer code that identifies particular lecturer.
     * @param string $lecturerCode Code lecturer identifier.
     */
    public function getLecturerCourses(string $lecturerCode)
    {
        $resultSet = $this->database->query('SELECT LC.course_code, title, credits, lecture_hours, practice_hours, classification, annotation
                    FROM LecturerCourse LC 
                    JOIN Course C ON LC.course_code = C.course_code
                    WHERE lecturer_code  = ?', $lecturerCode);

        return $resultSet;
    }



    /**
     * Fetch all pre degrees for the selected lecturer.
     * @param string $lecturerCode
     * @return Nette\Database\ResultSet
     */
    public function getLecturerPreDegrees(string $lecturerCode)
    {
        $preDegreesSet = $this->database->query(
            "SELECT name FROM Degree D 
                JOIN  LecturerDegree LD  ON LD.pre_degree_id = D.id
                WHERE LD.lecturer_code=?", $lecturerCode);


        return $preDegreesSet;
    }

    /**
     * Fetch all post degrees fro the selected lecturer.
     * @param string $lecturerCode
     * @return Nette\Database\ResultSet
     */
    public function getLecturerPostDegrees(string $lecturerCode)
    {
        $postDegreesSet = $this->database->query(
            "SELECT name FROM Degree D 
                JOIN  LecturerDegree LD  ON LD.post_degree_id = D.id
                WHERE LD.lecturer_code=?", $lecturerCode);

        return $postDegreesSet;
    }

    /**
     * Fetch all active exams for the selected lecturer.
     * @param string $lecturerCode
     */
    public function getActiveExams(string $lecturerCode)
    {
        $activeExams = $this->database->query('SELECT E.room_code, E.lecturer_code, E.course_code, E.exam_date, E.max_participants,
        E.note, C.title AS course_title
        FROM ExamDate E 
        JOIN Course C ON C.course_code = E.course_code
        WHERE E.lecturer_code = ?;', $lecturerCode);

        return $activeExams;
    }

    /**
     * Fetch scheduled (ended) exams for the selected lecturer.
     * @param string $lecturerCode
     */
    public function getScheduledExams(string $lecturerCode)
    {
        $scheduledExams = $this->database->query('
        SELECT ED.course_code, ED.room_code, ED.note, ED.exam_date 
        FROM ScheduledExam SE
        JOIN ExamDate ED ON ED.exam_id = SE.exam_id
        AND ED.lecturer_code = ? AND ED.exam_id NOT IN (SELECT id FROM ExamResult);', $lecturerCode);

        return $scheduledExams;
    }
}