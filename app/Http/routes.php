<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});

/* ================== Homepage + Admin Routes ================== */

require __DIR__.'/admin_routes.php';

/*=====  Extend Routes for Modules  ======*/

Route::resource(config('laraadmin.adminRoute') . '/academies', 'AcademiesController');
Route::resource(config('laraadmin.adminRoute') . '/forums', 'ForumsController');
Route::resource(config('laraadmin.adminRoute') . '/posts', 'PostsController');
Route::resource(config('laraadmin.adminRoute') . '/courses', 'CoursesController');
Route::resource(config('laraadmin.adminRoute') . '/unimodules', 'UniModulesController');
Route::resource(config('laraadmin.adminRoute') . '/chapters', 'ChaptersController');

Route::auth();

Route::get('/home', 'HomeController@index');
