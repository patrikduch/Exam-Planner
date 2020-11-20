<?php

namespace App\Components\App\Guest;

use Nette\Application\UI\Control;

/**
 * Class GuestControl adding functionality for rendering content for guest users.
 * @package App\Components\App\Guest
 */
final class GuestControl extends  Control {

    /**
     * Render template markup for guest users.
     */
    public function render() {
        $this->template->render(__DIR__ . '/GuestControl.latte');
    }
}