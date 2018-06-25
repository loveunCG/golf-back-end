<?php

namespace App\Http\Controllers;

use App\Models\Video;
use Illuminate\Http\Request;
use App\Http\Requests;
use Validator;
// Models
use App\Models\Playlist;
use App\Models\PlayItem;
use App\Models\Message;
use App\Models\Forum;
use App\User;
use App\UserMessages;
use App\Events\EventMessage;
use DB;

class ApiController extends Controller {

    protected $statusCode = [
        'ERR_PAYLOAD_INVALID' => 400,
        'STATUS_SUCCESS' => 200,
        'STATUS_LOGIC_ERROR' => 400,
        'STATUS_UNAUTHORIZED' => 401,
        'STATUS_FORRBIDDEN' => 403,
        'STATUS_NOT_FOUND' => 404,
        'STATUS_INTERNAL_SERVER_ERROR' => 500
    ];
    protected $rules;

    public function __construct() {
        $this->rules = config('rules');
        $this->host = "http://$_SERVER[HTTP_HOST]/";
    }

    private function failResponse($status, $errors) {
        $status_code = $this->statusCode[$status];
        $data_error = $errors;
        return response()->json([
                    'status' => $status_code,
                    'success' => false,
                    'message' => $data_error,
                        ], $status_code);
    }

    private function jsonResponse($status, $data, $message = '', $success = true) {

        $status_code = $this->statusCode[$status];

        $jsonData = array('status' => $status_code);
        if (!empty($message)) {
            $jsonData['message'] = $message;
        }
        if ($data !== null)
            $jsonData['data'] = $data;
        $jsonData['success'] = $success;
        return response()->json($jsonData, $status_code);
    }

    private function copyObject(&$newObj, $obj) {
        foreach ($obj as $key => $value) {
            $newObj[$key] = $obj[$key];
        }
    }

    private function checkValidation($request, $rule) {
        $validator = Validator::make($request->all(), $this->rules[$rule]);
        return $validator;
    }

    /**
     * Playlist APIs
     */
    public function CreatePlayList(Request $request) {

        // validation
        $validator = $this->checkValidation($request, 'playlist_rules');
        if ($validator->fails()) {
            return $this->failResponse('STATUS_LOGIC_ERROR', $validator->errors());
        }

        $playlist = new Playlist();
        $this->copyObject($playlist, $request->all());
        $playlist->save();

        return $this->jsonResponse('STATUS_SUCCESS', $playlist, 'Playlist is successfully created');
    }

    public function GetPlayList($id, Request $request) {
        // $id is user id
        $playlist = Playlist::where('user_id', '=', $id)->get();
        foreach ($playlist as &$list) {

            $playitems = PlayItem::Join('videos', 'video_uid', '=', 'videos.id')
                            ->where('playlist_id', '=', $list->id)->get();

            $list['playitems'] = $playitems;
        }
        return $this->jsonResponse('STATUS_SUCCESS', $playlist, 'Playlists are successfully loaded');
    }

    public function UpdatePlayList($id, Request $request) {
        $playlist = Playlist::find($id);
        if ($playlist) {
            // validation
            $validator = $this->checkValidation($request, 'playlist_rules');
            if ($validator->fails()) {
                return $this->failResponse('STATUS_LOGIC_ERROR', $validator->errors());
            }

            $this->copyObject($playlist, $request->all());
            $playlist->save();
            return $this->jsonResponse('STATUS_SUCCESS', null, 'Playlist is successfully updated');
        } else {
            return $this->failResponse('STATUS_NOT_FOUND', 'Playlist not found');
        }
    }

    public function DeletePlayList($id, Request $request) {
        $playlist = Playlist::find($id);
        if ($playlist) {
            // delete playitems related the playlist
            PlayItem::where('playlist_id', '=', $id)->delete();
            $playlist->delete();
            return $this->jsonResponse('STATUS_SUCCESS', null, 'Playlist is successfully deleted');
        } else {
            return $this->failResponse('STATUS_NOT_FOUND', 'Playlist not found');
        }
    }

