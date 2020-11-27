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
       $resultSet = $this->database->table('Student')
           ->fetch('SELECT * FROM Student WHERE userId = ?', $userId);

       return $resultSet;
    }

    /**
     * Submit to currently active exams.
     * @param int $userId User identifier of targeted student.
     */
    public function submitToExam(int $userId)
    {
        // TODO: Implement submitToExam() method.
    }

    /**
     * Fetch currently logged active student exams.
     * @param string $studentCode
     * @return array
     */
    public function getActiveStudentExams(string $studentCode)
    {
        $resultSet = $this->database->fetchAll('CALL pr_get_student_list_exams(?)', $studentCode);
        return $resultSet;
    }
}


