<?php
/**
 * Controller genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Http\Controllers\LA;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests;
use Auth;
use DB;
use Validator;
use Datatables;
use Collective\Html\FormFacade as Form;
use Dwij\Laraadmin\Models\Module;
use Dwij\Laraadmin\Models\ModuleFields;

use App\Models\Forum;

class ForumsController extends Controller
{
	public $show_action = true;
	public $view_col = 'title';
	public $listing_cols = ['id', 'title', 'content', 'type', 'user_id'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Forums', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Forums', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Forums.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
            $module = \App\Models\Thread::all();

            return View('admin.forum.index', ['module' => $module]);
            
            
            
            
//            $module = Module::get('Forums');
//
//            if(Module::hasAccess($module->id)) {
//                    return View('la.forums.index', [
//                            'show_actions' => $this->show_action,
//                            'listing_cols' => $this->listing_cols,
//                            'module' => $module
//                    ]);
//            } else {
//                return redirect(config('laraadmin.adminRoute')."/");
//            }
	}

	/**
	 * Show the form for creating a new forum.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
            
            return View('admin.forum.create');
	}

	/**
	 * Store a newly created forum in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
            $validator= Validator::make($request->all(), [
                'title' => 'required',
            ]);

            if ($validator->fails()) {
                return redirect('/admin/forums/create')
                    ->withErrors($validator)
                    ->withInput($request->all());
            }
            else{
                \App\Models\Thread::create($request->all());
            }
            return redirect('/admin/forums');
            
            
            
//		if(Module::hasAccess("Forums", "create")) {
//		
//			$rules = Module::validateRules("Forums", $request);
//			
//			$validator = Validator::make($request->all(), $rules);
//			
//			if ($validator->fails()) {
//				return redirect()->back()->withErrors($validator)->withInput();
//			}
//			
//			$insert_id = Module::insert("Forums", $request);
//			
//			return redirect()->route(config('laraadmin.adminRoute') . '.forums.index');
//			
//		} else {
//			return redirect(config('laraadmin.adminRoute')."/");
//		}
	}

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
				
				return view('la.forums.show', [
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

	/**
	 * Show the form for editing the specified forum.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
            $forumThread  = \App\Models\Thread::findOrFail($id);
            
            return View('admin.forum.edit', ['forumThread' => $forumThread]);
            
            
            
            
            
//		if(Module::hasAccess("Forums", "edit")) {			
//			$forum = Forum::find($id);
//			if(isset($forum->id)) {	
//				$module = Module::get('Forums');
//				
//				$module->row = $forum;
//				
//				return view('la.forums.edit', [
//					'module' => $module,
//					'view_col' => $this->view_col,
//				])->with('forum', $forum);
//			} else {
//				return view('errors.404', [
//					'record_id' => $id,
//					'record_name' => ucfirst("forum"),
//				]);
//			}
//		} else {
//			return redirect(config('laraadmin.adminRoute')."/");
//		}
	}

	/**
	 * Update the specified forum in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
            $validator= Validator::make($request->all(), [
                'title' => 'required',
            ]);

            if ($validator->fails()) {
                return redirect('/admin/forums/'.$id.'/edit')
                    ->withErrors($validator)
                    ->withInput($request->all());
            }
            else{
                $forumThread  = \App\Models\Thread::findOrFail($id);
                $forumThread->update($request->all());
            }
            
            return redirect('/admin/forums');
            
            
            
            
            
//		if(Module::hasAccess("Forums", "edit")) {
//			
//			$rules = Module::validateRules("Forums", $request, true);
//			
//			$validator = Validator::make($request->all(), $rules);
//			
//			if ($validator->fails()) {
//				return redirect()->back()->withErrors($validator)->withInput();;
//			}
//			
//			$insert_id = Module::updateRow("Forums", $request, $id);
//			
//			return redirect()->route(config('laraadmin.adminRoute') . '.forums.index');
//			
//		} else {
//			return redirect(config('laraadmin.adminRoute')."/");
//		}
	}

	/**
	 * Remove the specified forum from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Forums", "delete")) {
			Forum::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.forums.index');
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}
	
	/**
	 * Datatable Ajax fetch
	 *
	 * @return
	 */
	public function dtajax()
	{
		$values = DB::table('forums')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Forums');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/forums/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Forums", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/forums/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Forums", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.forums.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
					$output .= ' <button class="btn btn-danger btn-xs" type="submit"><i class="fa fa-times"></i></button>';
					$output .= Form::close();
				}
				$data->data[$i][] = (string)$output;
			}
		}
		$out->setData($data);
		return $out;
	}
}
