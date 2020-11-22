<?php

namespace App\Core\Interfaces\Repositories;

/**
 * Interface ILecturerRepository
 * @package App\Core\Interfaces\Repositories
 */
interface ILecturerRepository {
    public function getLecturer(int $id);
    public function getLecturerCourses(string $lecturerCode);
    public function getLecturerPreDegrees(string $lecturerCode);
    public function getLecturerPostDegrees(string $lecturerCode);
}