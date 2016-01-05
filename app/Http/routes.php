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
        


Route::get('home', 'HomeController@index');

Route::controllers([
	'auth' => 'Auth\AuthController',
	'password' => 'Auth\PasswordController',
]);

Route::get('api/csrf', function() {
    return Session::token();
});

Route::filter('api.csrf', function($route, $request)
{
if (Session::token() != $request->header('X-Csrf-Token') )
{
    return Response::json('CSRF does not match', 400);
}
});
Route::get('api/csrf', function() {
    return Session::token();
});
Route::group(array('prefix' => 'api'), function() {
	// since we will be using this just for CRUD, we won't need create and edit
	// Angular will handle both of those forms
	// this ensures that a user can't access api/create or api/edit when there's nothing there
	Route::resource('candidates', 'CandidatesController');
        Route::resource('joboffers', 'JoboffersController');
        Route::resource('experience', 'ExperienceController',
                ['only' => ['index']]);
        Route::post('login','CandidatesController@login');
        
});

