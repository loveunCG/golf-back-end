<?php

use Illuminate\Database\Seeder;

class VideosSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Video::insert([
            1 => array(
                'id' => 1,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Learn CSS1',
                'url' => 'aaa',
                'skill_id' => 1
            ),
            2 => array(
	            'id' => 2,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Learn CSS 2',
                'url' => 'asdf',
                'skill_id' => 1
            ),
            3 => array(
	            'id' => 3,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Learn CSS 3',
                'url' => 'asdfadsf',
                'skill_id' => 1
            ),
	        4 => array(
	            'id' => 4,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Learn CSS 4',
                'url' => 'adfadf',
                'skill_id' => 1
            ),
	        5 => array(
	            'id' => 5,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Learn CSS 5',
                'url' => 'adsfasdfasdf',
                'skill_id' => 1
            ),
	        6 => array(
	            'id' => 6,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Learn CSS 6',
                'url' => '1324134134',
                'skill_id' => 1
            )

        ]);
    }
}
