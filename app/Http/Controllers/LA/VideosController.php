<?php

/**
 * Controller genrated using LaraAdmin
 * Help: http://laraadmin.com
 */

namespace App\Http\Controllers\LA;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Http\Requests;
use GuzzleHttp\Client;
use Auth;
use DB;
use Validator;
use Datatables;
use Collective\Html\FormFacade as Form;
use Dwij\Laraadmin\Models\Module;
use Dwij\Laraadmin\Models\ModuleFields;
use App\Models\Video;

class VideosController extends Controller {

    public $show_action = true;
    public $view_col = 'name';
    public $width;
    public $height;
    public $listing_cols = ['id', 'name', 'url'];
    public $visible_cols = ['id', 'name', 'url'];

    public function __construct() {
        // Field Access of Listing Columns
//		if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
//			$this->middleware(function ($request, $next) {
//				$this->listing_cols = ModuleFields::listingColumnAccessScan('Videos', $this->listing_cols);
//				return $next($request);
//			});
//		} else {
//			$this->listing_cols = ModuleFields::listingColumnAccessScan('Videos', $this->listing_cols);
//		}
    }

    /**
     * Display a listing of the Videos.
     *
     * @return \Illuminate\Http\Response
     */
    public function index() {
        $module = Module::get('Videos');

        if (Module::hasAccess($module->id)) {
            return View('la.videos.index', [
                'show_actions' => $this->show_action,
                'listing_cols' => $this->listing_cols,
                'visible_cols' => $this->visible_cols,
                'module' => $module
            ]);
        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    /**
     * Show the form for creating a new video.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        //
    }

    /**
     * Store a newly created video in database.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $bearer = env('VIMEO_ACCESS_TOKEN');
        if (Module::hasAccess("Videos", "create")) {
            $rules = Module::validateRules("Videos", $request, true);

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }
            $videos = explode('/', $request->url);
            $video_id = end($videos);
            $headers = [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer '.$bearer,
            ];
            
            $client = new Client(['headers' => $headers, 'http_errors' => false]);

            $response = $client->request('GET', 'https://api.vimeo.com/videos/'.$video_id, []);
            $statuscode = $response->getStatusCode();
            if ($statuscode > 300) {
                return redirect()->back()->withErrors($validator)->withInput();
            }
            
            $response_arr = json_decode($response->getBody()->getContents(), true);
            $video = new Video;
            $video->vimeo_id = $video_id;
            $video->vimeo_name = $response_arr['name'];
            $video->name = $request->name;
            $video->url = $response_arr['link'];
            $video->vimeo_image_path = end($response_arr['pictures']['sizes'])['link'];
            $video->save();

            return redirect()->route(config('laraadmin.adminRoute') . '.videos.index');
        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    /**
     * Display the specified video.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        if (Module::hasAccess("Videos", "view")) {

            $video = Video::find($id);
            if (isset($video->id)) {
                $module = Module::get('Videos');
                $module->row = $video;

                return view('la.videos.show', [
                            'module' => $module,
                            'view_col' => $this->view_col,
                            'no_header' => true,
                            'no_padding' => "no-padding",
                        ])->with('video', $video);
            } else {
                return view('errors.404', [
                    'record_id' => $id,
                    'record_name' => ucfirst("video"),
                ]);
            }
        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    /**
     * Show the form for editing the specified video.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        if (Module::hasAccess("Videos", "edit")) {
            $video = Video::find($id);
            if (isset($video->id)) {
                $module = Module::get('Videos');

                $module->row = $video;

                return view('la.videos.edit', [
                            'module' => $module,
                            'view_col' => $this->view_col,
                        ])->with('video', $video);
            } else {
                return view('errors.404', [
                    'record_id' => $id,
                    'record_name' => ucfirst("video"),
                ]);
            }
        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    /**
     * Update the specified video in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id) {
        
        $bearer = env('VIMEO_ACCESS_TOKEN');
      
        if (Module::hasAccess("Videos", "edit")) {
            $video = Video::findOrFail($id);
            
            
            $rules = Module::validateRules("Videos", $request, true);

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) {
                return redirect()->back()->withErrors($validator)->withInput();
            }
            if($video->url != $request->url) {
                $videos = explode('/', $request->url);
                $video_id = end($videos);
                $headers = [
                    'Content-Type' => 'application/json',
                    'Authorization' => 'Bearer '.$bearer,
                ];

                $client = new Client(['headers' => $headers, 'http_errors' => false]);

                $response = $client->request('GET', 'https://api.vimeo.com/videos/'.$video_id, []);
                $statuscode = $response->getStatusCode();
                if ($statuscode > 300) {
                    return redirect()->back()->withErrors($validator)->withInput();
                }
                $response_arr = json_decode($response->getBody()->getContents(), true);

                $video->vimeo_id = $video_id;
                $video->vimeo_name = $response_arr['name'];
                $video->url = $response_arr['link'];
                $video->vimeo_image_path = end($response_arr['pictures']['sizes'])['link'];
            }
            $video->name = $request->name;
            $video->save();
            
            return redirect()->route(config('laraadmin.adminRoute') . '.videos.index');
        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    /**
     * Show the specified video.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show_video($id) {
        //if(Module::hasAccess("Videos", "edit")) {
        $video = Video::find($id);
        if (isset($video->id)) {
            $module = Module::get('Videos');
            $values = DB::table('vimeo_video')->select('title', 'html', 'description')->where('id', '=', $id);
            $out = Datatables::of($values)->make();
            $data = $out->getData();
            $title = $data->data[0][0];
            $html = $data->data[0][1];
            $description = $data->data[0][2];

            $start_pos = strpos($html, ' width=');
            $end_pos = strpos($html, 'frameborder=');
            $result = substr_replace($html, '', $start_pos, $end_pos - $start_pos);

            $w_start_pos = strpos($html, ' width="') + 8;
            $w_end_pos = strpos($html, '" height=');
            $w_result = substr($html, $w_start_pos, $w_end_pos - $w_start_pos);
            $this->width = $w_result;

            $h_start_pos = strpos($html, ' height="') + 9;
            $h_end_pos = strpos($html, '" frameborder=');
            $h_result = substr($html, $h_start_pos, $h_end_pos - $h_start_pos);
            $this->height = $h_result;

            return view('la.videos.show_video', [
                        'module' => $module,
                        'view_col' => $this->view_col,
                        'width' => $this->width,
                        'height' => $this->height,
                    ])->with('video', $video)->with('title', $title)->with('html', $result)->with('description', $description);
        } else {
            return view('errors.404', [
                'record_id' => $id,
                'record_name' => ucfirst("video"),
            ]);
        }
//        } else {
//            return redirect(config('laraadmin.adminRoute')."/");
//        }
    }

    /**
     * Remove the specified video from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        if (Module::hasAccess("Videos", "delete")) {
            Video::find($id)->delete();

            // Redirecting to index() method
            return redirect()->route(config('laraadmin.adminRoute') . '.videos.index');
        } else {
            return redirect(config('laraadmin.adminRoute') . "/");
        }
    }

    /**
     * Datatable Ajax fetch
     *
     * @return
     */
    public function dtajax() {
        $values = DB::table('videos')->select($this->visible_cols);
        $out = Datatables::of($values)->make();
        $data = $out->getData();

        $fields_popup = ModuleFields::getModuleFields('Videos');

        for ($i = 0; $i < count($data->data); $i++) {
            for ($j = 0; $j < count($this->visible_cols); $j++) {
                $col = $this->visible_cols[$j];
                if ($fields_popup[$col] != null && starts_with($fields_popup[$col]->popup_vals, "@")) {
                    $data->data[$i][$j] = ModuleFields::getFieldValue($fields_popup[$col], $data->data[$i][$j]);
                }
                if ($col == $this->view_col) {
                    $data->data[$i][$j] = '<a href="' . url(config('laraadmin.adminRoute') . '/videos/' . $data->data[$i][0]) . '">' . $data->data[$i][$j] . '</a>';
                }
                // else if($col == "author") {
                //    $data->data[$i][$j];
                // }
            }

            if ($this->show_action) {
                $output = '';

                if (Module::hasAccess("Videos", "edit")) {
//                    $output .= '<a href="'.url(config('laraadmin.adminRoute') . '/videos/'.$data->data[$i][0].'/show_video').'" class="btn btn-primary btn-xs" style="display:inline;padding:2px 5px 3px 5px; margin-right: 3px;"><i class="fa fa-video-camera"></i></a>';
                    $output .= '<a href="' . url(config('laraadmin.adminRoute') . '/videos/' . $data->data[$i][0] . '/show_video') . '" class="btn btn-primary btn-xs" style="display:inline;padding:2px 5px 3px 5px; margin-right: 3px;"><i class="fa fa-video-camera"></i></a>';
                }

                if (Module::hasAccess("Videos", "edit")) {
//                    $output .= '<a href="'.url(config('laraadmin.adminRoute') . '/videos/'.$data->data[$i][0].'/show_video').'" class="btn btn-primary btn-xs" style="display:inline;padding:2px 5px 3px 5px; margin-right: 3px;"><i class="fa fa-video-camera"></i></a>';
                    $output .= '<a href="' . url(config('laraadmin.adminRoute') . '/videos/' . $data->data[$i][0] . '/download') . '" class="btn btn-success btn-xs" style="display:inline;padding:2px 5px 3px 5px; margin-right: 3px;"><i class="fa fa-download"></i></a>';
                }

                if (Module::hasAccess("Videos", "edit")) {
                    $output .= '<a href="' . url(config('laraadmin.adminRoute') . '/videos/' . $data->data[$i][0] . '/edit') . '" class="btn btn-warning btn-xs" style="display:inline;padding:2px 5px 3px 5px;"><i class="fa fa-edit"></i></a>';
                }

                if (Module::hasAccess("Videos", "delete")) {
                    $output .= Form::open(['route' => [config('laraadmin.adminRoute') . '.videos.destroy', $data->data[$i][0]], 'method' => 'delete', 'style' => 'display:inline']);
                    $output .= ' <button class="btn btn-danger btn-xs" type="submit"><i class="fa fa-times"></i></button>';
                    $output .= Form::close();
                }

                $data->data[$i][] = (string) $output;
            }
        }
        $out->setData($data);
        return $out;
    }

}
