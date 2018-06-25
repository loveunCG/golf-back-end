<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;

use App\Http\Requests;

use Dwij\Laraadmin\Models\Module;

use GuzzleHttp\Client;

use JWTAuth;

use Tymon\JWTAuthExceptions\JWTException;

use Illuminate\Support\Facades\DB;

use App\Models\Video;

// Username:            George Gankas

// Email Address:       george@georgegankas.golf
// Password:            fuckfish61

// User_ID              84671434

// Client Identifier:   ef9906d78db6f3f0ec0899b1577fca3041e58d06
// Client Secrets:      XxU7DYI0DLj6pWaUbnTc2R8Qnt/ocREpvyuDYANhSPfPrJGY2yKAW81bNjmrgblYpQpVMfiIjPbBbWdffdnrpjEcSKmvQ1qbRZEikWIslQXZdiLlvAOzlAP5lCErTHUV
// Vimeo Access Token:  723009cbc370c68425ecc0c4f613dfe8
// Authorize Url:       https://api.vimeo.com/oauth/authorize
// Access Token Url:    https://api.vimeo.com/oauth/access_token
// Callback Url:        https://a9d5425b.ngrok.io/api/token
// Scope:               public private purchased create edit delete interact upload video_files

// References: 
// https://api.vimeo.com/oauth/authorize?client_id=ef9906d78db6f3f0ec0899b1577fca3041e58d06&response_type=code&redirect_uri=https://a9d5425b.ngrok.io/api/token
// https://a9d5425b.ngrok.io

class VideosController extends Controller
{
    public $bearer_access_token = '723009cbc370c68425ecc0c4f613dfe8';
    public $USER_ID = 84671434;

    public function vimeo_token(Request $request) {
        
        // echo $request->fullUrl();
        $this->bearer_access_token = $request->header('Authorization');
        // echo $this->bearer_access_token;
    }

    // public function getVideoList(Request $request) {
		
    //     $videos = DB::table('skills')
    //         ->join('videos', 'skills.id', '=', 'videos.skill_id')
    //         ->select('skills.*', 'videos.name', 'videos.url','videos.created_at','videos.created_at')
    //         ->get();

    //     if ($videos){
    //         return response()->json([
    //             'data' => $videos,
    //             'message' => 'STATUS_SUCCESS',
    //             'status' => 200
    //         ]);
    //     }else{
    //         return response()->json([
    //             'data' => $videos,
    //             'message' => 'VIDEOS_NOT_FOUND',
    //             'status' => 404
    //         ]);
    //     }
    // }
    
    public function Vimeo_Download_Video_By_ID(Request $request) {
        
        $video_id = $request->get('video_id');

        if (isset($video_id)) {

            $headers = [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer ' . $this->bearer_access_token,
            ];

            $client = new Client(['headers' => $headers]);
            $response = $client->request('GET', 'https://api.vimeo.com/me/videos/' . $video_id, []);
        }

        $json = json_decode($response->getBody()->getContents(), true);
        $download = json_decode(json_encode($json['download']), true);
        $link = $download[0]['link'];
        $ext = pathinfo($link, PATHINFO_EXTENSION);
        $filename = $video_id . '.' . $ext;
        $tempImage = tempnam(sys_get_temp_dir(), $filename);
        copy($link, $tempImage);

        return response()->download($tempImage, $filename);
    }

    public function Vimeo_Get_Video_By_Url(Request $request) {

        $url = $request->get('url');
        
        if (isset($url)) {
            $json = json_decode(file_get_contents('https://vimeo.com/api/oembed.json?url=' . $url), true);
        }

        return $json;
    }
  
    public function Vimeo_Get_Video_By_ID(Request $request) {
        
        $video_id = $request->get('video_id');
        
        if (isset($video_id)) {

            $headers = [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer ' . $this->bearer_access_token,
            ];

            $client = new Client(['headers' => $headers]);
            $response = $client->request('GET', 'https://api.vimeo.com/videos/' . $video_id, []);
        }

        return json_decode($response->getBody(), true);
    }

    public function Vimeo_Get_User_All_Videos(Request $request) {
        
        $user_id = $request->get('user_id');
        
        if (isset($user_id)) {

            $headers = [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer ' . $this->bearer_access_token,
            ];

            $client = new Client(['headers' => $headers]);
            $response = $client->request('GET', "https://api.vimeo.com/users/" . $user_id . "/videos", []);
        }

        return json_decode($response->getBody(), true);
    }
    
    public function Vimeo_Get_User_By_ID(Request $request) {
        
        $user_id = $request->get('user_id');

        if (isset($user_id)) {

            $headers = [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer ' . $this->bearer_access_token,
            ];

            $client = new Client(['headers' => $headers]);
            $response = $client->request('GET', 'https://api.vimeo.com/users/' . $user_id, []);
        }

        return json_decode($response->getBody());
    }

    public function Vimeo_Delete_Video_By_ID(Request $request) {
        
        $video_id = $request->get('video_id');

        if (isset($video_id)) {

            $headers = [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer ' . $this->bearer_access_token,
            ];

            $client = new Client(['headers' => $headers]);
            $response = $client->request('DELETE', 'https://api.vimeo.com/videos/' . $video_id, []);
        }

        return json_decode($response->getCode());
    }

