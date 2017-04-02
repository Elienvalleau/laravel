@include('front.commun.header')
<br>
<br>
<div class="row">
    <div class="container col-md-offset-4 col-md-4">
        <h3>Veuillez vous connecter pour acceder aux informations</h3>
        <br>
        <br>
        <div class="login-box">
            <div class="login-box-body">
                {!! BootForm::open()->action(route("connexion")) !!}
                <div class="form-group has-feedback">
                    <input type="text" class="form-control" placeholder="email" name="email" value="{{old("email")}}">
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" class="form-control" placeholder="password" name="password">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>
                <div class="row">
                    <div class="col-xs-8">
                        <div class="checkbox">
                            <label>
                                <input name="remember" type="checkbox">Se rappeler de moi
                            </label>
                        </div>
                    </div>
                    <div class="col-xs-4">
                        <input type="submit" class="btn btn-primary btn-block">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
