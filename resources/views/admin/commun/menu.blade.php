<nav id="nav-wrap" class="nav-wrap1 twelve columns">
    <ul class="nav nav-tabs" id="nav">
        <li class="@if($name_route=="users.index") current @endif">
            <a href="{{ route("utilisateur.index") }}">Voir les utilisateurs</a>
        </li>
        <li class="@if($name_route=="users.create") current @endif">
            <a href="{{ route("utilisateur.create") }}">Créer un utilisateur</a>
        </li>
        <li class="@if($name_route=="users.index") current @endif">
            <a href="{{ route("commentaires.index") }}">Voir l'ensemble des commentaires</a>
        </li>
        <li>
            <a href="{{ route("stats_admin.index") }}">Voir les statistiques</a>
        </li>
        <li>
            <a href="{{ route("deconnexion") }}">Déconnexion</a>
        </li>
        <li>
            {!! Form::open(['route' => 'searchs']) !!}
            {!! Form::text('query') !!}
            {!! Form::submit('Rechercher') !!}
            {!! Form::close() !!}
        </li>
    </ul>
</nav>
<br>
<br>