    public function Add_Video(Request $request) {

        $req = $request->all();

        $upload_url = $req['upload_url'];
        
        if (isset($upload_url)) {

            $headers = [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer ' . $this->bearer_access_token,
            ];

            $client = new Client(['headers' => $headers]);
            $response = $client->request('POST', 'https://api.vimeo.com/users/' + $USER_ID + '/videos', array (
                'upload' => array (
                            'approach' => 'post',
                            'redirect_url' => 'https://a9d5425b.ngrok.io/api/save_vimeo_video_info_to_db',
                            )));
        }

        $request->request->add(['url', $newUrl]);

        // Get vimeo video information from api.vimeo.com
        $videoInfo = Vimeo_Get_Video_By_Url($request);
        // Save vimeo video information to database.
        $array = array_add(['course_id' => $req['course_id']], 
                            ['module_id' => $req['module_id']], 
                            ['chapter_id' => $req['chapter_id']], 
                            ['title' => $videoInfo[0]['title']], 
                            ['url' => $req['url']], 
                            ['author_name' => $videoInfo[0]['author_name']], 
                            ['author_url'   => $videoInfo[0]['author_url']], 
                            ['html' => $videoInfo[0]['html']], 
                            ['description' => $videoInfo[0]['description']], 
                            ['upload_date' => $videoInfo[0]['upload_date']], 
                            ['video_id' => $videoInfo[0]['video_id']], 
                            ['uri' => $videoInfo[0]['uri']], 
                            ['is_active' => 1]
                        );

        $result = DB::table('vimeo_video')
            ->insert($array); 
        return $result;
    }

    public function Get_Video_Iframe(Request $request) {
        
        $id = $request->get('id');

        $html = DB::table('vimeo_video')
            ->where('id', $id)
            ->value('html');

        return $html;
    }

    public function Delete_Video(Request $request) {
        
        $id = $request->get('id');

        $result = DB::table('vimeo_video')
            ->where('id', $id)
            ->update(['is_deleted' => 0]);
        
        if ($result) {
            return response()->json([
                'data' => $result,
                'message' => 'SUCCESS',
                'status' => 200
            ]);
        } else{
            return response()->json([
                'data' => $result,
                'message' => 'FAILED',
                'status' => 404
            ]);
        }
    }

    public function Edit_Video(Request $request) {
        
        $req = $request->all();

        $result = DB::table('vimeo_video')
            ->where('id', $id)
            ->update($req);
        
        if ($result){
            return response()->json([
                'data' => $result,
                'message' => 'SUCCESS',
                'status' => 200
            ]);
        }else{
            return response()->json([
                'data' => $result,
                'message' => 'FAILED',
                'status' => 404
            ]);
        }
    }

    public function Get_All_Videos_By_Chapter_ID() {

        $chapter_id = $request->get('chapter_id');

        $result = DB::table('vimeo_video')
            ->select('*')
            ->where([['chapter_id', '=', $chapter_id], ['is_deleted', '=', '0']])
            ->get();

        if ($result){
            return response()->json([
                'data' => $result,
                'message' => 'STATUS_SUCCESS',
                'status' => 200
            ]);
        }else{
            return response()->json([
                'data' => $result,
                'message' => 'VIDEOS_NOT_FOUND',
                'status' => 404
            ]);
        }
    }

    public function Get_All_Videos_By_Module_ID() {

        $module_id = $request->get('module_id');

        $result = DB::table('vimeo_video')
            ->select('*')
            ->where([['module_id', '=', $module_id], ['is_deleted', '=', '0']])
            ->get();

        if ($result){
            return response()->json([
                'data' => $result,
                'message' => 'STATUS_SUCCESS',
                'status' => 200
            ]);
        }else{
            return response()->json([
                'data' => $result,
                'message' => 'VIDEOS_NOT_FOUND',
                'status' => 404
            ]);
        }
    }

    public function Get_All_Videos_By_Course_ID() {

        $course_id = $request->get('course_id');

        $result = DB::table('vimeo_video')
            ->select('*')
            ->where([['course_id', '=', $course_id], ['is_deleted', '=', '0']])
            ->get();

        if ($result){
            return response()->json([
                'data' => $result,
                'message' => 'STATUS_SUCCESS',
                'status' => 200
            ]);
        }else{
            return response()->json([
                'data' => $result,
                'message' => 'VIDEOS_NOT_FOUND',
                'status' => 404
            ]);
        }
    }

    public function Show_Video(Request $request) {
        
        $video_id = $request->get('video_id');

        if (isset($video_id)) {

            $headers = [
                'Content-Type' => 'application/json',
                'Authorization' => 'Bearer ' . $this->bearer_access_token,
            ];

            $client = new Client(['headers' => $headers]);
            $response = $client->request('GET', 'https://api.vimeo.com/videos/' . $video_id, []);
        }

        $json = json_decode($response->getBody(), true);
        return $json['embed']['html'];
    }
}