<?php

namespace App\Presenters;

use App\Components\App\Guest\GuestControl;
use App\Components\App\Guest\GuestControlFactory;
use App\Components\App\Lecturer\LecturerAddExamFormControl;
use App\Components\App\Lecturer\LecturerAddExamFormControlFactory;
use App\Components\App\Lecturer\LecturerControl;
use App\Components\App\Lecturer\LecturerControlFactory;
use App\Infrastructure\Repositories\LecturerRepository;
use Contributte\FormsBootstrap\BootstrapForm;
use Contributte\FormsBootstrap\Enums\RenderMode;

/**
 * Class LecturerPresenter
 * @package App\Presenters
 */
final class LecturerPresenter extends BasePresenter {

    /** @var LecturerAddExamFormControlFactory $lecturerAddExamFormControlFactory @inject */
    public $lecturerAddExamFormControlFactory;

    /** @var LecturerControlFactory $lecturerControlFactory @inject */
    public $lecturerControlFactory;

    /** @var LecturerRepository $lecturerRepository @inject */
    public $lecturerRepository;


    /**
     * Renders default view (default.latte).
     */
    public function renderDefault() {

    }

    /**
     * Remove scheduled exam that is not in active mode.
     * @param int $examId
     */
    public function handleRemoveScheduledExam(int $examId) {
        $this->lecturerRepository->deleteExam($examId);
    }

    public function renderAddExam(string $courseCode, string $title) {


        //$this->template->test = dump($this->getHttpRequest()->getQuery());
    }

    protected function createComponentAddNewExamFormControl(): LecturerAddExamFormControl
    {
        return $this->lecturerAddExamFormControlFactory->create($this->user, $this->getHttpRequest());
    }

    protected function createComponentLecturerControl(): LecturerControl
    {
        return $this->lecturerControlFactory->create($this->user, $this->getHttpRequest());
    }

}