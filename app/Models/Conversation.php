<?php
/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Conversation extends Model
{
    protected $table = 'conversation';
    protected $fillable = ['name'];
    
    public function participant(){
        return $this->hasMany('App\Models\Participant');
    }
    
    public function message(){
        return $this->hasMany('App\Models\Message');
    }
	
}

