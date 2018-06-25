<?php

namespace App\Models\Ext;

use Illuminate\Database\Eloquent\Model;

class Messages extends \App\Models\Message
{
    public function sender()
	{
		return $this->belongsTo('\App\Models\User','sender');
	}
        
        public function receiver()
	{
		return $this->belongsTo('\App\Models\User','receiver');
	}
}
