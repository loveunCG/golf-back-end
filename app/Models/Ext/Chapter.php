<?php

namespace App\Models\Ext;

use Illuminate\Database\Eloquent\Model;

class Chapter extends \App\Models\Chapter
{
    /**
	 * Relation With UniModule
	 * @return Eloquent
	 */
	public function module()
	{
		return $this->belongsTo('App\Models\Ext\UniModule','module_id');
	}
        
        public function video()
	{
		return $this->belongsTo('App\Models\Video');
	}
}
