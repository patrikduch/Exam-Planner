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
       //$resultSet = $this->database->fetch('CALL pr_get_student(?)', $userId);

       $resultSet = $this->database->table('Student')
           ->where('user_id', $userId)
           ->fetch();

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
     */
    public function examSignout(int $examId, bool $isActive, string $studentCode)
    {
        if (!$isActive) {

            $this->database->beginTransaction();

            $examDateEntity = $this->getExam($examId);

            $this->database->query('UPDATE ExamDate SET', [
                'max_participants' => $examDateEntity->max_participants -1,
            ], 'WHERE exam_id = ?', $examId);


            $this->database->table('ScheduledExam')->insert([
                'exam_id' => $examId,
                'student_code' => $studentCode,
                'result_id' => NULL,
            ]);

            $this->database->commit();

        } else {

            $this->database->beginTransaction();

            $examDateEntity = $this->getExam($examId);

            $this->database->query('UPDATE ExamDate SET', [
                'max_participants' => $examDateEntity->max_participants +1,
            ], 'WHERE exam_id = ?', $examId);

            $this->database->query('DELETE FROM ScheduledExam 
                                    WHERE exam_id = ? AND student_code = ?',
                                    $examId, $studentCode);

            $this->database->commit();
        }
    }

    /**
     * Fetch exam by its identifier (Primary key of ExamDate entity).
     * @param int $examId Primary key of ExamDate entity.
     */
    public function getExam(int $examId)
    {
        $examDateEntity = $this->database->table('ExamDate')
            ->where('exam_id', $examId)
            ->fetch();

        return $examDateEntity;
    }
}


