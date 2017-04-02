@extends('front/default')
@section('content')
    <div class="container">
        <div class="thumbnail">
                    <div class="box-header with-border">
                        <center><b><h3 class="box-title">Statistiques</h3></b></center>
                        <br>
                        <br>
                        <div class="col-md-offset-4 col-md-4">
                            <div class="thumbnail">
                                <h4><center>Moyenne de la classe : {{ $avg }}</center></h4><br>
                            </div>
                        </div>
                        <div class="box-body col-md-12">
                            <div class="thumbnail">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="thumbnail">
                                            Elève avec la note la plus haute en Laravel : {{ $best_laravel->prenom }}  {{ $best_laravel->nom }} ({{ $best_laravel->note }})<br>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="thumbnail">
                                            Elève avec la note la plus haute en Linux : {{ $best_linux->prenom }}  {{ $best_linux->nom }} ({{ $best_linux->note }})<br>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="thumbnail">
                                            Elève avec la note la plus haute en Html : {{ $best_html->prenom }}  {{ $best_html->nom }} ({{ $best_html->note }})<br>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="thumbnail">
                                            Elève avec la note la plus haute en CSS : {{ $best_css->prenom }}  {{ $best_css->nom }} ({{ $best_css->note }})<br>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="thumbnail">
                                            Elève avec la note la plus haute en Android : {{ $best_android->prenom }}  {{ $best_android->nom }} ({{ $best_android->note }})<br>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="thumbnail">
                                            Elève avec la note la plus haute en Management : {{ $best_management->prenom }}  {{ $best_management->nom }} ({{ $best_management->note }})<br>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <br>
                        <br>
                        <hr>
                        <br>
                        <div class="box-body col-md-12">
                            <div class="thumbnail">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="thumbnail">
                                            Elève avec la note la plus basse en Laravel : {{ $worst_laravel->prenom }}  {{ $worst_laravel->nom }} ({{ $worst_laravel->note }})<br>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="thumbnail">
                                            Elève avec la note la plus basse en Linux : {{ $worst_linux->prenom }}  {{ $worst_linux->nom }} ({{ $worst_linux->note }})<br>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="thumbnail">
                                            Elève avec la note la plus basse en Html : {{ $worst_html->prenom }}  {{ $worst_html->nom }} ({{ $worst_html->note }})<br>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="thumbnail">
                                            Elève avec la note la plus basse en CSS : {{ $worst_css->prenom }}  {{ $worst_css->nom }} ({{ $worst_css->note }})<br>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="thumbnail">
                                            Elève avec la note la plus basse en Android : {{ $worst_android->prenom }}  {{ $worst_android->nom }} ({{ $worst_android->note }})<br>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="thumbnail">
                                            Elève avec la note la plus basse en Management : {{ $worst_management->prenom }}  {{ $worst_management->nom }} ({{ $worst_management->note }})<br>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
        </div>
    </div>
</div>
    <div id="notes-div"></div>
    @linechart('Notes', 'notes-div')

@endsection