<nav id="nav-wrap" class="nav-wrap1 twelve columns">
    <ul class="nav nav-tabs" id="nav">
        <li class="@if($name_route=="users.index") current @endif">
            <a href="{{ route("users.index") }}">Voir les utilisateurs</a>
        </li>
        <li>
            <a href="{{ route("stats.index") }}">Voir les statistiques</a>
        </li>
        <li>
            <a href="{{ route("deconnexion") }}">Déconnexion</a>
        </li>
        <li>
            {!! Form::open(['route' => 'search']) !!}
            {!! Form::text('query') !!}
            {!! Form::submit('Rechercher') !!}
            {!! Form::close() !!}
        </li>

    </ul>
</nav>
<br>
<br>