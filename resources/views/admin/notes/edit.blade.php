@extends('admin/default')
@section('content')
    <div class="row">
        <div class="container col-md-offset-4 col-md-4">
            <div class="box-header with-border">
                <h3 class="box-title">Modification de la note de {{ $note->auteur }}</h3>
            </div>
            <div class="box-body">
                {!! BootForm::open()->action(route("notes.update", array($note))) !!}
                {!! BootForm::hidden("_method")->value("put") !!}
                {!! BootForm::select('Epreuve', 'epreuve')->options(['laravel' => 'Laravel', 'linux' => 'Linux', 'html' => 'Html', 'css' => 'CSS','android' => 'Android', 'management' => 'Management'])->select($note->epreuve)->required(true) !!}
                {!! BootForm::text("Note", "note")->placeholder("Entrer la nouvelle note")->required(true)->defaultValue($note->note) !!}
                {!! BootForm::text("Coefficient", "coeff")->placeholder("Entrer le nouveau coefficient")->required(true)->defaultValue($note->coeff) !!}
                <input class="btn btn-primary pull-right " type="submit" value="Modifier">
                {!! BootForm::close() !!}
            </div>
        </div>
    </div>
    </div>
@endsection