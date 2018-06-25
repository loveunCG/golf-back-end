<?php

header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET,PUT,POST,DELETE,OPTIONS');
header('Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept, x-xsrf-token, Authorization');


/* ============= API Routes =============================== */
Route::group(['prefix' => 'api'], function()
{
    // Generate and get vimeo access token
    Route::get('/token', 'VideosController@Vimeo_Token');

    // Download my vimeo video by video_id
    Route::get('/vimeo_download_video_by_id', 'VideosController@Vimeo_Download_Video_By_ID');
    // Get all vimeo video information by url
    Route::get('/vimeo_get_video_by_url', 'VideosController@Vimeo_Get_Video_By_Url');
    // Get all vimeo video information by video_id
    Route::get('/vimeo_get_video_by_id', 'VideosController@Vimeo_Get_Video_By_ID');
    // Get all vimeo videos of a user by user_id
    Route::get('/vimeo_get_user_all_videos', 'VideosController@Vimeo_Get_User_All_Videos');
    // Get a vimeo user's all information by user_id
    Route::get('/vimeo_get_user_by_id', 'VideosController@Vimeo_Get_User_By_ID');
    // Delete a vimeo video by video_id
    Route::get('/vimeo_delete_video_by_id', 'VideosController@Vimeo_Delete_Video_By_ID');

    // Add a video to vimeo
    Route::get('/add_video', 'VideosController@Add_Video');
    // Edit a vimeo video
    Route::get('/edit_video', 'VideosController@Edit_Video');
    // Delete a vimeo video
    Route::get('/delete_video', 'VideosController@Delete_Video');
    // Show a vimeo video
    Route::get('/show_video', 'VideosController@Show_Video');

    // Get a vimeo video iframe
    Route::get('/get_video_iframe', 'VideosController@Get_Video_Iframe');
    // Get all vimeo videos by chapter_id
    Route::get('/get_all_videos_by_chapter_id', 'VideosController@Get_All_Videos_By_Chapter_ID');
    // Get all vimeo videos by module_id
    Route::get('/get_all_videos_by_module_id', 'VideosController@Get_All_Videos_By_Module_ID');
    // Get all vimeo videos by course_id
    Route::get('/get_all_videos_by_course_id', 'VideosController@Get_All_Videos_By_Course_ID');
    
    // login
    Route::post('/login', 'AuthenticateController@authenticate');
    Route::post('/signup', 'AuthenticateController@signup');
    Route::post('/refresh', 'AuthenticateController@refresh');
    Route::post('/verify', 'AuthenticateController@verifyUser');
    Route::get('/vimeo-videos', 'VideosController@getVideoList');
    Route::get('/get-courses', 'HomeController@getCourseList');
    Route::get('/courses', 'HomeController@courses');
    Route::get('/unimodules', 'HomeController@unimodules');
    Route::get('/chapters', 'HomeController@chapters');
    Route::get('/get_vimeo_video', 'HomeController@vimeo_video');
    Route::get('/get-course-detail/{id}', 'HomeController@getCourseDetail');

    Route::group(['middleware' => ['jwt.auth']], function() {

        // Playlists
        Route::post('/playlists', 'ApiController@CreatePlayList');
        Route::get('/playlists/{id}', 'ApiController@GetPlayList');
        Route::put('/playlists/{id}', 'ApiController@UpdatePlayList');
        Route::delete('/playlists/{id}', 'ApiController@DeletePlayList');
        
        // Playitems
        Route::post('/playitems', 'ApiController@CreatePlayItem');
        Route::get('/playitems/{id}', 'ApiController@GetPlayItems');
        Route::put('/playitems/{id}', 'ApiController@UpdatePlayItem');
        Route::delete('/playitems/{id}', 'ApiController@DeletePlayItem');

        // Message
        Route::post('/message', 'ApiController@CreateMessage');
        Route::post('/messages/thread', 'ApiController@GetMessagesThread');
        Route::get('/messages/summary', 'ApiController@GetAllMessages');
        Route::put('/message/{id}', 'ApiController@UpdateMessage');
        Route::put('/messages/read', 'ApiController@UpdateUnreadMessage');
        Route::delete('/message/{id}', 'ApiController@DeleteMessage');
        
        // User Forums
        Route::post('/forum', 'ApiController@CreateForum');
        // Create Post
        Route::post('/post/create', 'ApiController@CreatePost');
        //forums
        Route::get('/threads', 'ThreadController@index');
        Route::post('/thread/create', 'ThreadController@store');
        Route::get('/thread/get/{id}', 'ThreadController@fetch');
        Route::get('/posts/{id}', 'ApiController@GetPosts');
        // Comment
        Route::post('/comment', 'ApiController@CreateComment');
        Route::get('/comment/{id}', 'ApiController@GetComment');
        Route::get('/comments/{id}', 'ApiController@GetComments');
        // Post likes
        Route::put('/post/like/{id}', 'ApiController@AddPostLike');
        // Users
        Route::get('/users', 'ApiController@GetAllUsers');

        // Skill Videos API's
        Route::get('/get-skills', 'ApiController@getVideos');
        Route::post('/skill-detail/{id}', 'ApiController@getVideoByTag');
        Route::put('/skill-detail/{id}', 'ApiController@updateVideo');
        
        //Vimeo Videos
        Route::get('/get_video_info', 'VideoController@getVideoInfo');
        Route::post('/add_video', 'VideoController@addVideo');
        Route::put('/edit_video', 'VideoController@editVideo');
        Route::delete('/delete_video', 'VideoController@deleteVideo');
        
        //Contact Search
        Route::post('/contact/search', 'ApiController@contactSearch');
        
        //Get Post Likes
        Route::post('/post/likes', 'ApiController@UserPostLikes');
        
        // Send messages
        Route::post('/send/message', 'ApiController@AddMessage');
        
        // Get All Conversation
        Route::get('/get-conversation/{id}', 'ApiController@getConversation');
        
        // Get My Conversations
        Route::get('/get-my-conversation', 'ApiController@getMyConversations');
        
        // Create Conversation
        Route::post('/create/conversation', 'ApiController@createConversation');
        
        // Add Participant
        Route::post('/add-participant', 'ApiController@AddParticipant');
    });

    
});