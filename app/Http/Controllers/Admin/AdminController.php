<?php

namespace App\Http\Controllers\Admin;

use App\Commentaire;
use App\Note;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Intervention\Image\Facades\Image;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::get();
        /*$users->load("tags");
        $users->load("commentaires");*/
        return view("admin/users/index", compact("users"));
    }

    public function stats()
    {
        return view("admin/stats/index");
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view("admin/users/create");
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $input = $request->all();
        $this->validate($request, User::$rules["create"]);
        $status_create = User::create($input);
        if($status_create){
            return redirect(route('utilisateur.show', $status_create))->with("success", "Le compte a bien été créé");
        }
        else{
            return redirect()->back()->with("danger", "Une erreur est surevenue, vérifiez votre saisie")->withInput();//
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
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

        return view("admin/users/show", compact("user", 'commentaires', 'notes',  'userSuivant', 'userPrecedent', 'avg',
                                                'avg_laravel', 'avg_linux', 'avg_html', 'avg_css', 'avg_android',
                                                'avg_management'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user = User::findOrFail($id);
        return view("admin/users/edit", compact("user"));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $input = $request->all();
        $user_update = User::findOrFail($id);
        $this->validate($request, User::$rules["update"]);
        $status_create = $user_update->update($input);
        if($status_create){
            return redirect(route('utilisateur.show', $user_update))->with("success", "Le profil a bien été modifié");
        }
        else{
            return redirect()->back()->with("danger", "Une erreur est surevenue, vérifiez votre saisie")->withInput();
        }
    }

    public function update_avatar(Request $request){

        if($request->hasFile('avatar')){
            $input = $request->all();
            $avatar = $request->file('avatar');
            $filename = time() . '.' . $avatar->getClientOriginalExtension();
            Image::make($avatar)->resize(300, 300)->save( public_path('/uploads/avatars/' . $filename ) );

            $user = User::findOrFail($input["id"]);
            $user->avatar = $filename;
            $user->save();
        }
        return redirect()->back();
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $count = User::destroy($id);
        if($count == 1)
        {
            return redirect()->back()->with("success", "L'utilisateur a bien été supprimé");
        }
        else
        {
            return redirect()->back()->with("danger", "L'utilisateur n'a pas été supprimé")->withInput();;
        }
    }


    public function search(Request $request)
    {
        $query = $request->get('query');

        $users = User::where('prenom', 'LIKE', "%$query%")
            ->orWhere('nom', 'LIKE', "%$query%")
            ->get();

        return view('admin/users/index', compact('users'));
    }
}
