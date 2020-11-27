<?php

namespace App\Core\Interfaces\Repositories;

/**
 * Interface IStudentRepository implements Student class based entity.
 * @package App\Core\Interfaces\Repositories
 */
interface IStudentRepository {
    public function getStudentDetails(int $userId);
    public function getStudentExamList(string $studentCode);
    public function getActiveStudentExams(string $studentCode);
    public function submitToExam(int $userId);
    public function examSignout(int $examId);
}

