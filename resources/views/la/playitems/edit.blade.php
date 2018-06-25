@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/playitems') }}">PlayItem</a> :
@endsection
@section("contentheader_description", $playitem->$view_col)
@section("section", "PlayItems")
@section("section_url", url(config('laraadmin.adminRoute') . '/playitems'))
@section("sub_section", "Edit")

@section("htmlheader_title", "PlayItems Edit : ".$playitem->$view_col)

@section("main-content")

@if (count($errors) > 0)
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<div class="box">
	<div class="box-header">
		
	</div>
	<div class="box-body">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				{!! Form::model($playitem, ['route' => [config('laraadmin.adminRoute') . '.playitems.update', $playitem->id ], 'method'=>'PUT', 'id' => 'playitem-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'playlist_id')
					@la_input($module, 'video_uid')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/playitems') }}">Cancel</a></button>
					</div>
				{!! Form::close() !!}
			</div>
		</div>
	</div>
</div>

@endsection

@push('scripts')
<script>
$(function () {
	$("#playitem-edit-form").validate({
		
	});
});
</script>
@endpush
