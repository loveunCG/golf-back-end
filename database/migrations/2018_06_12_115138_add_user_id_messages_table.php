<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddUserIdMessagesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('messages', function (Blueprint $table) {
            $table->dropColumn('sender');
            $table->dropColumn('receiver');
            $table->dropColumn('video_uid');
            $table->dropColumn('read');
            $table->integer('conversation_id')->after('message');
            $table->integer('user_id')->after('conversation_id');
            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('messages', function (Blueprint $table) {
            $table->integer('convesation_id');
            $table->integer('user_id');
        });
    }
}
