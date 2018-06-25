<?php

/* ================== Homepage ================== */
Route::get('/', function() {
    return Redirect::to(config('laraadmin.adminRoute'));
});
Route::get('/home', 'HomeController@index');
Route::auth();

/* ================== Access Uploaded Files ================== */
Route::get('files/{hash}/{name}', 'LA\UploadsController@get_file');

/*
|--------------------------------------------------------------------------
| Admin Application Routes
|--------------------------------------------------------------------------
*/

$as = "";
if(\Dwij\Laraadmin\Helpers\LAHelper::laravel_ver() == 5.3) {
    $as = config('laraadmin.adminRoute').'.';

    // Routes for Laravel 5.3
    Route::get('/logout', 'Auth\LoginController@logout');
}

Route::group(['as' => $as, 'middleware' => ['auth', 'permission:ADMIN_PANEL']], function () {

    /* ================== Dashboard ================== */

    Route::get(config('laraadmin.adminRoute'), 'LA\DashboardController@index');
    Route::get(config('laraadmin.adminRoute'). '/dashboard', 'LA\DashboardController@index');

    /* ================== Users ================== */
    Route::resource(config('laraadmin.adminRoute') . '/users', 'LA\UsersController');
    Route::get(config('laraadmin.adminRoute') . '/user_dt_ajax', 'LA\UsersController@dtajax');

    /* ================== Uploads ================== */
    Route::resource(config('laraadmin.adminRoute') . '/uploads', 'LA\UploadsController');
    Route::post(config('laraadmin.adminRoute') . '/upload_files', 'LA\UploadsController@upload_files');
    Route::get(config('laraadmin.adminRoute') . '/uploaded_files', 'LA\UploadsController@uploaded_files');
    Route::post(config('laraadmin.adminRoute') . '/uploads_update_caption', 'LA\UploadsController@update_caption');
    Route::post(config('laraadmin.adminRoute') . '/uploads_update_filename', 'LA\UploadsController@update_filename');
    Route::post(config('laraadmin.adminRoute') . '/uploads_update_public', 'LA\UploadsController@update_public');
    Route::post(config('laraadmin.adminRoute') . '/uploads_delete_file', 'LA\UploadsController@delete_file');

    /* ================== Roles ================== */
    Route::resource(config('laraadmin.adminRoute') . '/roles', 'LA\RolesController');
    Route::get(config('laraadmin.adminRoute') . '/role_dt_ajax', 'LA\RolesController@dtajax');
    Route::post(config('laraadmin.adminRoute') . '/save_module_role_permissions/{id}', 'LA\RolesController@save_module_role_permissions');

    /* ================== Permissions ================== */
    Route::resource(config('laraadmin.adminRoute') . '/permissions', 'LA\PermissionsController');
    Route::get(config('laraadmin.adminRoute') . '/permission_dt_ajax', 'LA\PermissionsController@dtajax');
    Route::post(config('laraadmin.adminRoute') . '/save_permissions/{id}', 'LA\PermissionsController@save_permissions');

    /* ================== Departments ================== */
    Route::resource(config('laraadmin.adminRoute') . '/departments', 'LA\DepartmentsController');
    Route::get(config('laraadmin.adminRoute') . '/department_dt_ajax', 'LA\DepartmentsController@dtajax');

    /* ================== Employees ================== */
    Route::resource(config('laraadmin.adminRoute') . '/employees', 'LA\EmployeesController');
    Route::get(config('laraadmin.adminRoute') . '/employee_dt_ajax', 'LA\EmployeesController@dtajax');
    Route::post(config('laraadmin.adminRoute') . '/change_password/{id}', 'LA\EmployeesController@change_password');

    /* ================== Organizations ================== */
    Route::resource(config('laraadmin.adminRoute') . '/organizations', 'LA\OrganizationsController');
    Route::get(config('laraadmin.adminRoute') . '/organization_dt_ajax', 'LA\OrganizationsController@dtajax');

    /* ================== Backups ================== */
    Route::resource(config('laraadmin.adminRoute') . '/backups', 'LA\BackupsController');
    Route::get(config('laraadmin.adminRoute') . '/backup_dt_ajax', 'LA\BackupsController@dtajax');
    Route::post(config('laraadmin.adminRoute') . '/create_backup_ajax', 'LA\BackupsController@create_backup_ajax');
    Route::get(config('laraadmin.adminRoute') . '/downloadBackup/{id}', 'LA\BackupsController@downloadBackup');

    /* ================== Academies ================== */
    Route::resource(config('laraadmin.adminRoute') . '/academies', 'LA\AcademiesController');
    Route::get(config('laraadmin.adminRoute') . '/academy_dt_ajax', 'LA\AcademiesController@dtajax');

    /* ================== Courses ================== */
    Route::resource(config('laraadmin.adminRoute') . '/courses', 'LA\CoursesController');
    Route::get(config('laraadmin.adminRoute') . '/course_dt_ajax', 'LA\CoursesController@dtajax');

    /* ================== Chapters ================== */
    Route::resource(config('laraadmin.adminRoute') . '/chapters', 'LA\ChaptersController');
    Route::get(config('laraadmin.adminRoute') . '/chapter_dt_ajax', 'LA\ChaptersController@dtajax');

    /* ================== Plans ================== */
    Route::resource(config('laraadmin.adminRoute') . '/plans', 'LA\PlansController');
    Route::get(config('laraadmin.adminRoute') . '/plan_dt_ajax', 'LA\PlansController@dtajax');



    /* ================== UniModules ================== */
    Route::resource(config('laraadmin.adminRoute') . '/unimodules', 'LA\UniModulesController');
    Route::get(config('laraadmin.adminRoute') . '/unimodule_dt_ajax', 'LA\UniModulesController@dtajax');

    /* ================== Members ================== */
    Route::resource(config('laraadmin.adminRoute') . '/members', 'LA\MembersController');
    Route::get(config('laraadmin.adminRoute') . '/member_dt_ajax', 'LA\MembersController@dtajax');

    /* ================== Videos ================== */
    Route::resource(config('laraadmin.adminRoute') . '/videos', 'LA\VideosController');
    Route::get(config('laraadmin.adminRoute') . '/videos/{id}/show_video', 'LA\VideosController@show_video');
    Route::get(config('laraadmin.adminRoute') . '/video_dt_ajax', 'LA\VideosController@dtajax');


    /* ================== Categories ================== */
    Route::resource(config('laraadmin.adminRoute') . '/categories', 'LA\CategoriesController');
    Route::get(config('laraadmin.adminRoute') . '/category_dt_ajax', 'LA\CategoriesController@dtajax');

    /* ================== Course_Skills ================== */
    Route::resource(config('laraadmin.adminRoute') . '/course_skills', 'LA\Course_SkillsController');
    Route::get(config('laraadmin.adminRoute') . '/course_skill_dt_ajax', 'LA\Course_SkillsController@dtajax');

    /* ================== Course_Skills ================== */
    Route::resource(config('laraadmin.adminRoute') . '/skills', 'LA\SkillsController');
    Route::get(config('laraadmin.adminRoute') . '/skill_dt_ajax', 'LA\SkillsController@dtajax');

    /* ================== Forums ================== */
    Route::resource(config('laraadmin.adminRoute') . '/forums', 'LA\ForumsController');
    Route::get(config('laraadmin.adminRoute') . 'forum_dt_ajax', 'LA\ForumsController@dtajax');

    /* ================== Posts ================== */
    Route::resource(config('laraadmin.adminRoute') . '/posts', 'LA\PostsController');
    Route::get(config('laraadmin.adminRoute') . 'post_dt_ajax', 'LA\PostsController@dtajax');


	/* ================== Playlists ================== */
	Route::resource(config('laraadmin.adminRoute') . '/playlists', 'LA\PlaylistsController');
	Route::get(config('laraadmin.adminRoute') . '/playlist_dt_ajax', 'LA\PlaylistsController@dtajax');

	/* ================== PlayItems ================== */
	Route::resource(config('laraadmin.adminRoute') . '/playitems', 'LA\PlayItemsController');
	Route::get(config('laraadmin.adminRoute') . '/playitem_dt_ajax', 'LA\PlayItemsController@dtajax');

	/* ================== Messages ================== */
	Route::resource(config('laraadmin.adminRoute') . '/messages', 'LA\MessagesController');
	Route::get(config('laraadmin.adminRoute') . '/message_dt_ajax', 'LA\MessagesController@dtajax');
});
