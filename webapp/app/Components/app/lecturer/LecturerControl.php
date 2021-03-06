<?php

namespace App\Components\App\Lecturer;

use App\Infrastructure\Repositories\LecturerRepository;
use Nette\Application\UI\Control;
use Nette\Http\IRequest;
use Nette\Security\User;

/**
 * Class LecturerControl
 * @package App\Components\App\Lecturer
 */
final class LecturerControl extends Control {

    /**
     * @var LecturerRepository $lectureRepository;
     */
    private $lectureRepository;

    /**
     * @var User $user
     */
    private $user;

    /**
     * LecturerControl constructor.
     * @param User $user
     * @param LecturerRepository $lecturerRepository
     */
    public function __construct(User $user, LecturerRepository  $lecturerRepository, IRequest  $request) {
        $this->lectureRepository = $lecturerRepository;
        $this->user = $user;
    }

    /**
     * Renders content for lecturer users.
     */
    public function render() {

        $lecturerDetails = $this->lectureRepository->getLecturer($this->user->getId());
        $this->template->lecturerDetails = $lecturerDetails;


        $this->template->lecturerPreDegrees = $this->lectureRepository->getLecturerPreDegrees(
            $lecturerDetails->lecturer_code
        );
        $this->template->lecturerPostDegrees = $this->lectureRepository->getLecturerPostDegrees(
            $lecturerDetails->lecturer_code
        );

        $this->template->lecturerExams = $this->lectureRepository->getActiveExams(
            $lecturerDetails->lecturer_code
        );

        $this->template->lecturerScheduledExams = $this->lectureRepository->getScheduledExams(
            $lecturerDetails->lecturer_code
        );


        $this->template->courses = $this->lectureRepository->getLecturerCourses($lecturerDetails->lecturer_code);

        $this->template->render(__DIR__ . '/LecturerControl.latte');
    }

}