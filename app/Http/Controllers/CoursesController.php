<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ext\Forum;
use Dwij\Laraadmin\Models\Module;
use App\Http\Requests;
use Validator,
    Session,
    Storage;

class CoursesController extends \App\Http\Controllers\LA\CoursesController {

    public function create() {
        if (Module::hasAccess("Courses", "create")) {
            $module = Module::get('Courses');
            $course = new \App\Models\Ext\Course;
            $academies = \App\Models\Ext\Academy::all()->lists('name', 'id');
            $videos = \App\Models\Video::all()->lists('name', 'id');
            return view('la.courses.create', [
                'course' => $course,
                'module' => $module,
                'view_col' => $this->view_col,
                'academies' => $academies,
                'videos' => $videos]);
        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    public function store(Request $request) {

        if (Module::hasAccess("Courses", "create")) {


            $course = new \App\Models\Ext\Course;



            $validator = Validator::make($request->all(), [
                        'name' => 'required',
                        'featureimage' => 'mimes:jpeg,bmp,png',
            ]);

            if ($validator->fails()) {
                return redirect()->route(config('laraadmin.adminRoute') . '.courses.create')
                    ->withErrors($validator)
                    ->withInput($request->except(['modules','hidden_total_modules_chapters','chapters','videos']));
            } else {
                $course->name = $request->name;
                $course->description = $request->description;
                $course->academy_id = $request->academy_id;
                $course->save();

                if ($request->hasFile('featureimage')) {
                    Storage::put(
                            'course/' . $course->id . '.' . $request->file('featureimage')->getClientOriginalExtension(), file_get_contents($request->file('featureimage')->getRealPath())
                    );

                    $course->featureimage = 'course/' . $course->id . '.' . $request->file('featureimage')->getClientOriginalExtension();
                    $course->update();
                }

                if ($request->has('modules')) {
                    $i = 0;
                    $j = 0;
                    $k = 0;
                    foreach ($request['modules'] as $module_name) {
                        $arr_steps['name'] = $module_name;
                        $arr_steps['course_id'] = $course->id;
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
                                $arr_items['video_id'] = $request['videos'][$j];
                                //if chapter name is not empty
                                if (trim($arr_items['name']) != '' && $module_id)
                                    \App\Models\Chapter::create($arr_items);
                            } // end loop
                            $k = $j;
                        }  // endif 

                        $i++;
                    } // end loop
                }
            }
            Session::flash('flash_message', 'Course created successfully!');


            return redirect()->route(config('laraadmin.adminRoute') . '.courses.index');
        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
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
			$course = \App\Models\Ext\Course::find($id);
			if(isset($course->id)) {	
				$academies = \App\Models\Ext\Academy::all()->lists('name', 'id');
                                $videos = \App\Models\Video::all()->lists('name', 'id');
				return view('la.courses.edit', [
					'academies' => $academies,
					'videos' => $videos,
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

}
