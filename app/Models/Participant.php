<?php
/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Participant extends Model
{
    protected $table = 'participants';
    
    protected $fillable = ['conversation_id','user_id'];
    
    public function conversation(){
        return $this->belongsTo('App\Models\Conversation');
    }
    
    public function message(){
        return $this->hasMany('App\Models\Message','user_id','user_id');
    }
    
    public function user(){
        return $this->hasOne('App\Models\User','id','user_id');
    }
}
