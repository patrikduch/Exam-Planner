<?php

namespace App\Components\App\Lecturer\Forms\Update;


use App\Components\App\Lecturer\Forms\Create\LecturerAddExamFormControl;
use App\Infrastructure\Repositories\LecturerRepository;
use Nette\Http\IRequest;
use Nette\Security\User;

/**
 * Class LecturerEditExamFormControlFactory
 * @package App\Components\App\Lecturer\Forms\Update
 */
final class LecturerEditExamFormControlFactory {

    /**
     * @var LecturerRepository $lecturerRepository
     */
    private $lecturerRepository;


    /**
     * LecturerEditExamFormControlFactory constructor.
     * @param LecturerRepository $lecturerRepository
     */
    public function __construct(LecturerRepository $lecturerRepository) {
        $this->lecturerRepository = $lecturerRepository;
    }


    /**
     * @param User $user
     * @param IRequest $request
     * @return LecturerEditExamFormControl
     */
    public function create(User $user, IRequest $request) {
        $lecturerEditExamFormControl = new LecturerEditExamFormControl(
            $user,
            $this->lecturerRepository,
            $request
        );
        return $lecturerEditExamFormControl;
    }


}