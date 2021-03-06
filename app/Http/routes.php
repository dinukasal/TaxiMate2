<?php

/*
|--------------------------------------------------------------------------
| Routes File
|--------------------------------------------------------------------------
|
| Here is where you will register all of the routes in an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/

Route::get('/', function () {
    return view('welcome');
});

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| This route group applies the "web" middleware group to every route
| it contains. The "web" middleware group is defined in your HTTP
| kernel and includes session state, CSRF protection, and more.
|
*/

Route::group(['middleware' => ['web']], function () {
    //
});

Route::get('a',['middleware'=>'auth.basic']);

Route::get('test','TestController@test');

Route::post('request',function(){
	return view('request');
});

Route::post('login','LoginController@login');

Route::get('login','LoginController@login');

Route::get('drivers','DriverController@getAll');

Route::post('getdriverprofile','DriverController@getProfile');

Route::post('updatedriverprofile','DriverController@updateProfile');

Route::post('getdriver','DriverController@getDriver');

Route::post('register','UserController@registerUser');

Route::post('updateuser','UserController@registerUser');

Route::post('changePassword','UserController@changePassword');

Route::post('getuser','UserController@getUser');

Route::post('checkavailability','DriverController@checkAvailability');

Route::post('updaterates','DriverController@updateRates');

Route::post('requesttaxi','DriverController@requestTaxi');

Route::get('availabledrivers','DriverController@getAvailableDrivers');