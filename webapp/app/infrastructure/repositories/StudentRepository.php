<?php

namespace App\Repositories;

use App\Core\Interfaces\Repositories\IStudentRepository;
use Nette;

class StudentRepository implements  IStudentRepository {

    /**
     * @var Nette\Database\Context  $database Nette database instance object.
     */
    private $database;

    /**
     * StudentRepository constructor.
     * @param Nette\Database\Context $database
     */
    public function __construct(Nette\Database\Context $database)
    {
        $this->database = $database;
    }

    /**
     * Fetch student details by passed user identifier.
     * @param int $userId user entity key (primary key)
     * @return mixed
     */
    public function getStudentDetails(int $userId)
    {
       $resultSet = $this->database->query(
           'SELECT SC.student_code, S.first_name, S.surname, C.title AS course_title,
           C.credits, C.lecture_hours, C.practice_hours, C.classification, C.annotation
           FROM StudentCourse SC 
           JOIN Student S ON SC.student_code = S.student_code
           JOIN Course C ON SC.course_code = C.course_code
            WHERE S.user_id = (
	            SELECT id  FROM User WHERE id = ?);
	       ', $userId
       );

       return $resultSet;
    }
}


