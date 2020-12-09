<?php

namespace  App\Infrastructure\Repositories;

use App\Core\Interfaces\Repositories\ILecturerRepository;
use App\Dtos\ExamDateCreateRequest;
use App\Dtos\ExamDateUpdateRequest;
use Nette;

/**
 * Class LecturerRepository
 * @package App\Infrastructure\Repositories
 */
final class LecturerRepository implements ILecturerRepository {

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
        $resultSet = $this->database->table('Lecturer')
            ->where('user_id',$id)
            ->fetch();

        return $resultSet;
    }

    /**
     * Fetch lecturer courses by lecturer code that identifies particular lecturer.
     * @param string $lecturerCode Code lecturer identifier.
     */
    public function getLecturerCourses(string $lecturerCode)
    {
        $resultSet = $this->database->fetchAll('CALL get_lecturer_courses(?)', $lecturerCode);
        return $resultSet;
    }

    /**
     * Fetch all pre degrees for the selected lecturer.
     * @param string $lecturerCode
     * @return Nette\Database\ResultSet
     */
    public function getLecturerPreDegrees(string $lecturerCode)
    {
        $preDegreesSet = $this->database->fetchAll("CALL pr_get_lecturer_pre_degrees(?)", $lecturerCode);
        return $preDegreesSet;
    }

    /**
     * Fetch all post degrees fro the selected lecturer.
     * @param string $lecturerCode
     * @return Nette\Database\ResultSet
     */
    public function getLecturerPostDegrees(string $lecturerCode)
    {
        $postDegreesSet = $this->database->fetchAll(
            'CALL pr_get_lecturer_post_degrees(?)', $lecturerCode
        );
        return $postDegreesSet;
    }

    /**
     * Fetch all active exams for the selected lecturer.
     * @param string $lecturerCode
     */
    public function getActiveExams(string $lecturerCode)
    {
        $activeExams = $this->database->fetchAll(
            'CALL pr_get_lecturer_exams(?,?)', $lecturerCode, true
        );
        return $activeExams;
    }

    /**
     * Fetch scheduled (ended) exams for the selected lecturer.
     * @param string $lecturerCode
     */
    public function getScheduledExams(string $lecturerCode)
    {
        $scheduledExams = $this->database->fetchAll(
            'CALL pr_get_lecturer_exams(?,?)', $lecturerCode, false
        );
        return $scheduledExams;
    }

    /**
     * Fetch all lecturer rooms for new exam.
     * @return array
     */
    public function getLecturerRooms()
    {
        $getLecturerRooms = $this->database->table('ExamRoom')
            ->fetchAll();

        return $getLecturerRooms;
    }


    /**
     * Create new exam date based on passed ExamDateCreateRequest DTO properties.
     * @param ExamDateCreateRequest $examDto
     * @return array|bool|int|iterable|Nette\Database\Table\ActiveRow|Nette\Database\Table\Selection|\Traversable
     */
    public function addNewExam(ExamDateCreateRequest $examDto)
    {
        $row = $this->database->table('ExamDate')->insert([
            'room_code' => $examDto->getRoomCode(),
            'lecturer_code' => $examDto->getLecturerCode(),
            'course_code' => $examDto->getCourseCode(),
            'exam_start_date' => $examDto->getExamStartDate(),
            'exam_end_date' => $examDto->getExamEndDate(),
            'max_participants' => $examDto->getMaxParticipants(),
            'note' => $examDto->getNote()
        ]);

        return $row;
    }

    /**
     * Delete created active exam, that can be attended by limited number of participants.
     * @param int $examId Identifier of particular exam.
     */
    public function deleteExam(int $examId)
    {
        $this->database->beginTransaction();
        $this->database->query('DELETE FROM ScheduledExam WHERE exam_id = ?', $examId);
        $this->database->query('DELETE FROM ExamDate WHERE exam_id = ?', $examId);
        $this->database->commit();
    }

    /**
     * Fetch exam detail based on exam identifier.
     * @param int $examId Numeric identifier of ExamDate entity.
     */
    public function getExamDetail(int $examId)
    {
       $resultSet =  $this->database->table('ExamDate')
           ->where('exam_id', $examId)
           ->fetch();
       return $resultSet;
    }



    /**
     * Fetch all students for exam assigment.
     * @param string $courseCode
     * @param int $examId
     */
    public function getStudentAssignmentList(string $courseCode, int $examId)
    {
       $resultSet =  $this->database->fetchAll('CALL pr_get_students_assignment_list(?,?)', $courseCode, $examId);
       return $resultSet;
    }

    /**
     * Edit chosen exam.
     * @param ExamDateUpdateRequest $dto
     */
    public function editExam(ExamDateUpdateRequest $dto)
    {

        $this->database->beginTransaction();

        $result = $this->database->query('UPDATE ExamDate SET', [
            'room_code' => $dto->getRoomCode(),
            'lecturer_code' => $dto->getLecturerCode(),
            'course_code' => $dto->getCourseCode(),
            'exam_start_date' => $dto->getExamStartDate(),
            'exam_end_date' => $dto->getExamEndDate(),
            'max_participants' => $dto->getMaxParticipants(),
            'note' => $dto->getNote()
        ], 'WHERE exam_id = ?', $dto->getExamId());

        $this->database->commit();

        return $result;
    }
}