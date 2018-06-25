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

use App\Models\Post;

class PostsController extends Controller
{
	public $show_action = true;
	public $view_col = 'name';
	public $listing_cols = ['id', 'name', 'title', 'description', 'comments', 'likes', 'forum_id'];
	
	public function __construct() {
		// Field Access of Listing Columns
		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
			$this->middleware(function ($request, $next) {
				$this->listing_cols = ModuleFields::listingColumnAccessScan('Posts', $this->listing_cols);
				return $next($request);
			});
		} else {
			$this->listing_cols = ModuleFields::listingColumnAccessScan('Posts', $this->listing_cols);
		}
	}
	
	/**
	 * Display a listing of the Posts.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index()
	{
            $module = \App\Models\Ext\Post::all();

            return View('admin.forum-post.index', ['module' => $module]);
            
            
            
            
//            $module = Module::get('Posts');
//
//            if(Module::hasAccess($module->id)) {
//                    return View('la.posts.index', [
//                            'show_actions' => $this->show_action,
//                            'listing_cols' => $this->listing_cols,
//                            'module' => $module
//                    ]);
//            } else {
//                return redirect(config('laraadmin.adminRoute')."/");
//            }
	}

	/**
	 * Show the form for creating a new post.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create()
	{
            $thread = \App\Models\Thread::lists('title','id');

            return View('admin.forum-post.create', ['thread' => $thread]);
	}

	/**
	 * Store a newly created post in database.
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
                return redirect('/admin/posts/create')
                    ->withErrors($validator)
                    ->withInput($request->all());
            }
            else{
                \App\Models\Ext\Post::create($request->all());
            }
            
            
            return redirect('/admin/posts');
            
            
            
//		if(Module::hasAccess("Posts", "create")) {
//		
//			$rules = Module::validateRules("Posts", $request);
//			
//			$validator = Validator::make($request->all(), $rules);
//			
//			if ($validator->fails()) {
//				return redirect()->back()->withErrors($validator)->withInput();
//			}
//			
//			$insert_id = Module::insert("Posts", $request);
//			
//			return redirect()->route(config('laraadmin.adminRoute') . '.posts.index');
//			
//		} else {
//			return redirect(config('laraadmin.adminRoute')."/");
//		}
	}

	/**
	 * Display the specified post.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function show($id)
	{
		if(Module::hasAccess("Posts", "view")) {
			
			$post = Post::find($id);
			if(isset($post->id)) {
				$module = Module::get('Posts');
				$module->row = $post;
				
				return view('la.posts.show', [
					'module' => $module,
					'view_col' => $this->view_col,
					'no_header' => true,
					'no_padding' => "no-padding"
				])->with('post', $post);
			} else {
				return view('errors.404', [
					'record_id' => $id,
					'record_name' => ucfirst("post"),
				]);
			}
		} else {
			return redirect(config('laraadmin.adminRoute')."/");
		}
	}

	/**
	 * Show the form for editing the specified post.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function edit($id)
	{
            
            $thread = \App\Models\Thread::lists('title','id');
            $posts  = \App\Models\Ext\Post::findOrFail($id);
            
            return View('admin.forum-post.edit', ['posts'=>$posts, 'thread' => $thread]);
            
            
            
//		if(Module::hasAccess("Posts", "edit")) {			
//			$post = Post::find($id);
//			if(isset($post->id)) {	
//				$module = Module::get('Posts');
//				
//				$module->row = $post;
//				
//				return view('la.posts.edit', [
//					'module' => $module,
//					'view_col' => $this->view_col,
//				])->with('post', $post);
//			} else {
//				return view('errors.404', [
//					'record_id' => $id,
//					'record_name' => ucfirst("post"),
//				]);
//			}
//		} else {
//			return redirect(config('laraadmin.adminRoute')."/");
//		}
	}

	/**
	 * Update the specified post in storage.
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
                return redirect('/admin/posts/'.$id.'/edit')
                    ->withErrors($validator)
                    ->withInput($request->all());
            }
            else{
                $posts  = \App\Models\Ext\Post::findOrFail($id);
                $posts->update($request->all());
            }
            return redirect('/admin/posts');
            
            
            
            
//		if(Module::hasAccess("Posts", "edit")) {
//			
//			$rules = Module::validateRules("Posts", $request, true);
//			
//			$validator = Validator::make($request->all(), $rules);
//			
//			if ($validator->fails()) {
//				return redirect()->back()->withErrors($validator)->withInput();;
//			}
//			
//			$insert_id = Module::updateRow("Posts", $request, $id);
//			
//			return redirect()->route(config('laraadmin.adminRoute') . '.posts.index');
//			
//		} else {
//			return redirect(config('laraadmin.adminRoute')."/");
//		}
	}

	/**
	 * Remove the specified post from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id)
	{
		if(Module::hasAccess("Posts", "delete")) {
			Post::find($id)->delete();
			
			// Redirecting to index() method
			return redirect()->route(config('laraadmin.adminRoute') . '.posts.index');
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
		$values = DB::table('posts')->select($this->listing_cols)->whereNull('deleted_at');
		$out = Datatables::of($values)->make();
		$data = $out->getData();

		$fields_popup = ModuleFields::getModuleFields('Posts');
		
		for($i=0; $i < count($data->data); $i++) {
			for ($j=0; $j < count($this->listing_cols); $j++) { 
				$col = $this->listing_cols[$j];
				if($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
					$data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
				}
				if($col == $this->view_col) {
					$data->data[$i][$j] = '<a href="'.url(config('laraadmin.adminRoute') . '/posts/'.$data->data[$i][0]).'">'.$data->data[$i][$j].'</a>';
				}
				// else if($col == "author") {
				//    $data->data[$i][$j];
				// }
			}
			
			if($this->show_action) {
				$output = '';
				if(Module::hasAccess("Posts", "edit")) {
					$output .= '<a href="'.url(config('laraadmin.adminRoute') . '/posts/'.$data->data[$i][0].'/edit').'" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
				}
				
				if(Module::hasAccess("Posts", "delete")) {
					$output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.posts.destroy', $data->data[$i][0]], 'method' => 'delete', 'style'=>'display:inline']);
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
