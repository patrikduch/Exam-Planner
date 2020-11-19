<?php

namespace App\Components\Shared\Skeleton\Header;

use App\Repositories\ProjectDetailRepository;
use Nette\Application\UI\Control;

/**
 * Class HeaderControl encapsulates all heading functionality (navbar etc.).
 * @package App\Components\Shared\Skeleton\Header
 */
final class HeaderControl extends Control {

    /** @var ProjectDetailRepository $projectDetailRepository */
    private $projectDetailRepository;

    /**
     * HeaderControl constructor.
     * @param ProjectDetailRepository $projectDetailRepository
     */
    public function __construct(ProjectDetailRepository  $projectDetailRepository) {
        $this->projectDetailRepository = $projectDetailRepository;
    }

    /**
     * Renders the heading of the webpage.
     */
    public function render() {

        $this->template->projectDetail = $this->projectDetailRepository->getProjectName();
        $this->template->render(__DIR__ . '/HeaderControl.latte');
    }

}