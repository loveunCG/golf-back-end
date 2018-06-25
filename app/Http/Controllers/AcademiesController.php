<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ext\Academy;
use Dwij\Laraadmin\Models\Module;

use App\Http\Requests;

class AcademiesController extends \App\Http\Controllers\LA\AcademiesController
{
	/**
	 * Display the specified academy.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Academies", "view")) {
			
			$academy = Academy::find($id);
			if(isset($academy->id)) {
				$module = Module::get('Academies');
				$module->row = $academy;
				
				return view('la.academies.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('academy', $academy);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("academy"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}
}
