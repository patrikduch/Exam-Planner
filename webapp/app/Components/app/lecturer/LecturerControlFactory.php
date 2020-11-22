<?php

namespace App\Components\App\Lecturer;

/**
 * Class LecturerControlFactory
 * @package App\Components\App\Lecturer
 */
final class LecturerControlFactory {
    /**
     * @return LecturerControl
     */
    public function create() {
        $lecturerControl = new LecturerControl();
        return $lecturerControl;
    }
}