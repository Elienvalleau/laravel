@extends('front/default')
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
                                <br>
                                <a class="btn btn-primary" href="{{ route("users.show", $user) }}">Afficher le profil</a>
                                <br>
                            </center>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection