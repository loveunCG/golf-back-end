<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ext\Forum;
use Dwij\Laraadmin\Models\Module;

use App\Http\Requests;

class ChaptersController extends \App\Http\Controllers\LA\ChaptersController
{
	public function index() {
            // get all the nerds
        $chapters = \App\Models\Ext\Chapter::all();

        if(Module::hasAccess("Chapters")) {
            $module = Module::get('Chapters');
			return View('la.chapters.index', [
                                'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'chapters' => $chapters,
                                'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
        
        }
}
