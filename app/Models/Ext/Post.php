<?php

namespace App\Models\Ext;

use Illuminate\Database\Eloquent\Model;

class Post extends \Riari\Forum\Models\Post
{
    protected $fillable = ['thread_id', 'author_id', 'post_id', 'content', 'title'];
    public function comments()
	{
            return $this->hasMany('\App\Models\Comment');
	}
        public function likes()
	{
            return $this->hasMany('\App\Models\UserPostLike');
	}
}
