<?php

namespace App;

//use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Hash;

class User extends Authenticatable
{
    protected $table = 'users';
    protected $fillable = array("id", "nom", "prenom", "email", "password", "login", "avatar","is_admin");
    protected $hidden = array('password');
    public static $rules = array(
        "create" => array(
            'nom' => 'required|string|min:2',
            'prenom' => 'required|string|min:2',
            'login' => 'required|string|min:2',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:2|confirmed',
            'avatar' => 'string',
            'is_admin' => 'boolean',

        ),
        "update" => array(
            'nom' => 'required|string|min:2',
            'prenom' => 'required|string|min:2',
            'login' => 'required|string|min:2',
            'email' => 'required|email',
            'password' => 'string|min:2|confirmed',
            'avatar' => 'string',
            'is_admin' => 'boolean',
        )
    );

    public function setPasswordAttribute($value)
    {
        $this->attributes["password"] = Hash::make($value);
    }

    public function getPasswordAttribute()
    {
        return $this->attributes["password"];
    }

    public function scopeRecherche($query, $value)
    {

    }

    /*public function notables()
    {
        return $this->belongsToMany('App\Notable', 'user_notable', 'user_id', 'notable_id')->withPivot('note');
    }*/

    public function notes()
    {
        return $this->hasMany('App\Note', 'user_id', 'id');
    }

    public function commentaires()
    {
        return $this->hasMany('App\Commentaire', "user_id", "id");
    }

}
