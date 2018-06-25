<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddPostsLikesCommentsCountThreadsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('forum_threads', function (Blueprint $table) {
            $table->integer('total_likes')->unsigned();
            $table->integer('total_comments')->unsigned();
            $table->integer('total_posts')->unsigned();
            $table->string('content');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('forum_threads', function (Blueprint $table) {
            $table->dropColumn('total_likes');
            $table->dropColumn('total_comments');
            $table->dropColumn('total_posts');
            $table->dropColumn('content');
        });
    }
}
