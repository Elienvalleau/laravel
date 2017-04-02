<!DOCTYPE html>
<html>
@include('admin.commun.header')
<body id="index" class="home page">
<div class="wrapper">
	@include('admin.commun.menu', array('name_route' => Request::route()->getAction()["as"],
                                            'controller' => explode(".", Request::route()->getAction()["as"])))
	<div class="content-wrapper">
		@include("admin.commun.alert")
		<section class="content">
			@yield("content")
		</section>
	</div>
	@include("admin.commun.footer")
	<div class="control-sidebar-bg"></div>
</div>
{!! Html::script("lib/jquery-3.1.0/jquery-3.1.0.min.js") !!}
{!! Html::script("lib/bootstrap-3.3.7/js/bootstrap.min.js") !!}
@yield("headerJS")
</body>
</html>