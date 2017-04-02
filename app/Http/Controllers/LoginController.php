<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(Auth::check()){
            return redirect()->guest('/admin/utilisateur');
        }else{
            return view("login/index");
        }
    }

    public function connexion(Request $request)
    {
        $input = $request->all();
        /*$input['password'] = Hash::make($input['password']);
        dd($input);*/
        if(isset($input['remember']) && $input["remember"] == true)
        {
            Auth::attempt(array('email' => $input['email'], 'password' => $input['password']), true);
        }
        else
        {
            Auth::attempt(array('email' => $input['email'], 'password' => $input['password']));
        }
        if(Auth::check())
        {
            //return redirect(route('users.index'));
            return redirect()->guest('/admin/utilisateur');
        }
        else
        {
            return redirect(route('login'))->with("danger", "Combinaison email/password invalide");
        }
    }

    public function deconnexion()
    {
        Auth::logout();
        return redirect(route('login'))->with("info", "Vous venez de vous déconnecter");
    }
}
