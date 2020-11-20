<?php

namespace App\Components\App\Guest;

/**
 * Class GuestControlFactory
 * @package App\Components\App\Guest
 */
final class GuestControlFactory {

    /**
     * GuestControlFactory constructor.
     */
    public function __construct() {

    }

    /**
     * Create instance of  Guest control component.
     * @return GuestControl Instance of Guest control.
     */
    public function create() {

        $guestControl = new GuestControl();
        return $guestControl;
    }


}