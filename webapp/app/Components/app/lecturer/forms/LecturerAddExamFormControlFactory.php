<?php

namespace App\Components\App\Lecturer;

use App\Infrastructure\Repositories\LecturerRepository;
use HttpRequest;
use Nette\Http\IRequest;
use Nette\Security\User;

final class LecturerAddExamFormControlFactory {

    /**
     * @var HttpRequest $httpRequest
     */
    private $httpRequest;

    /**
     * @var LecturerRepository $lecturerRepository
     */
    private $lecturerRepository;

    /**
     * LecturerAddExamFormControlFactory constructor.
     * @param LecturerRepository $lecturerRepository
     * @param HttpRequest $httpRequest
     */
    public function __construct(LecturerRepository $lecturerRepository) {
        $this->lecturerRepository = $lecturerRepository;

    }

    /**
     * Creation of new instance for LecturerAddExamFormControl component.
     * @param User $user
     * @param IRequest $request
     * @return LecturerAddExamFormControl
     */
    public function create(User $user, IRequest $request) {
        $lecturerAddExamFormControl = new LecturerAddExamFormControl(
            $user,
            $this->lecturerRepository,
            $request
        );
        return $lecturerAddExamFormControl;
    }
}