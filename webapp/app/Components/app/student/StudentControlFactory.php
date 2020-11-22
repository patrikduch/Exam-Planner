<?php

namespace  App\Components\App\Student;

use App\Repositories\StudentRepository;
use Nette\Security\User;

/**
 * Class StudentControlFactory
 * @package App\Components\App\Student
 */
final class StudentControlFactory {

    /**
     * @var StudentRepository $studentRepository Student data repository.
     */
    private $studentRepository;

    /**
     * StudentControlFactory constructor.
     * @param StudentRepository $studentRepository Student data repository.
     */
    public function __construct(StudentRepository $studentRepository) {
        $this->studentRepository = $studentRepository;
    }

    /**
     * Create instance of StudentControl component.
     * @param User $user Instance of currently authenticated user.
     * @return StudentControl Instance of StudentControl.
     */
    public function create(User $user) {
        $studentControl = new StudentControl($this->studentRepository, $user);
        return $studentControl;
    }

}