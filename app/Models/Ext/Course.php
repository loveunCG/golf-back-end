<?php

namespace App\Models\Ext;

use Illuminate\Database\Eloquent\Model;

class Course extends \App\Models\Course
{
    /**
	 * Relation With Academy
	 * @return Eloquent
	 */
	public function academy()
	{
		return $this->belongsTo('App\Models\Academy');
	}

	/**
	 * Relation with Modules
	 * @return Eloquent
	 */
	public function modules()
	{
		return $this->hasMany('App\Models\Ext\UniModule','course_id', 'id');
	}
}
