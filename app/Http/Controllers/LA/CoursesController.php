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

use App\Models\Ext\Course;

class CoursesController extends Controller
{
	public $show_action = true;
	public $view_col = 'name';
	public $listing_cols = ['id', 'description', 'name', 'academy_id', 'featureimage', 'content', 'modules_ids', 'course_chapters', 'course_skills', 'course_video'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Courses', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Courses', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Courses.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
		$module = Module::get('Courses');
		
		if(Module::hasAccess($module->id)) {
			return View('la.courses.index', [
				'show_actions' => $this->show_action,
				'listing_cols' => $this->listing_cols,
				'module' => $module
			]);
		} else {
            return redirect(config('laraadmin.adminRoute')."/");
        }
	}

	/**
	 * Show the form for creating a new course.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
		//
	}

	/**
	 * Store a newly created course in database.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @return \Illuminate\Http\Response
	 */
	public function store(Request $request)
	{
            	if(Module::hasAccess("Courses", "create")) {
		
			$rules = Module::validateRules("Courses", $request);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();
			}
			
			$insert_id = Module::insert("Courses", $request);
			
			return redirect()->route(config('laraadmin.adminRoute') . '.courses.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Display the specified course.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Courses", "view")) {
			
			$course = Course::find($id);
			if(isset($course->id)) {
				$module = Module::get('Courses');
				$module->row = $course;
				
				return view('la.courses.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('course', $course);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("course"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified course.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
		if(Module::hasAccess("Courses", "edit")) {			
			$course = Course::find($id);
			if(isset($course->id)) {	
				$module = Module::get('Courses');
				
				$module->row = $course;
				
				return view('la.courses.edit', [
					'module' => $module,
					'view_col' => $this->view_col,
				])->with('course', $course);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("course"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Update the specified course in storage.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function update(Request $request, $id)
	{
		if(Module::hasAccess("Courses", "edit")) {
			
			$rules = Module::validateRules("Courses", $request, true);
			
			$validator = Validator::make($request->all(), $rules);
			
			if ($validator->fails()) {
				return redirect()->back()->withErrors($validator)->withInput();;
			}
			
			$insert_id = Module::updateRow("Courses", $request, $id);
			
                        if ($request->has('modules')) {
                            $i = 0;
                            $j = 0;
                            $k = 0;
                            
                            $moduleDelete = \App\Models\Ext\UniModule::where('course_id',$id)->get();
                            foreach ($moduleDelete as $moduleDel){
                                \App\Models\Chapter::where('module_id',$moduleDel->id)->forceDelete(); //forceDelete
                            }
                            \App\Models\Ext\UniModule::where('course_id',$id)->forceDelete(); //forceDelete
                            foreach ($request['modules'] as $module_name) {
                                $arr_steps['name'] = $module_name;
                                $arr_steps['course_id'] = $id;
                                $module_id = 0;
                                //if moduel name is not empty
                                if (trim($module_name) != '') {
                                    $module = \App\Models\Ext\UniModule::create($arr_steps);
                                    $module_id = $module->id;
                                }
                                $total_modules_chapters = $request['hidden_total_modules_chapters'][$i];


                                if ($total_modules_chapters) {
                                    for ($j = $k; $j < ($total_modules_chapters + $k); $j++) {
                                        $arr_items['name'] = $request['chapters'][$j];
                                        $arr_items['module_id'] = $module_id;
                                        $arr_items['video_id'] = 0;
                                        //if chapter name is not empty
                                        if (trim($arr_items['name']) != '' && $module_id)
                                            \App\Models\Chapter::create($arr_items);
                                    } // end loop
                                    $k = $j;
                                }  // endif 

                                $i++;
                            } // end loop
                        }
                        
			return redirect()->route(config('laraadmin.adminRoute') . '.courses.index');
			
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Remove the specified course from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Courses", "delete")) {
			Course::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.courses.index');
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
		$values = DB::table('courses')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Courses');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/courses/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Courses", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/courses/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Courses", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.courses.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
