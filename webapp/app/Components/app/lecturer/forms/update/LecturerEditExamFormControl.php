<?php

namespace App\Components\App\Lecturer\Forms\Update;

use App\Dtos\ExamDateUpdateRequest;
use App\Infrastructure\Repositories\LecturerRepository;
use Contributte\FormsBootstrap\BootstrapForm;
use Contributte\FormsBootstrap\Enums\RenderMode;
use Nette\Application\UI\Control;
use Nette\Http\IRequest;
use Nette\Security\User;

/**
 * Class LecturerEditExamFormControl
 * @package App\Components\App\Lecturer\Forms\Update
 */
final class LecturerEditExamFormControl extends Control {

    /** @var LecturerRepository $lectureRepository */
    private  $lecturerRepository;

    /**
     * @var IRequest $httpRequest
     */
    public $httpRequest;

    /**
     * @var User $user
     */
    private $user;


    /**
     * LecturerEditExamFormControl constructor.
     * @param User $user
     * @param LecturerRepository $lecturerRepository
     * @param IRequest $request
     */
    public function __construct(User $user, LecturerRepository  $lecturerRepository, IRequest $request)
    {
        $this->user = $user;
        $this->httpRequest = $request;
        $this->lecturerRepository = $lecturerRepository;
    }

    /**
     * Renders edit form for editing loaded exam detail.
     */
    public function render() {

        $this->template->exam_id = $this->httpRequest->getQuery("exam_id");

        $this->template->render(__DIR__ . '/LecturerEditExamFormControl.latte');
    }


    /**
     * Add
     * @return BootstrapForm
     */
    protected function createComponentEditExamForm(): BootstrapForm
    {
        $lecturerEntity = $this->lecturerRepository->getLecturer($this->user->getId());
        $examDetail = $this->lecturerRepository->getExamDetail($this->httpRequest->getQuery("exam_id"));

        $form = new BootstrapForm;
        $form->renderMode = RenderMode::VERTICAL_MODE;
        $row = $form->addRow();
        $row->addCell(4)
            ->addPassword('examName', 'Název předmětu')
            ->setRequired('Prosím zadejte název předmětu.')
            ->setPlaceholder($this->httpRequest->getQuery("title"))
            ->setDisabled(true);

        $firstRow = $form->addRow();
        $firstRow->addCell(4)
            ->addPassword('courseCode', 'Zkratka předmětu')
            ->setRequired('Prosím zadejte zkraktu předmětu.')
            ->setPlaceholder($this->httpRequest->getQuery("courseCode"))
            ->setDisabled(true);

        $firstRow->addCell(4)
            ->addText('lecturerCode', 'Kod vyučujícího')
            ->setRequired('Prosím zadejte kód vyučujícího.')
            ->setPlaceholder($lecturerEntity->lecturer_code)
            ->setDisabled(true);


        $secondRow= $form->addRow();
        $secondRow->addCell(4)
            ->addDateTime('startDate', 'Začátek termínu')
            ->setRequired('Prosím zadejte začátetní termín')
            ->setDefaultValue($examDetail->exam_start_date);


        $thirdRow = $form->addRow();
        $thirdRow->addCell(4)
            ->addDateTime('endDate', 'Konec termínu')
            ->setRequired('Prosím zadejte konec termínu')
            ->setDefaultValue($examDetail->exam_end_date);

        $fourthRow = $form->addRow();
        $fourthRow->addCell(4)
            ->addSelect('lectureRoom','Místnost',$this->lecturerRepository->getLecturerRooms())
            ->setDefaultValue($examDetail->room_code);

        $fifthRow = $form->addRow();
        $fifthRow->addCell(4)
            ->addText('roomSize',  'Počet míst')
            ->setRequired('Prosím zadejte maximální počet míst pro zadaný termín zkoušky')
            ->addRule($form::INTEGER, 'Počet míst musí být platné číslo')
            ->setDefaultValue($examDetail->max_participants);

        $sixthRow = $form->addRow();
        $sixthRow->addCell(4)
            ->addText('note', 'Poznámka')
            ->setRequired('Prosím zadejte poznamku pro zadaný termín')
            ->setDefaultValue($examDetail->note);

        $form->addSubmit('send', 'Upravit');
        $form->onSuccess[] = [$this, 'formSucceeded'];
        return $form;
    }


    /**
     * Process
     * @param BootstrapForm $form
     * @param $data
     * @throws \Nette\Application\AbortException
     */
    public function formSucceeded(BootstrapForm $form, $data): void
    {

        // 1. Fetch lecturer entity for access to lecturerCode
        $lecturerEntity = $this->lecturerRepository->getLecturer($this->user->getId());

        // 2. Creation of DTO for updating current  exam date
        $examDto = new ExamDateUpdateRequest(
            $this->httpRequest->getQuery("exam_id"), $data->lectureRoom,
            $lecturerEntity->lecturer_code, $this->httpRequest->getQuery("courseCode"),
            $data->startDate->format('Y-m-d H:i:s'),
            $data->endDate->format('Y-m-d H:i:s'),
            $data->roomSize,
            $data->note
        );

        // 3. Execute Update command with created ExamDate DTO
        $this->lecturerRepository->editExam($examDto);


        $this->flashMessage('Nový termín byl úspěšně upraven.');
        $this->getPresenter()->redirect('Lecturer:default');
    }
}
