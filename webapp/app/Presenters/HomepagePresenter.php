<?php

namespace App\Presenters;

use App\Components\App\Guest\GuestControl;
use App\Components\App\Guest\GuestControlFactory;
use App\Components\Shared\Skeleton\Header\HeaderControl;
use App\Repositories\ProjectDetailRepository;
use App\Services\Authenticator;
use Nette;
use App\Presenters\BasePresenter;

/**
 * Class HomepagePresenter
 * @package App\Presenters
 */
final class HomepagePresenter extends BasePresenter
{
    /** @var GuestControlFactory $guestControlFactory @inject */
    public $guestControlFactory;

    /**
     * Renders default view (default.latte).
     */
    public function renderDefault()
    {
    }

    /**
     * Create Guest component which is used to renders warning message to the guest users.
     * @return GuestControl Instance of GuestControl.
     */
    protected function createComponentGuestControl(): GuestControl
    {
        return $this->guestControlFactory->create();
    }
}
