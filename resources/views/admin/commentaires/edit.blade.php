@extends('admin/default')
@section('content')
    <div class="row">
        <div class="container col-md-offset-4 col-md-4">
            <div class="box-header with-border">
                <h3 class="box-title">Modification du commentaire de {{ $commentaire->auteur }}</h3>
            </div>
            <div class="box-body">
                {!! BootForm::open()->action(route("commentaires.update", array($commentaire))) !!}
                {!! BootForm::hidden("_method")->value("put") !!}
                {!! BootForm::textarea("Commentaire", "content")->placeholder("Entrer le nouveau commentaire")->required(true)->defaultValue($commentaire->content) !!}
                <!--<input type="text" name="tags" class="form-control" value="{{old('tags')}}" placeholder="tags">-->
                <input class="btn btn-primary pull-right " type="submit" value="Modifier">
                {!! BootForm::close() !!}
            </div>
        </div>
    </div>
    </div>
@endsection