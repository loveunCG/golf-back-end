@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/playlists') }}">Playlist</a> :
@endsection
@section("contentheader_description", $playlist->$view_col)
@section("section", "Playlists")
@section("section_url", url(config('laraadmin.adminRoute') . '/playlists'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Playlists Edit : ".$playlist->$view_col)

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
				{!! Form::model($playlist, ['route' => [config('laraadmin.adminRoute') . '.playlists.update', $playlist->id ], 'method'=>'PUT', 'id' => 'playlist-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'name')
					@la_input($module, 'user_id')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/playlists') }}">Cancel</a></button>
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
	$("#playlist-edit-form").validate({
		
	});
});
</script>
@endpush
