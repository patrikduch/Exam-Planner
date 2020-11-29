<?php

namespace App\Components\App\Lecturer;

use App\Helpers\Forms\MyValidator;
use App\Helpers\Forms\MyValidators;
use App\Infrastructure\Repositories\LecturerRepository;
use Contributte\FormsBootstrap\BootstrapForm;
use Contributte\FormsBootstrap\Enums\RenderMode;
use HttpRequest;
use Nette\Application\UI\Control;
use Nette\Http\IRequest;
use Nette\Security\User;



final class LecturerAddExamFormControl extends Control {

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
     * LecturerAddExamFormControl constructor.
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
     * Renders LectureAddExamFormControl component that is responsible for adding new exam dates.
     */
    public function render() {

        $this->template->render(__DIR__ . '/LecturerAddExamFormControl.latte');
    }

    /**
     * Add
     * @return BootstrapForm
     */
    protected function createComponentAddExamForm(): BootstrapForm
    {
        $lecturerEntity = $this->lecturerRepository->getLecturer($this->user->getId());

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
            ->setRequired('Prosím zadejte začátetní termín');


        $thirdRow = $form->addRow();
        $thirdRow->addCell(4)
            ->addDateTime('endDate', 'Konec termínu')
            ->setRequired('Prosím zadejte konec termínu')
            ->addRule(function($control, $args) {
                $dateTimestamp1 = strtotime($args[1]);
                $dateTimestamp2 = strtotime($args[0]->format('Y-m-d H:i:s'));

                return $dateTimestamp1 > $dateTimestamp2;

            }, 'Zkontrolujte rozmezi mezi začátečním a koncovým datem', [
                $form['startDate'],
                $form['endDate']
            ]);

        $fourthRow = $form->addRow();
        $fourthRow->addCell(4)
            ->addSelect('lectureRoom','Místnost',$this->lecturerRepository->getLecturerRooms());

        $fifthRow = $form->addRow();
        $fifthRow->addCell(4)
            ->addText('roomSize',  'Počet míst')
            ->setRequired('Prosím zadejte maximální počet míst pro zadaný termín zkoušky')
            ->addRule($form::INTEGER, 'Počet míst musí být platné číslo');

        $sixthRow = $form->addRow();
        $sixthRow->addCell(4)
            ->addText('note', 'Poznámka')
            ->setRequired('Prosím zadejte poznamku pro zadaný termín');

        $form->addSubmit('send', 'Vytvořit termín');
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
        // tady zpracujeme data odeslaná formulářem
        // $data->name obsahuje jméno
        // $data->password obsahuje heslo

        $lecturerEntity = $this->lecturerRepository->getLecturer($this->user->getId());

        $this->lecturerRepository->addNewExam(
            $data->lectureRoom,
            $lecturerEntity->lecturer_code,
            $this->httpRequest->getQuery("courseCode"),
            $data->startDate->format('Y-m-d H:i:s'),
            $data->endDate->format('Y-m-d H:i:s'),
            $data->roomSize,
            $data->note
        );





        $this->flashMessage('Nový termín byl úspěšně přidán.');
        //$this->redirect('Lecturer:default');

        $this->getPresenter()->redirect('Lecturer:default');
    }


}

