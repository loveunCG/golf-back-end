<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateConfigTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::table('la_configs')
            ->where('key', 'sitename')
            ->update(['value' => 'Golf Admin']);
        
        DB::table('la_configs')
            ->where('key', 'sitename_part1')
            ->update(['value' => 'Golf']);
        
        DB::table('la_configs')
            ->where('key', 'sitename_part2')
            ->update(['value' => 'Admin']);
        
        DB::table('la_configs')
            ->where('key', 'sitename_short')
            ->update(['value' => 'GA']);
        
        DB::table('la_configs')
            ->where('key', 'site_description')
            ->update(['value' => 'Golf Admin Description']);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        
    }
}
