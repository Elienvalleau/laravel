<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('login/index');
});

Route::get("login",
    array(
        "as" => "login",
        "uses" => "LoginController@index"
    ));

Route::post("connexion",
    array(
        "as" => "connexion",
        "uses" => "LoginController@connexion"
    ));

Route::get("deconnexion",
    array(
        "as" => "deconnexion",
        "uses" => "LoginController@deconnexion"
    ));


Route::group(['prefix' => 'front', 'middleware' => ['auth'], "namespace" => "Front"], function()
{
    Route::post('search', ['as' => 'search', 'uses' => 'UsersController@search']);
    Route::resource("users", "UsersController");
    Route::resource("stats", "StatsController");
    Route::resource("commentaires", "CommentairesController");
    Route::get('/users/tag/{nom}', 'CommentairesController@tag2')->name('commentaires2.tag');
    Route::get('/tag/{nom}', 'CommentairesController@tag')->name('commentaires.tag');

});

Route::group(['prefix' => 'admin', 'middleware' => ['auth', 'admin'], "namespace" => "Admin"], function()
{
    Route::resource('utilisateur', 'AdminController');
    Route::resource('notes', 'NotesController');
    Route::post('searchs', ['as' => 'searchs', 'uses' => 'AdminController@search']);
    Route::post('profile', 'AdminController@update_avatar');
    Route::resource("stats_admin", "AdminStatsController");

});
