<?php

namespace App\Presenters;

use App\Components\App\Lecturer\Forms\Create\LecturerAddExamFormControl;
use App\Components\App\Lecturer\Forms\Create\LecturerAddExamFormControlFactory;
use App\Components\App\Lecturer\Forms\Update\LecturerEditExamFormControl;
use App\Components\App\Lecturer\Forms\Update\LecturerEditExamFormControlFactory;
use App\Components\App\Lecturer\LecturerControl;
use App\Components\App\Lecturer\LecturerControlFactory;
use App\Infrastructure\Repositories\LecturerRepository;

/**
 * Class LecturerPresenter
 * @package App\Presenters
 */
final class LecturerPresenter extends BasePresenter {

    /** @var LecturerAddExamFormControlFactory $lecturerAddExamFormControlFactory @inject */
    public $lecturerAddExamFormControlFactory;

    /** @var LecturerEditExamFormControlFactory $lectureEditExamFormControlFactory @inject */
    public $lectureEditExamFormControlFactory;

    /** @var LecturerControlFactory $lecturerControlFactory @inject */
    public $lecturerControlFactory;

    /** @var LecturerRepository $lecturerRepository @inject */
    public $lecturerRepository;


    /**
     * Renders default view (default.latte).
     */
    public function renderDefault() {

    }

    public function renderAddExam(string $courseCode, string $title) {
    }

    /**
     * Renders edit form for updating selected exam.
     * @param int $exam_id
     * @param string $courseCode
     * @param string $title
     */
    public function renderEditExam(int $exam_id, string $courseCode, string $title) {

    }


    /**
     * Remove scheduled exam that is not in active mode.
     * @param int $examId
     */
    public function handleRemoveScheduledExam(int $examId) {
        $this->lecturerRepository->deleteExam($examId);

        $this->redirect('Lecturer:default');
    }


    protected function createComponentAddNewExamFormControl():LecturerAddExamFormControl
    {
        return $this->lecturerAddExamFormControlFactory->create($this->user, $this->getHttpRequest());
    }

    protected function createComponentEditExamFormControl():LecturerEditExamFormControl
    {
        return $this->lectureEditExamFormControlFactory->create($this->user, $this->getHttpRequest());
    }

    protected function createComponentLecturerControl(): LecturerControl
    {
        return $this->lecturerControlFactory->create($this->user, $this->getHttpRequest());
    }



}