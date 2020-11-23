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
}