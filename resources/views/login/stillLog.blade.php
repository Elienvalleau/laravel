@extends('front/default')
@section('content')
    <div class="container col-md-6">
    <div class="login-box">
        Vous êtes déjà connecté
    </div>
        <div class="login-box">
            <div class="login-box-body">
                <div class="row">
                     <a href="{{ route("deconnexion") }}">Déconnexion ?</a>
                </div>
            </div>
        </div>
    </div>
@endsection