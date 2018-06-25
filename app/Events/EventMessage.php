<?php

namespace App\Events;

use App\Events\Event;
use Illuminate\Queue\SerializesModels;
// use Illuminate\Foundation\Events\Dispatchable;
// use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class EventMessage implements ShouldBroadcast
{
    use SerializesModels;
    public $data;
    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        //
        $this->data = $data;
    }

    /**
     * Get the channels the event should be broadcast on.
     *
     * @return array
     */
    public function broadcastOn()
    {
        return ['message-channel'];
    }
}
