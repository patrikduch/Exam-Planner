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

    /** @var StudentControlFactory $studentControlFactory @inject */
    public $studentControlFactory;

    /**
     * Renders default view (default.latte).
     */
    public function renderDefault()
    {
        if ($this->user->isInRole('lecturer')) {
            $this->redirect('Lecturer:default');
        }
    }

    /**
     * Create Guest component which is used to render warning message to the guest users.
     * @return GuestControl Instance of GuestControl.
     */
    protected function createComponentGuestControl(): GuestControl
    {
        return $this->guestControlFactory->create();
    }

    protected function createComponentStudentControl(): StudentControl
    {
        return $this->studentControlFactory->create($this->user);
    }
}
