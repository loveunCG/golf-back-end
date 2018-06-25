<?php
/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Thread extends Model
{
    
	
	protected $table = 'forum_threads';
	
	protected $hidden = [
        
    ];

	protected $guarded = [];

	protected $dates = ['deleted_at'];
        
        public function posts()
	{
		return $this->hasMany('\Riari\Forum\Models\Post');
	}
        
        public function author()
	{
		return $this->belongsTo("\App\Models\User",'author_id', 'id');
	}
}
