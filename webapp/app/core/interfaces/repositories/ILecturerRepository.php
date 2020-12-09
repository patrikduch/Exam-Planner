<?php

namespace App\Core\Interfaces\Repositories;

use App\Dtos\ExamDateCreateRequest;

/**
 * Interface ILecturerRepository
 * @package App\Core\Interfaces\Repositories
 */
interface ILecturerRepository {
    public function getLecturer(int $id);
    public function getLecturerCourses(string $lecturerCode);
    public function getActiveExams(string $lecturerCode);
    public function getScheduledExams(string $lecturerCode);
    public function getLecturerPreDegrees(string $lecturerCode);
    public function getLecturerPostDegrees(string $lecturerCode);
    public function getLecturerRooms();
    public function getExamDetail(int $examId);
    public function getStudentAssignmentList(string $courseCode, int $examId);

    public function addNewExam(string $room_code, string $lecturerCode, string $courseCode, string $examStartDate,
                                string $examEndDate, int $maxParticipants, string $note);

    public function editExam(ExamDateCreateRequest $dto);

    public function deleteExam(int $examId);
}