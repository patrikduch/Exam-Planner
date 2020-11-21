<?php

namespace App\Components\App\Lecturer;

final class LecturerControlFactory {
    public function create() {

        $lecturerControl = new LecturerControl();
        return $lecturerControl;
    }
}