<?php

namespace App\Components\App\Lecturer;

use Nette\Application\UI\Control;

/**
 * Class LecturerControl
 * @package App\Components\App\Lecturer
 */
final class LecturerControl extends Control {

    /**
     * Renders content for lecturer users.
     */
    public function render() {
        $this->template->render(__DIR__ . '/LecturerControl.latte');
    }

}