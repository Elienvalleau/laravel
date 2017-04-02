@extends('admin/default')
@section('content')
    <div class="row">
        <div class="container col-md-offset-4 col-md-4">
            <div class="box-header with-border">
                <h3 class="box-title">Modification de {{ $user->nom }} {{ $user->prenom }}</h3>
            </div>
            <div class="box-body">
                {!! BootForm::open()->action(route("utilisateur.update", array($user))) !!}
                {!! BootForm::hidden("_method")->value("put") !!}
                {!! BootForm::text("Nom", "nom")->placeholder("Entrer le nom de l'utilisateur")->required(true)->defaultValue($user->nom) !!}
                {!! BootForm::text("Prénom", "prenom")->placeholder("Entrer le prénom de l'utilisateur")->required(true)->defaultValue($user->prenom) !!}
                {!! BootForm::text("Login", "login")->placeholder("Entrer le login de l'utilisateur")->required(true)->defaultValue($user->login) !!}
                {!! BootForm::email("Email", "email")->placeholder("Entrer l'email de l'utilisateur")->required(true)->defaultValue($user->email) !!}
                {!! BootForm::password("Mot de passe", "password")->placeholder("Entrer le mot de passe de l'utilisateur") !!}
                {!! BootForm::password("Confirmer le mot de passe", "password_confirmation")->placeholder("Confirmer le mot de passe de l'utilisateur") !!}
                <input class="btn btn-primary pull-right " type="submit" value="Modifier">
                {!! BootForm::close() !!}
            </div>
        </div>
    </div>
    </div>
@endsection