    /**
     * Playitem APIs
     */
    public function CreatePlayItem(Request $request) {
        // validation
        $validator = $this->checkValidation($request, 'playitem_rules');
        if ($validator->fails()) {
            return $this->failResponse('STATUS_LOGIC_ERROR', $validator->errors());
        }

        $playitem = new PlayItem();
        $this->copyObject($playitem, $request->all());
        $playitem->save();

        return $this->jsonResponse('STATUS_SUCCESS', $playitem, 'PlayItem is successfully created');
    }

    public function GetPlayItems($id, Request $request) {
        // $id is playlist's id
        $playitem = PlayItem::where('playlist_id', '=', $id)->get();
        return $this->jsonResponse('STATUS_SUCCESS', $playitem, 'PlayItems are successfully loaded');
    }

    public function UpdatePlayItem($id, Request $request) {
        $playitem = PlayItem::find($id);
        if ($playitem) {
            // validation
            $validator = $this->checkValidation($request, 'playitem_rules');
            if ($validator->fails()) {
                return $this->failResponse('STATUS_LOGIC_ERROR', $validator->errors());
            }

            $this->copyObject($playitem, $request->all());
            $playitem->save();
            return $this->jsonResponse('STATUS_SUCCESS', null, 'PlayItem is successfully updated');
        } else {
            return $this->failResponse('STATUS_NOT_FOUND', 'PlayItem not found');
        }
    }

    public function DeletePlayItem($id, Request $request) {
        $playitem = PlayItem::find($id);
        if ($playitem) {
            $playitem->delete();
            return $this->jsonResponse('STATUS_SUCCESS', null, 'PlayItem is successfully deleted');
        } else {
            return $this->failResponse('STATUS_NOT_FOUND', 'PlayItem not found');
        }
    }

    /**
     * Message APIs
     */
    public function CreateMessage(Request $request) {
        $currentUser = \Tymon\JWTAuth\Facades\JWTAuth::authenticate();
        // validation
        $validator = $this->checkValidation($request, 'usermessage_rules');
        if ($validator->fails()) {
            return $this->failResponse('STATUS_LOGIC_ERROR', $validator->errors());
        }

        $message = new \App\Models\Ext\Messages;
        $message->receiver = $request->receiver;
        $message->message = $request->message;
        $message->sender = $currentUser->id;
        $message->save();

        try {
            event(new EventMessage($message));
        } catch (\Exception $e) {
            
        }

        return $this->jsonResponse('STATUS_SUCCESS', $message, 'Message is successfully created');
    }

    public function GetAllMessages(Request $request) {
        $currentUser = \Tymon\JWTAuth\Facades\JWTAuth::authenticate();
        $messages = \App\Models\Ext\Messages::where('sender', $currentUser->id)
                ->orWhere('receiver', $currentUser->id)
                ->with(
                [
                    'sender' => function($query) {
                        $query->select(['id', 'first_name', 'last_name']);
                    },
                    'receiver' => function($query) {
                        $query->select(['id', 'first_name', 'last_name']);
                    }])
                ->groupBy('receiver')
                ->orderBy('created_at', 'desc')
                ->get();
        return $this->jsonResponse('STATUS_SUCCESS', $messages, 'Messages are successfully loaded');
    }

    public function GetMessagesThread(Request $request) {
        $validator = $this->checkValidation($request, 'usermessagethread_rules');
        if ($validator->fails()) {
            return $this->failResponse('STATUS_LOGIC_ERROR', $validator->errors());
        }
        $currentUser = \Tymon\JWTAuth\Facades\JWTAuth::authenticate();
        $messages = \App\Models\Ext\Messages::where('sender', $currentUser->id)
                ->where('receiver', $request->receiver)
                ->with(
                [
                    'sender' => function($query) {
                        $query->select(['id', 'first_name', 'last_name']);
                    },
                    'receiver' => function($query) {
                        $query->select(['id', 'first_name', 'last_name']);
                    }])
                ->orderBy('created_at', 'asc')
                ->get();
        return $this->jsonResponse('STATUS_SUCCESS', $messages, 'Messages are successfully loaded');
    }

    
    public function UpdateMessage($id, Request $request) {
        return $this->jsonResponse('STATUS_SUCCESS', null, 'Messages are successfully updated');
    }

