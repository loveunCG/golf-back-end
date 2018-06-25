<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ext\Forum;
use Dwij\Laraadmin\Models\Module;

use App\Http\Requests;

class ForumsController extends \App\Http\Controllers\LA\ForumsController
{
	/**
	 * Display the specified forum.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Forums", "view")) {
			
			$forum = Forum::find($id);
			if(isset($forum->id)) {
				$module = Module::get('Forums');
				$module->row = $forum;
				
				return view('la.forum.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('forum', $forum);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("forum"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}
}
