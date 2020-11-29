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
       $resultSet = $this->database->fetch('CALL pr_get_student(?)', $userId);

       return $resultSet;
    }

    /**
     * Fetch currently logged active student exams.
     * @param string $studentCode
     * @return array
     */
    public function getActiveStudentExams(string $studentCode)
    {
        $resultSet = $this->database->fetchAll('CALL pr_get_active_student_list_exams(?)', $studentCode);
        return $resultSet;
    }

    /**
     * Fetch active and nonactive exam items for specific student code.
     * @param string $studentCode
     * @return array
     */
    public function getStudentExamList(string $studentCode)
    {
        $resultSet = $this->database->fetchAll('CALL pr_get_student_list_exams(?)', $studentCode);
        return $resultSet;
    }

    /**
     * Sign in or signout of particular exam.
     * @param int $examId
     * @param bool $isActive
     * @param string $studentCode
     * @return array|bool|int|iterable|Nette\Database\Table\ActiveRow|Nette\Database\Table\Selection|\Traversable
     */
    public function examSignout(int $examId, bool $isActive, string $studentCode)
    {
        if (!$isActive) {
            return $this->database->table('ScheduledExam')->insert([
                'exam_id' => $examId,
                'student_code' => $studentCode,
                'result_id' => NULL,
            ]);
        } else {
            return $this->database->table('ScheduledExam')
                ->where('exam_id', $examId)
                ->delete();
        }
    }
}


