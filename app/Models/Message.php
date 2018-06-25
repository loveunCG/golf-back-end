<?php
/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    	protected $table = 'messages';
	
	protected $fillable = ['message','conversation_id','user_id','video_id'];
}
