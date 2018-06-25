<?php

use Illuminate\Database\Seeder;

class CourseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Course::insert([
            1 => array(
                'id' => 1,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => '2001-2002 Programs and Modules',
                'academy_id' => 4,
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.',
                'featureimage' => 1,
                'content' => '',
                'modules_ids' => '["2","4","5"]',
                'course_chapters' => '["2","4","5"]',
                'course_skills' => '["2","3","4"]',
                'course_video' => '["2","4"]'
            ),
	        2 => array(
	            'id' => 2,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => '2002-2003 Programs and Modules',
                'academy_id' => 1,
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.<br>',
                'featureimage' => 1,
                'content' => '',
                'modules_ids' => '["2","4"]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            ),
	        3 => array(
	            'id' => 3,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => '2001-2002 Programs and Modules',
                'academy_id' => 1,
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.',
                'featureimage' => 2,
                'content' => '',
                'modules_ids' => '["2","4"]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            ),
	        4 => array(
	            'id' => 4,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => '2011-2012 Programs and Modules',
                'academy_id' => 1,
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.',
                'featureimage' => 2,
                'content' => '',
                'modules_ids' => '["2","4"]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            ),
	        5 => array(
	            'id' => 5,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => '2012-2013 Programs and Modules',
                'academy_id' => 17,
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.',
                'featureimage' => 1,
                'content' => '',
                'modules_ids' => '["2","4"]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            ),
	        6 => array(
	            'id' => 6,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => '2004-2005 Programs and Modules',
                'academy_id' => 1,
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.',
                'featureimage' => 1,
                'content' => '',
                'modules_ids' => '["2","4"]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            ),
	        7 => array(
	            'id' => 7,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => '2007-2008 Programs and Modules',
                'academy_id' => 1,
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.',
                'featureimage' => 0,
                'content' => '',
                'modules_ids' => '[]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            ),
	        8 => array(
	            'id' => 8,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => '2013-2014 Programs and Modules',
                'academy_id' => 1,
                'description' => '',
                'featureimage' => 0,
                'content' => '',
                'modules_ids' => '[]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            ),
	        9 => array(
	            'id' => 9,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => '2015-2016 Programs and Modules',
                'academy_id' => 1,
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.',
                'featureimage' => 0,
                'content' => '',
                'modules_ids' => '["2","4"]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            ),
	        10 => array(
	            'id' => 10,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => '2018-2029 Programs and Modules',
                'academy_id' => 1,
                'description' => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi porta eget tortor quis pretium. Integer vehicula lorem quis tellus vehicula, ut pulvinar eros consequat. Nunc sem est, mattis rutrum efficitur at, tempus in turpis. Vestibulum eu sem faucibus.',
                'featureimage' => 0,
                'content' => '',
                'modules_ids' => '[]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            ),
	        11 => array(
	            'id' => 11,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Visual Arts',
                'academy_id' => 1,
                'description' => '',
                'featureimage' => 0,
                'content' => '',
                'modules_ids' => '[]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            ),
	        12 => array(
	            'id' => 12,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Multimedia Journalism',
                'academy_id' => 1,
                'description' => '',
                'featureimage' => 0,
                'content' => '',
                'modules_ids' => '[]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            ),
	        13 => array(
	            'id' => 13,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'Electrical & Computer Engineering 2+2 Program',
                'academy_id' => 1,
                'description' => '',
                'featureimage' => 0,
                'content' => '',
                'modules_ids' => '["2","4"]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            ),
	        14 => array(
	            'id' => 14,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'name' => 'History',
                'academy_id' => 17,
                'description' => '',
                'featureimage' => 0,
                'content' => '',
                'modules_ids' => '[]',
                'course_chapters' => '[]',
                'course_skills' => '',
                'course_video' => '[]'
            )
        ]);
    }
}
