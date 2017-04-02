@extends('front/default')
@section('content')
    <div class="container">
        <center><h3><b>{{ $user->prenom }} {{ $user->nom }}</b></h3></center>
        @if($user->id ==1)
            <a href="{{route("users.show", $userSuivant) }}" aria-label="Next" class="btn btn-default pull-right">
                <span aria-hidden="true" >Elève Suivant >> </span>
            </a>
        @else
            <a href="{{ route("users.show", $userPrecedent) }}" aria-label="Previous" class="btn btn-default pull-left">
                <span aria-hidden="true" > << Elève precedent</span>
            </a>

            <a href="{{route("users.show", $userSuivant) }}" aria-label="Next" class="btn btn-default pull-right">
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
                <label>Email :</label> {{ $user->email }}<br><br></h4>
                <br><br><br><br><br>
            </div>
            <div class="row">
                <div class="box-body col-md-11" style="margin-left: 45px; margin-right: 45px;">
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
            </div>

        </div>
        <br>
        <div class="thumbnail">
            <div class="row">
                <div class="box-header with-border">
                    <br>
                    <br>
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
                                        <a href="{{route('commentaires2.tag', ['nom' => $tag->nom])}}" class="badge badge-default">{{$tag->nom}}</a>
                                    @endforeach
                                </p>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
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
                                <center><h4>{{ $note->epreuve }} : {{ $note->note }} ( {{ $note->coeff }} )</h4></center>
                                    <br>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>




@endsection
