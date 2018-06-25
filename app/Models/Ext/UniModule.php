<?php

namespace App\Models\Ext;

use Illuminate\Database\Eloquent\Model;

class UniModule extends \App\Models\Unimodule
{
    /**
	 * Relation with Course
	 * @return Eloquent
	 */
	public function course()
	{
		return $this->belongsTo('App\Models\Ext\Course');
	}
        
        public function chapters()
	{
		return $this->hasMany('App\Models\Ext\Chapter','module_id');
	}
}