    public function UpdateUnreadMessage(Request $request) {

        $message = \App\Models\Ext\Messages::find($request->id)->update(['read' => 1]);
        
        return $this->jsonResponse('STATUS_SUCCESS', null, 'Messages are successfully updated');
    }

    public function DeleteMessage($id, Request $request) {
        
    }

    /**
     * Academy Forums APIs
     */
    public function CreateForum(Request $request) {
        // validation
        $validator = $this->checkValidation($request, 'userforum_rules');
        if ($validator->fails()) {
            return $this->failResponse('STATUS_LOGIC_ERROR', $validator->errors());
        }

        $forum = new Forum();
        $this->copyObject($forum, $request->all());
        $forum->save();

        return $this->jsonResponse('STATUS_SUCCESS', $forum, 'Forum is successfully created');
    }

    public function GetForums($id, Request $request) {
        
    }

    public function UpdateForum($id, Request $request) {
        
    }

    public function DeleteForum($id, Request $request) {
        
    }

    /**
     * Users
     */
    public function GetAllUsers(Request $request) {
        if ($request->receiver) {
            $users = DB::select(
                            "SELECT uu.*, IF((LENGTH(mm.message) > 60), CONCAT(SUBSTRING(mm.message, 1, 60), '...'),  mm.message) as message, mm.created_at as time from (
                    SELECT u.id, u.name, u.image,
                    SUM(IF(m.status = 1, 1, 0)) AS unreads
                    FROM users u
                    LEFT JOIN 
                        (
                            SELECT * FROM user_messages
                            WHERE receiver = '$request->receiver'
                        ) m
                        
                    ON (u.id = m.sender)
                    GROUP BY u.id
                    ORDER BY unreads DESC
                ) uu
                LEFT JOIN (
                     SELECT * FROM user_messages
                     WHERE receiver = '$request->receiver'
                     ORDER BY created_at desc
                     LIMIT 1
                ) mm
                ON (uu.id = mm.sender)"
            );
        } else {
            $users = User::all();
        }

