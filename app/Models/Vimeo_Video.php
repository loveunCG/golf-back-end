<?php
/**
 * Model genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Vimeo_Video extends Model
{
    use SoftDeletes;
	
	protected $table = 'vimeo_video';

    /*
     * Videos relationship
     */
    public function users()
    {
        return $this->belongsTo(User::class);
    }
}
