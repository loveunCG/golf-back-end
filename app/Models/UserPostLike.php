<?php
/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserPostLike extends Model
{
    
	
	protected $table = 'user_post_likes';
	
	protected $hidden = [
        
    ];

	protected $guarded = [];

	
        
    public function user()
    {
        return $this->belongsTo('App\User');
    }

    public function post()
    {
        return $this->belongsTo('App\Models\Ext\Post');
    }
}
