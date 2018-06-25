<?php

use Illuminate\Database\Seeder;

class PlayItemSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Playitems::insert([
            1 => array(
                'id' => 1,
                'playlist_id' => 1,
                'video_uid' => 1,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        2 => array(
	            'id' => 2,
                'playlist_id' => 1,
                'video_uid' => 2,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        3 => array(
	            'id' => 3,
                'playlist_id' => 1,
                'video_uid' => 1,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        4 => array(
	            'id' => 4,
                'playlist_id' => 1,
                'video_uid' => 1,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            ),
	        5 => array(
	            'id' => 5,
                'playlist_id' => 2,
                'video_uid' => 1,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now()
            )
        ]);
    }
}
