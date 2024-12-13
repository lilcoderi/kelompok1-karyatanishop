<?php

namespace App\Observers;

use App\Models\Order;
use App\Mail\OrderCompletedNotification;
use Illuminate\Support\Facades\Mail;

class OrderObserver
{
    public function updated(Order $order)
    {
        if ($order->status_order === 'selesai' && $order->isDirty('status_order')) {

            $user = $order->user;
            Mail::to($user->email)->send(new OrderCompletedNotification($order));
        }
    }
}
