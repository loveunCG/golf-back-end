<?php

use Illuminate\Database\Seeder;

class UserMessagesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Message::insert([
            1 => array(
                'id' => 2,
                'sender' => 1,
                'receiver' => 3,
                'message' => 'asdfa',
                'video_uid' => 1,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        2 => array(
	            'id' => 3,
                'sender' => 1,
                'receiver' => 3,
                'message' => 'asdfa',
                'video_uid' => 1,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        3 => array(
	            'id' => 4,
                'sender' => 1,
                'receiver' => 3,
                'message' => 'asdfa',
                'video_uid' => 1,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        4 => array(
	            'id' => 5,
                'sender' => 1,
                'receiver' => 2,
                'message' => 'asdf',
                'video_uid' => 1,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            )
        ]);
    }
}
