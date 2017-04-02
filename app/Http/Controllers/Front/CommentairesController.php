<?php

namespace App\Http\Controllers\Front;

use App\Commentaire;
use App\Tag;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CommentairesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $commentaires = Commentaire::with('tags')->paginate(10);
        return view("admin/commentaires/show", compact('commentaires'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
        $this->validate($request, Commentaire::$rules["create"]);
        $status_create = Commentaire::create($input);
        $status_create->saveTags($request->get('tags'));
        if($status_create){
            return redirect()->back()->with("success", "Le commentaire a bien été créé");
        }
        else{
            return redirect()->back()->with("danger", "Une erreur est surevenue, vérifiez votre saisie")->withInput();
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
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $commentaire = Commentaire::findOrFail($id);
        return view("admin/commentaires/edit", compact("commentaire"));
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
        $commentaire_update = Commentaire::findOrFail($id);
        $this->validate($request, Commentaire::$rules["update"]);
        $status_create = $commentaire_update->update($input);
        /*$status_create->saveTags($request->get('tags'));*/
        if($status_create){
            return redirect(route('utilisateur.index'))->with("success", "Le commentaire a bien été modifié");
        }
        else{
            return redirect()->back()->with("danger", "Une erreur est surevenue, vérifiez votre saisie")->withInput();
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $count = Commentaire::destroy($id);
        if($count == 1)
        {
            return redirect()->back()->with("success", "Le commentaire a bien été supprimé");
        }
        else
        {
            return redirect()->back()->with("danger", "Le commentaire n'a pas été supprimé")->withInput();;
        }
    }

    public function tag ($nom) {
        $tag = Tag::where('nom', $nom)->first();
        $commentaires = $tag->commentaires()->paginate(10);
        return view("admin/commentaires/show", compact('commentaires'));
    }

    public function tag2 ($nom) {
        $tag = Tag::where('nom', $nom)->first();
        $commentaires = $tag->commentaires()->paginate(10);
        return view("front/commentaires/show", compact('commentaires'));
    }
}
