<?php

namespace App\Core\Interfaces\Repositories;

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
    public function addNewExam(string $room_code, string $lecturerCode, string $courseCode, string $examStartDate,
                                string $examEndDate, int $maxParticipants, string $note);

    public function editExam(int $examId, string $room_code, string $lecturerCode, string $courseCode, string $examStartDate,
                             string $examEndDate, int $maxParticipants, string $note);

    public function deleteExam(int $examId);
}