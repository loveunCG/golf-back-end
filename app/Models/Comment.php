<?php
/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Comment extends Model
{
    
	
	protected $table = 'forum_comments';
	
	protected $hidden = [
        
    ];

	protected $guarded = [];

	protected $dates = ['deleted_at'];
        
        public function post()
	{
		return $this->belongsTo('\Riari\Forum\Models\Post');
	}
        
        public function user()
	{
		return $this->belongsTo("\App\Models\User");
	}
}
