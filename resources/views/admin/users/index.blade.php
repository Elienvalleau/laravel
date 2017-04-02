@extends('admin/default')
@section('content')
    <div class="container">
        <div class="row">
            @foreach($users as $user)
            <div class="col-sm-6 col-md-3">

                <div class="thumbnail">
                    <img src="{{url('uploads/avatars/'.$user->avatar)}}" style="width:200px; height:200px; border-radius:50%;">
                    <br>
                    <div class="caption">
                        <center>
                            <b>{{ $user->nom }} {{ $user->prenom }}</b>
                            {!! BootForm::open()->action(route("utilisateur.destroy", $user))->style("display:inline") !!}
                            {!! BootForm::hidden("_method")->value("delete") !!}
                            <br>
                            <a class="btn btn-primary " href="{{ route("utilisateur.show", $user) }}">Afficher le profil</a>
                            <input class="btn btn-primary" type="submit" value="Supprimer">

                            {!! BootForm::close() !!}
                            <br>
                        </center>
                    </div>
                </div>

            </div>
            @endforeach
        </div>
    </div>
@endsection