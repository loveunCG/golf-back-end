@extends('la.layouts.app')

@section('htmlheader_title')
	Video View
@endsection


@section('main-content')
<div id="page-content" class="profile2">
	<div class="bg-primary clearfix">
		<div class="col-md-4">
			<div class="row">
				<div class="col-md-3">
					<!--<img class="profile-image" src="{{ asset('la-assets/img/avatar5.png') }}" alt="">-->
					<div class="profile-icon text-primary"><i class="fa {{ $module->fa_icon }}"></i></div>
				</div>
				<div class="col-md-9">
					<h4 class="name">{{ $title }}</h4>
					<div class="row stats">
						<div class="col-md-4"><i class="fa fa-facebook"></i> 234</div>
						<div class="col-md-4"><i class="fa fa-twitter"></i> 12</div>
						<div class="col-md-4"><i class="fa fa-instagram"></i> 89</div>
					</div>
					<p class="desc">Test Description in one line</p>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="dats1"><div class="label2">Admin</div></div>
			<div class="dats1"><i class="fa fa-envelope-o"></i> superadmin@gmail.com</div>
			<div class="dats1"><i class="fa fa-map-marker"></i> Pune, India</div>
		</div>
	</div>
	<?php echo $html; ?>
	Description:
    <?php echo $description; ?>
</div>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script>

    var wid = {!! json_encode($width) !!};
    var hgt = {!! json_encode($height) !!};
    var aspect = wid / hgt;

    var width = $('.bg-primary').width();
    $('iframe').attr('width', width);
    $('iframe').attr('height', width / aspect);

    $( window ).resize(function() {
        var width = $('.bg-primary').width();
        $('iframe').attr('width', width);
        $('iframe').attr('height', width / aspect);
	});

</script>
@endsection
