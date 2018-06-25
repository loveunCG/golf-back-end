<?php

return [
    'playlist_rules' => array(
        'user_id' => 'required',
        'name' => 'required'
    ),
    'playitem_rules' => array(
        'playlist_id' => 'required',
        'video_uid' => 'required'
    ),
    'usermessage_rules' => array(
        'receiver' => 'required',
        'message' => 'required'
    ),
    'usermessagethread_rules' => array(
        'receiver' => 'required'
    ),
    'userforum_rules' => array(
        'user_id' => 'required',
        'title' => 'required',
        'content' => 'required',
    ),
    'comments_rule' => array(
        'body'          => 'required|min:3',
        'post_id'   => 'required',
    ),
    'post_rules' => array(
        'thread_id' => 'required',
        'content'   => 'required|min:3',
        'title'     => 'required|min:3'
    )
];