        return $this->jsonResponse('STATUS_SUCCESS', $users, 'Users are successfully loaded');
    }

    /*
     *  Video API
     */

    public function getVideos() {

        // Check if tag is set
        if (!isset($request->tag)) {
            return response()->json([
                        'message' => 'STATUS_LOGIC_ERROR',
                        'status' => 400
            ]);
        }

        // Request videos from database
        $videos = Video::all();

        if ($videos) {
            return response()->json([
                        'data' => $videos,
                        'message' => 'STATUS_SUCCESS',
                        'status' => 200
            ]);
        } else {
            return response()->json([
                        'data' => $videos,
                        'message' => 'VIDEOS_NOT_FOUND',
                        'status' => 404
            ]);
        }
    }

    /*
     *  Search Video by Tag API
     */

    public function getVideoByTag($id, Request $request) {

        // Check if tag is set
        if (!isset($request->tag)) {
            return response()->json([
                        'message' => 'STATUS_LOGIC_ERROR',
                        'status' => 400
            ]);
        }

        // Request videos from database
        $videos = Video::where('user_id', $id)
                ->where('tag', $request->tag)
                ->get();

        if ($videos) {
            return response()->json([
                        'data' => $videos,
                        'message' => 'STATUS_SUCCESS',
                        'status' => 200
            ]);
        } else {
            return response()->json([
                        'data' => $videos,
                        'message' => 'VIDEOS_NOT_FOUND',
                        'status' => 404
            ]);
        }
    }

    /*
     *  Video Update unviewd and favourite
     */

    public function updateVideo($id, Request $request) {

        // Check if favourite and unviewed is set
        if (!isset($request->favourite) && !isset($request->unviewed)) {
            return response()->json([
                        'message' => 'STATUS_LOGIC_ERROR',
                        'status' => 400
            ]);
        }

        if (isset($request->favourite)) {
            $favourite = Video::where('id', $request->id)
                    ->where('user_id', $id)
                    ->update(['favourite' => $request->favourite]);

            if ($favourite) {
                return response()->json([
                            'message' => 'STATUS_SUCCESS',
                            'status' => 200
                ]);
            } else {
                return response()->json([
                            'message' => 'UPDATION_FAILED',
                            'status' => 404
                ]);
            }
        } elseif (isset($request->unviewed)) {
            $unviewed = Video::where('id', $request->id)
                    ->where('user_id', $id)
                    ->update(['unviewed' => $request->unviewed]);

            if ($unviewed) {
                return response()->json([
                            'message' => 'STATUS_SUCCESS',
                            'status' => 200
                ]);
            } else {
                return response()->json([
                            'message' => 'UPDATION_FAILED',
                            'status' => 404
                ]);
            }
        }
    }
    
    /**
     * This function will return user list while searching from first name and last name
     */
    public function contactSearch(Request $request) {
        
        // validation
        $rule = ['term' => 'required|min:3'];
        $term = $request->q;
        $validator = Validator::make(['term' => $term], $rule);
        if ($validator->fails()) {
            return $this->failResponse('STATUS_LOGIC_ERROR', $validator->errors());
        }
        $users = \App\Models\User::where('first_name', 'like', $term. '%')
            ->orWhere('last_name', 'like', $term . '%')
            ->select('id','first_name','last_name')
            ->limit(10)
            ->get();
        if($users->count()) {
            return $this->jsonResponse('STATUS_SUCCESS', $users, 'Users are successfully loaded');
        }
        return $this->failResponse('STATUS_NOT_FOUND', 'Users not found.');
    }
    
    /**
     * Create post comment
     */

    public function CreateComment(Request $request) {
        
        $post = \Riari\Forum\Models\Post::find($request->post_id);
        
        
        if ($post) {
            $validator = $this->checkValidation($request, 'comments_rule');
            if ($validator->fails()) {
                return $this->failResponse('STATUS_LOGIC_ERROR', $validator->errors());
            }
            $comment = new \App\Models\Comment;
            $currentUser = \Tymon\JWTAuth\Facades\JWTAuth::authenticate();
            $comment->user_id = $currentUser->id;
            $comment->body = $request->body;
            $comment->post_id = $request->post_id;
            $comment->save();
            $comment->load([
                    'user' => function($query) {
                        $query->select(['id', 'first_name', 'last_name']);
                    }]);
            //Add +1 in comments count
            $post->total_comments = $post->total_comments+1;
            
            $thread = \App\Models\Thread::find($post->thread_id)->update(['total_comments'=> DB::raw('total_comments + 1')]);
        
            $post->save();
        return $this->jsonResponse('STATUS_SUCCESS', $comment, 'Comment is successfully created');
        } else {
            return response()->json([
                        'data' => $comments,
                        'message' => 'Post not found',
                        'status' => 404
            ]);
        }
        
    }
    
    /**
     * Get comments from post id
     * @param type $id
     * @param Request $request
     * @return type
     */
    public function GetComments($id, Request $request) {
        
        // Request videos from database
        $comments = \App\Models\Comment::where('post_id', $id)
                ->with([
                    'user' => function($query) {
                        $query->select(['id', 'first_name', 'last_name']);
                    }])
                ->get();
                

        if ($comments) {
            return response()->json([
                        'data' => $comments,
                        'message' => 'STATUS_SUCCESS',
                        'status' => 200
            ]);
        } else {
            return response()->json([
                        'data' => $comments,
                        'message' => 'Comments not found',
                        'status' => 404
            ]);
        }
    }
    
    /**
     * Get single comment from id
     * @param type $id
     * @param Request $request
     * @return type
     */
    public function GetComment($id, Request $request) {
        
        // Request videos from database
        $comments = \App\Models\Comment::where('id', $id)
                ->with([
                    'user' => function($query) {
                        $query->select(['id', 'first_name', 'last_name']);
                    }])
                ->get();
                

        if ($comments) {
            return response()->json([
                        'data' => $comments,
                        'message' => 'STATUS_SUCCESS',
                        'status' => 200
            ]);
        } else {
            return response()->json([
                        'data' => $comments,
                        'message' => 'Comments not found',
                        'status' => 404
            ]);
        }
    }
    
    /**
     * Get single comment from id
     * @param type $id
     * @param Request $request
     * @return type
     */
    public function AddPostLike($id, Request $request) {
        
        $post = \App\Models\Ext\Post::find($id);
        if ($post) {
            //add post id and user id in likes
            //add like count in thread
            $currentUser = \Tymon\JWTAuth\Facades\JWTAuth::authenticate();
            $user_id = $currentUser->id;
            
            $likeCount = \App\Models\UserPostLike::where('user_id',$user_id)->where('post_id',$id)->count();
            if($likeCount > 0){
                return response()->json([
                    'message' => 'User already like this post',
                    'status' => 403
                ]);
                
            } else {
                
                $post->total_likes = $post->total_likes+1;
                $post->save();
                $userPostLike = \App\Models\UserPostLike::create(['user_id'=>$user_id, 'post_id'=>$id]);
                $thread = \App\Models\Thread::find($post->thread_id)->update(['total_likes'=> DB::raw('total_likes + 1')]);
                
            }
            
            return response()->json([
                        'data' => $post,
                        'message' => 'STATUS_SUCCESS',
                        'status' => 200
            ]);
        } else {
            return response()->json([
                        'data' => $post,
                        'message' => 'Post not found',
                        'status' => 404
            ]);
        }
    }
    
    /*
     * 
     */
    public function CreatePost(Request $request) {
        // validation
        $validator = $this->checkValidation($request, 'post_rules');
        if ($validator->fails()) {
            return $this->failResponse('STATUS_LOGIC_ERROR', $validator->errors());
        }
        $currentUser = \Tymon\JWTAuth\Facades\JWTAuth::authenticate();
        $post = new \App\Models\Ext\Post;
        $post->thread_id = $request->thread_id;
        $post->author_id = $currentUser->id;
        $post->title = $request->title;
        $post->content = $request->content;
        $post->save();
        $post->load([
                    'author' => function($query) {
                        $query->select(['id', 'first_name', 'last_name']);
                    }]);
        $thread = \App\Models\Thread::find($post->thread_id)->update(['total_posts'=> DB::raw('total_posts + 1')]);
            
        return response()->json([
        'data' => $post,
        'message' => 'STATUS_SUCCESS',
        'status' => 200]);
    }
    
    /**
     * Get comments from post id
     * @param type $id
     * @param Request $request
     * @return type
     */
    public function GetPosts($id, Request $request) {
        
        // Request videos from database
        $posts = \App\Models\Ext\Post::where('thread_id', $id)
                ->with([
                    'author' => function($query) {
                        $query->select(['id', 'first_name', 'last_name']);
                    },
                            'comments' => function($query) {
                        $query->with([
                    'user' => function($query) {
                        $query->select(['id', 'first_name', 'last_name']);
                    }]);
                    },
                            'likes' => function($query) {
                        $query->with([
                    'user' => function($query) {
                        $query->select(['id', 'first_name', 'last_name']);
                    }]);
                    }])
                ->get();
                

        if ($posts) {
            return response()->json([
                        'data' => $posts,
                        'message' => 'STATUS_SUCCESS',
                        'status' => 200
            ]);
        } else {
            return response()->json([
                        'data' => $posts,
                        'message' => 'Posts not found in thread',
                        'status' => 404
            ]);
        }
    }
    
    /**
     * Get likes from post id
     * @param type $id
     * @param Request $request
     * @return type
     */
    public function UserPostLikes(Request $request) {
        
        if (!isset($request->post_id)) {
            return response()->json([
                        'message' => 'STATUS_LOGIC_ERROR',
                        'status' => 404
            ]);
        }
        // Request videos from database
        $postId = $request->post_id;
        $posts = \App\Models\UserPostLike::where('post_id', $postId)->with(
                [
                    'user' => function($query) {
                        $query->select(['id', 'first_name', 'last_name']);
                    }
                ]
                )->get();
                

        if ($posts) {
            return response()->json([
                        'data' => $posts,
                        'message' => 'STATUS_SUCCESS',
                        'status' => 200
            ]);
        } else {
            return response()->json([
                        'data' => $posts,
                        'message' => 'Likes not found in this post',
                        'status' => 404
            ]);
        }
    }
    
    public function AddMessage(Request $request) {
        
        // Request from database
        $currentUser    = \Tymon\JWTAuth\Facades\JWTAuth::authenticate();
        $user_id        = $currentUser->id;
        
        if($request->conversation_id){
            $conversationId = $request->conversation_id;
        } else {
            $conversation   = \App\Models\Conversation::create(['name'=>'Conversation']);
            $conversationId = $conversation->id;
        }
        if($request->message){
            $message        = $request->message;
        } else {
            $message        = "Hi";
        }
        $checkParticipant = \App\Models\Participant::where('conversation_id',$conversationId)->where('user_id',$user_id)->count();
        if($checkParticipant>0){
            //do nothing
        } else {
            $participant    = \App\Models\Participant::create(['conversation_id'=>$conversationId,'user_id'=>$user_id]);
        }
        
        $message        = \App\Models\Message::create(['message'=>$message,'conversation_id'=>$conversationId,'user_id'=>$user_id]);
        
        $conversation   = \App\Models\Conversation::where('id', $conversationId)->with('participant')->with('message')->get();
                

        if ($conversation) {
            return response()->json([
                        'data' => $conversation,
                        'message' => 'STATUS_SUCCESS',
                        'status' => 200
            ]);
        } else {
            return response()->json([
                        'data' => $conversation,
                        'message' => 'Likes not found in this post',
                        'status' => 404
            ]);
        }
    }
    
    public function getConversation($id) {
        
        $currentUser    = \Tymon\JWTAuth\Facades\JWTAuth::authenticate();
        $user_id        = $currentUser->id;
        
        $conversation   = \App\Models\Conversation::where('id', $id)->with('participant')->with('message')->get();
                
        if ($conversation) {
            return response()->json([
                        'data' => $conversation,
                        'message' => 'STATUS_SUCCESS',
                        'status' => 200
            ]);
        } else {
            return response()->json([
                        'data' => $conversation,
                        'message' => 'Likes not found in this post',
                        'status' => 404
            ]);
        }
    }
    
    public function getMyConversations() {
        
        $currentUser    = \Tymon\JWTAuth\Facades\JWTAuth::authenticate();
        $user_id        = $currentUser->id;
        
        $participant    = \App\Models\Participant::where('user_id', $user_id)->with('conversation')->with('message')->get();
                
        if ($participant) {
            return response()->json([
                        'data' => $participant,
                        'message' => 'STATUS_SUCCESS',
                        'status' => 200
            ]);
        } else {
            return response()->json([
                        'data' => $participant,
                        'message' => 'Likes not found in this post',
                        'status' => 404
            ]);
        }
    }
    
    public function createConversation(Request $request) {
        
        // Request from database
        $currentUser    = \Tymon\JWTAuth\Facades\JWTAuth::authenticate();
        $user_id        = $currentUser->id;
        
        $conversation   = \App\Models\Conversation::create(['name'=>'Conversation']);
        $conversationId = $conversation->id;
        $message        = "Hi";
        $participant    = \App\Models\Participant::create(['conversation_id'=>$conversationId,'user_id'=>$user_id]);
//        $message        = \App\Models\Message::create(['message'=>$message,'conversation_id'=>$conversationId,'user_id'=>$user_id]);
        
        $conversation   = \App\Models\Conversation::where('id', $conversationId)->with('participant')->get();
         
        if ($conversation) {
            return response()->json([
                        'data' => $conversation,
                        'message' => 'STATUS_SUCCESS',
                        'status' => 200
            ]);
        } else {
            return response()->json([
                        'data' => $conversation,
                        'message' => 'Likes not found in this post',
                        'status' => 404
            ]);
        }
    }
    
    public function AddParticipant(Request $request) {
        
        $conversationId = $request->conversation_id;
        $participantId  = $request->participant_id;
        $createParticipant    = \App\Models\Participant::create(['conversation_id'=>$conversationId,'user_id'=>$participantId]);
        $participant    = \App\Models\Participant::where('id',$createParticipant->id)->with([
            'user' => function($query) {
                $query->select(['id', 'first_name', 'last_name']);
            }])->get(); 
        if ($participant) {
            return response()->json([
                        'data' => $participant,
                        'message' => 'STATUS_SUCCESS',
                        'status' => 200
            ]);
        } else {
            return response()->json([
                        'data' => $participant,
                        'message' => 'Likes not found in this post',
                        'status' => 404
            ]);
        }
    }

}
