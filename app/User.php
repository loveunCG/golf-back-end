<?php
/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App;

use App\Models\Video;
use Illuminate\Auth\Authenticatable;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;

use Illuminate\Database\Eloquent\Model;
// use Illuminate\Database\Eloquent\SoftDeletes;
use Zizaco\Entrust\Traits\EntrustUserTrait;

class User extends Model implements AuthenticatableContract, AuthorizableContract, CanResetPasswordContract
{
    use Authenticatable, CanResetPassword;
    // use SoftDeletes;
    use EntrustUserTrait;

    protected $table = 'users';
	
	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
	protected $fillable = [
		'first_name', 'last_name', 'email', 'password', "role", "context_id", "type","is_verified"
	];
	
	/**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
	protected $hidden = [
		'password', 'remember_token',
    ];
    
    // protected $dates = ['deleted_at'];

    /**
     * @return mixed
     */
    public function uploads()
    {
        return $this->hasMany('App\Upload');
    }

    /*
     *  Videos has many relation
     */
    public function videos(){
        return $this->hasMany(Video::class);
    }
}
