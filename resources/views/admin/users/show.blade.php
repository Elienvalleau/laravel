@extends('admin/default')
@section('content')
        <div class="container">
            <center><h3><b>{{ $user->prenom }} {{ $user->nom }}</b></h3></center>
            @if($user->id ==1)
            <a href="{{route("utilisateur.show", $userSuivant) }}" aria-label="Next" class="btn btn-default pull-right">
                <span aria-hidden="true" >Elève Suivant >> </span>
            </a>
            @else
                <a href="{{ route("utilisateur.show", $userPrecedent) }}" aria-label="Previous" class="btn btn-default pull-left">
                    <span aria-hidden="true" > << Elève precedent</span>
                </a>

                <a href="{{route("utilisateur.show", $userSuivant) }}" aria-label="Next" class="btn btn-default pull-right">
                    <span aria-hidden="true" >Elève Suivant >> </span>
                </a>
            @endif


            <br>
            <br>
            <div class="thumbnail">
                <div style="margin-left: 80px; margin-right: 80px">
                    <br>
                    <img src="{{url('uploads/avatars/'.$user->avatar)}}" style="width:250px; height:250px; float:left; border-radius:50%; margin-right:300px; margin-left:20px;">
                    <br>
                    <br>
                    <h4><label>Nom :</label> {{ $user->nom }}<br><br>
                    <label>Prenom :</label> {{ $user->prenom }}<br><br>
                    <label>Email :</label> {{ $user->email }}<br></h4><br>
                    <a href="{{ route("utilisateur.edit", $user) }}">Modifier son profil</a>
                    <br><br><br><br><br>
                    <form enctype="multipart/form-data"  action="{{url('admin/profile/')}}" method="POST">
                        <label style="margin-left: 15px;">Changer l'avatar de l'utilisateur (fichier en .jpg)?</label>
                        <input type="file" name="avatar">
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">
                        <input type="hidden" name="id" value="{{ $user->id }}">
                        <br>
                        <input type="submit" value="Valider la photo" class="btn btn-sm btn-primary" style="margin-left: 65px;">
                    </form>
                </div>

                <div class="row">
                    <div class="box-body col-md-5" style="margin-left: 45px; margin-right: 45px;">
                        <div class="box-body">
                            <br>
                            <h3 class="box-title"><center><b>Ajouter un commentaires</b></center></h3>
                            <br>
                            <br>
                            {!! BootForm::open()->action(route("commentaires.store")) !!}
                            {!! BootForm::textarea("Commentaire", "content")->placeholder("Entrer votre commentaire")->required(true) !!}

                            <input type="text" name="tags" class="form-control" value="{{old('tags')}}" placeholder="tags"> <br>
                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                            <input type="hidden" name="user_id" value="{{ $user->id }}">
                            <input type="hidden" name="auteur" value="{{ Auth::user('id')->prenom }}">
                            <input class="btn btn-primary pull-right " type="submit" value="Créer">
                            {!! BootForm::close() !!}
                            <br>
                            <br>
                            <br>
                        </div>
                    </div>

                    <div class="box-body col-md-5" style="margin-left: 45px; margin-right: 45px">
                        <div class="box-header with-border">
                            <br>
                            <h3 class="box-title"><center><b>Ajouter une notes</b></center></h3>
                            <br>
                            <br>
                            <div class="box-body">
                                {!! BootForm::open()->action(route("notes.store")) !!}
                                {!! BootForm::select('Epreuve', 'epreuve')->options(['laravel' => 'Laravel', 'linux' => 'Linux', 'html' => 'Html', 'css' => 'CSS','android' => 'Android', 'management' => 'Management'])->select('laravel')->required(true) !!}
                                <br>
                                {!! BootForm::text("Note", "note")->placeholder("Entrer la note")->required(true) !!}
                                <br>
                                {!! BootForm::text("Coefficient", "coeff")->placeholder("Entrer le coefficient de la note")->required(true) !!}
                                <input type="hidden" name="_token" value="{{ csrf_token() }}">
                                <input type="hidden" name="user_id" value="{{ $user->id }}">
                                <br>
                                <br>
                                <br>
                                <input class="btn btn-primary pull-right " type="submit" value="Créer">
                                {!! BootForm::close() !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <div class="thumbnail">
                <div class="row">
                        <div class="box-header with-border">
                            <br>
                            <br>
                            <h3 class="box-title"><center><b>Liste des notes</b></center></h3>
                            <br>
                            <h4><b><center>Moyenne générale : {{ $avg }}/20</center></b></h4>
                            <center>Moyenne en Laravel : {{ $avg_laravel }}/20</center>
                            <center>Moyenne en Linux : {{ $avg_linux }}/20</center>
                            <center>Moyenne en Html : {{ $avg_html }}/20</center>
                            <center>Moyenne en Css : {{ $avg_css }}/20</center>
                            <center>Moyenne en Android : {{ $avg_android }}/20</center>
                            <center>Moyenne en Management : {{ $avg_management }}/20</center>
                            <br>
                            <br>
                            @foreach($user->notes as $note)
                                <div class="box-body col-md-6">
                                    <div class="thumbnail">
                                        <center><h4>{{ $note->epreuve }} : {{ $note->note }} ( {{ $note->coeff }} )</h4>
                                        <br>
                                        {!! BootForm::open()->action(route("notes.destroy", $note))->style("display:inline") !!}
                                        {!! BootForm::hidden("_method")->value("delete") !!}
                                        <input class="btn btn-sm btn-primary " type="submit" value="Supprimer">
                                        <a class="btn btn-primary btn-sm " href="{{ route("notes.edit", $note) }}">Modifier la note</a></center>
                                        {!! BootForm::close() !!}
                                        <br>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                </div>
            </div>
            <br>
            <div class="thumbnail">
                <div class="row">
                    <br>
                        <div class="box-header with-border">
                            <h3 class="box-title"><center><b>Liste des Commentaires</b></center></h3>
                            @foreach($user->commentaires as $commentaire)
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
                                        {!! BootForm::open()->action(route("commentaires.destroy", $commentaire))->style("display:inline") !!}
                                        {!! BootForm::hidden("_method")->value("delete") !!}
                                        <center><input class="btn btn-sm btn-primary " type="submit" value="Supprimer">
                                        <a class="btn btn-primary btn-sm " href="{{ route("commentaires.edit", $commentaire) }}">Modifier le commentaire</a></center>
                                        {!! BootForm::close() !!}
                                    </div>
                                </div>

                        @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </div>
@endsection
