<?php

namespace App\Components\Shared\Skeleton\Header;

use App\Repositories\ProjectDetailRepository;

final class HeaderControlFactory {

    /** @var ProjectDetailRepository $projectDetailRepository */
    private $projectDetailRepository;

    /**
     * HeaderControlFactory constructor.
     * @param ProjectDetailRepository $projectDetailRepository
     */
    public function __construct(ProjectDetailRepository  $projectDetailRepository) {
        $this->projectDetailRepository = $projectDetailRepository;
    }

    /**
     * Create instance of  Header control component.
     * @return HeaderControl Instance of Header control.
     */
    public function create() {
        $headerControl = new HeaderControl($this->projectDetailRepository);
        return $headerControl;
    }

}