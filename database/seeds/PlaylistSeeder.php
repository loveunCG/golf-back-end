<?php

use Illuminate\Database\Seeder;

class PlaylistSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Playlists::insert([
            1 => array(
                'id' => 1,
                'user_id' => 1,
                'name' => 'asdfasd',
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        2 => array(
	            'id' => 2,
                'user_id' => 1,
                'name' => 'adfasdf',
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        3 => array(
	            'id' => 3,
                'user_id' => 1,
                'name' => 'asdfasdf',
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        4 => array(
	            'id' => 4,
                'user_id' => 1,
                'name' => 'asdfas',
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        5 => array(
	            'id' => 5,
                'user_id' => 1,
                'name' => 'sdf',
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        6 => array(
	            'id' => 6,
                'user_id' => 1,
                'name' => 'teste',
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            )
        ]);
    }
}
