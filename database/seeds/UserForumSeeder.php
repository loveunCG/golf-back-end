<?php

use Illuminate\Database\Seeder;

class UserForumSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Forum::insert([
            1 => array(
                'id' => 1,
                'user_id' => 1,
                'title' => 'asdf',
                'content' => 'asdfasdf asdf',
                'type' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        2 => array(
	            'id' => 2,
                'user_id' => 1,
                'title' => 'asdfas',
                'content' => 'asdfsdf', 
                'type' => 'academy',
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        3 => array(
	            'id' => 3,
                'user_id' => 1,
                'title' => 'asdf',
                'content' => 'aaa aaa', 
                'type' => 'academy',
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        4 => array(
	            'id' => 4,
                'user_id' => 1,
                'title' => 'asdf',
                'content' => 'aaa aaa', 
                'type' => 'academy',
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        5 => array(
	            'id' => 5,
                'user_id' => 1,
                'title' => 'asdfas',
                'content' => 'asd asdf', 
                'type' => 'academy',
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        6 => array(
	            'id' => 6,
                'user_id' => 1,
                'title' => 'asdfas',
                'content' => 'asd asdf', 
                'type' => 'academy',
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            )
        ]);
    }
}
