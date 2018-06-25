<?php

namespace App\Models\Ext;

use Illuminate\Database\Eloquent\Model;

class Academy extends \App\Models\Academy
{
    /**
	 * Relation with Course
	 * @return Eloquent
	 */
	public function courses()
	{
		return $this->hasMany('App\Models\Course');
	}
}
