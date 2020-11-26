<?php

namespace App\Presenters;

use App\Components\App\Guest\GuestControl;
use App\Components\App\Guest\GuestControlFactory;
use App\Components\App\Lecturer\LecturerControl;
use App\Components\App\Lecturer\LecturerControlFactory;
use App\Components\App\Student\StudentControl;
use App\Components\App\Student\StudentControlFactory;

/**
 * Class HomepagePresenter
 * @package App\Presenters
 */
final class HomepagePresenter extends BasePresenter
{

    /** @var GuestControlFactory $guestControlFactory @inject */
    public $guestControlFactory;

    /** @var LecturerControlFactory $lecturerControlFactory @inject */
    public $lecturerControlFactory;

    /** @var StudentControlFactory $studentControlFactory @inject */
    public $studentControlFactory;

    /**
     * Renders default view (default.latte).
     */
    public function renderDefault()
    {
    }

    /**
     * Create Guest component which is used to render warning message to the guest users.
     * @return GuestControl Instance of GuestControl.
     */
    protected function createComponentGuestControl(): GuestControl
    {
        return $this->guestControlFactory->create();
    }

    /**
     * Create Lecturer component which is used to render lecturer area.
     * @return LecturerControl Instance of LecturerControl.
     */
    protected function createComponentLecturerControl(): LecturerControl
    {
        return $this->lecturerControlFactory->create($this->user);
    }

    protected function createComponentStudentControl(): StudentControl
    {
        return $this->studentControlFactory->create($this->user);
    }
}
