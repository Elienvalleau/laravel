<?php

namespace App\Http\Controllers\Admin;

use App\Note;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class NotesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $this->validate($request, Note::$rules["create"]);
        $status_create = Note::create($input);
        if($status_create){
            return redirect()->back()->with("success", "La note a bien été créée");
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
        $note = Note::findOrFail($id);
        return view("admin/notes/edit", compact("note"));
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
        $note_update = Note::findOrFail($id);
        $this->validate($request, Note::$rules["update"]);
        $status_create = $note_update->update($input);
        if($status_create){
            return redirect(route('utilisateur.index'))->with("success", "La note a bien été modifiée");
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
        $count = Note::destroy($id);
        if($count == 1)
        {
            return redirect()->back()->with("success", "La note a bien été supprimée");
        }
        else
        {
            return redirect()->back()->with("danger", "La note n'a pas été supprimée")->withInput();;
        }
    }
}
