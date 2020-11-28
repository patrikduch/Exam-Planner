<?php

namespace App\Components\App\Lecturer;

use App\Infrastructure\Repositories\LecturerRepository;
use Nette\Http\IRequest;
use Nette\Security\User;

/**
 * Class LecturerControlFactory
 * @package App\Components\App\Lecturer
 */
final class LecturerControlFactory {

    /**
     * @var LecturerRepository $lecturerRepository
     */
    private $lecturerRepository;

    /**
     * LecturerControlFactory constructor.
     * @param LecturerRepository $lecturerRepository
     */
    public function __construct(LecturerRepository  $lecturerRepository) {
        $this->lecturerRepository = $lecturerRepository;
    }


    /**
     * @param User $user
     * @return LecturerControl
     */
    public function create(User $user, IRequest $request) {
        $lecturerControl = new LecturerControl($user, $this->lecturerRepository, $request);
        return $lecturerControl;
    }
}