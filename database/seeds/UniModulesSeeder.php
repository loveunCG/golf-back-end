<?php

use Illuminate\Database\Seeder;

class UniModulesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\UniModule::insert([
            1 => array(
                'id' => 1,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Business Administration',
                'course_id' => 4
            ),
	        2 => array(
	            'id' => 2,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'History',
                'course_id' => 1
            ),
	        3 => array(
	            'id' => 3,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Visual Arts',
                'course_id' => 10
            ),
	        4 => array(
	            'id' => 4,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'History',
                'course_id' => 4
            ),
	        5 => array(
	            'id' => 5,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Internet',
                'course_id' => 7
            ),
	        6 => array(
	            'id' => 6,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Computer Graphics',
                'course_id' => 7
            ),
	        7 => array(
	            'id' => 7,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Artificial Intelligence',
                'course_id' => 5
            ),
	        8 => array(
	            'id' => 8,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Computer Science',
                'course_id' => 3
            ),
	        9 => array(
	            'id' => 9,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Philosophy',
                'course_id' => 10
            ),
	        10 => array(
	            'id' => 10,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Google',
                'course_id' => 9
            ),
	        11 => array(
	            'id' => 11,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Camp',
                'course_id' => 5
            ),
	        12 => array(
	            'id' => 12,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Mathematics',
                'course_id' => 5
            )
        ]);
    }
}
