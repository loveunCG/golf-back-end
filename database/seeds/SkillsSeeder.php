<?php

use Illuminate\Database\Seeder;

class SkillsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Skill::insert([
            1 => array(
                'id' => 1,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 8,
                'name' => ''
            ),
            2 => array(
                'id' => 2,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 8,
                'name' => ''
            ),
            3 => array(
                'id' => 3,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 5,
                'name' => ''
            ),
            4 => array(
                'id' => 4,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 5,
                'name' => ''
            ),
            5 => array(
                'id' => 5,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 5,
                'name' => ''
            ),
            6 => array(
                'id' => 6,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 5,
                'name' => ''
            ),
            7 => array(
                'id' => 7,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 5,
                'name' => ''
            ),
            8 => array(
                'id' => 8,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 1,
                'name' => ''
            ),
            9 => array(
                'id' => 9,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 1,
                'name' => ''
            ),
            10 => array(
                'id' => 10,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 1,
                'name' => ''
            ),
            11 => array(
                'id' => 11,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 1,
                'name' => ''
            ),
            12 => array(
                'id' => 12,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 1,
                'name' => ''
            ),
            13 => array(
                'id' => 13,
                'deleted_at' => NULL,
                'created_at' => \Carbon\Carbon::now(),
                'updated_at' => \Carbon\Carbon::now(),
                'chapter_id' => 1,
                'name' => ''
            ),
        ]);
    }
}
