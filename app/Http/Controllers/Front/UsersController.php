<?php

namespace App\Http\Controllers\Front;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;

class UsersController extends Controller
{

    public function index()
    {
        $users = User::get();
        /*$users->load("tags");
        $users->load("commentaires");*/
        return view("front/users/index", compact("users"));
    }

    public function show($id)
    {
        $user = User::findOrFail($id);
        $user->load("commentaires", "notes");
        $userSuivant = $id+1;
        $userPrecedent = $id-1;
        $avg = DB::table('notes')
            ->where('user_id', '=', $id)
            ->avg('note');

        $avg_laravel = DB::table('notes')
            ->where('user_id', '=', $id)
            ->where('epreuve', 'LIKE', 'laravel')
            ->avg('note');

        $avg_linux = DB::table('notes')
            ->where('user_id', '=', $id)
            ->where('epreuve', 'LIKE', 'linux')
            ->avg('note');

        $avg_html = DB::table('notes')
            ->where('user_id', '=', $id)
            ->where('epreuve', 'LIKE', 'html')
            ->avg('note');

        $avg_css = DB::table('notes')
            ->where('user_id', '=', $id)
            ->where('epreuve', 'LIKE', 'css')
            ->avg('note');

        $avg_android = DB::table('notes')
            ->where('user_id', '=', $id)
            ->where('epreuve', 'LIKE', 'android')
            ->avg('note');

        $avg_management = DB::table('notes')
            ->where('user_id', '=', $id)
            ->where('epreuve', 'LIKE', 'management')
            ->avg('note');

        return view("front/users/show", compact("user", 'commentaires', 'notes',  'userSuivant', 'userPrecedent', 'avg',
            'avg_laravel', 'avg_linux', 'avg_html', 'avg_css', 'avg_android',
            'avg_management'));
    }

    public function search(Request $request)
    {
        $query = $request->get('query');

        $users = User::where('prenom', 'LIKE', "%$query%")
            ->orWhere('nom', 'LIKE', "%$query%")
            ->get();

        return view('front/users/index', compact('users'));
    }


}
