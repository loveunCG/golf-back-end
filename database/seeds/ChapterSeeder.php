<?php

use Illuminate\Database\Seeder;

class ChapterSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Chapter::insert([
            1 => array(
                'id' => 1,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Algebra',
                'module_id' => 12
            ),
	        2 => array(
	            'id' => 2,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Combinatorics',
                'module_id' => 12
            ),
	        3 => array(
	            'id' => 3,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Mathematical physics',
                'module_id' => 12
            ),
	        4 => array(
	            'id' => 4,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Mathematicians',
                'module_id' => 1
            ),
	        5 => array(
	            'id' => 5,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Game theory',
                'module_id' => 1
            ),
	        6 => array(
	            'id' => 6,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Calculus and analysis',
                'module_id' => 12
            ),
	        7 => array(
	            'id' => 7,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'HTML',
                'module_id' => 5
            ),
	        8 => array(
	            'id' => 8,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'CSS',
                'module_id' => 6
            ),
	        9 => array(
	            'id' => 9,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'JavaScript',
                'module_id' => 8
            ),
	        10 => array(
	            'id' => 10,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'MongoDB',
                'module_id' => 8
            ),
	        11 => array(
	            'id' => 11,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Algorithms',
                'module_id' => 8
            ),
	        12 => array(
	            'id' => 12,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'NodeJS',
                'module_id' => 8
            )
        ]);
    }
}
