@extends('admin/default')
@section('content')
<div class="container">
    <div class="thumbnail">
        <div class="row">
            <br>
            <div class="box-header with-border">
                <h3 class="box-title"><center><b>Liste des Commentaires</b></center></h3>
                @foreach($commentaires as $commentaire)
                    <div class="box-body col-md-6">
                        <div class="thumbnail">
                            <br>
                            <center>{{ $commentaire->content }}</center>
                            <br>
                            <p><strong>Par {{ $commentaire->auteur }}</strong></p>
                            <p>
                                @foreach($commentaire->tags as $tag)
                                    <a href="{{route('commentaires.tag', ['nom' => $tag->nom])}}" class="badge badge-default">{{$tag->nom}}</a>
                                @endforeach
                            </p>
                            <a href="{{ route("commentaires.edit", $commentaire) }}">Modifier le commentaire</a>
                            {!! BootForm::open()->action(route("commentaires.destroy", $commentaire))->style("display:inline") !!}
                            {!! BootForm::hidden("_method")->value("delete") !!}
                            <center>
                                <input class="btn btn-sm btn-primary " type="submit" value="Supprimer">
                                <a  class="btn btn-sm btn-primary "href="{{ route("commentaires.edit", $commentaire) }}">Modifier le commentaire</a>
                            </center>

                        </div>
                    </div>
                @endforeach
                {{$commentaires->links()}}
            </div>
        </div>
    </div>
</div>

@endsection