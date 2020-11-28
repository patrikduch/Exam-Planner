<?php

namespace  App\Components\App\Student;

use App\Repositories\StudentRepository;
use Nette\Application\UI\Control;
use Nette\Security\User;

/**
 * Class StudentControl
 * @package App\Components\App\Student
 */
final class StudentControl extends  Control {

    /**
     * @var StudentRepository $studentRepository Student data repository.
     */
    public $studentRepository;

    /**
     * @var User $user User instance to access user information.
     */
    public $user;

    /**
     * StudentControlFactory constructor.
     * @param StudentRepository $studentRepository Student data repository.
     * @param User $user Instance of currently authenticated user.
     */
    public function __construct(StudentRepository  $studentRepository, User $user) {
        $this->studentRepository = $studentRepository;
        $this->user = $user;
    }

    public function handleChangeFoo($examId, $studentCode) {
        $this->studentRepository->examSignout($examId, $studentCode);
    }


    /**
     * Renders content for student users.
     */
    public function render() {
        $studentDetail = $this->studentRepository->getStudentDetails($this->user->id);
        $this->template->studentDetail = $studentDetail;

        $this->template->allExams = $this->studentRepository->getStudentExamList($studentDetail->student_code);
        $this->template->activeExams = $this->studentRepository
            ->getActiveStudentExams(($studentDetail->student_code));

        $this->template->render(__DIR__ . '/StudentControl.latte');
    }

}