@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/forums') }}">Forum</a> :
@endsection
@section("contentheader_description", $forum->$view_col)
@section("section", "Forums")
@section("section_url", url(config('laraadmin.adminRoute') . '/forums'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Forums Edit : ".$forum->$view_col)

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
				{!! Form::model($forum, ['route' => [config('laraadmin.adminRoute') . '.forums.update', $forum->id ], 'method'=>'PUT', 'id' => 'forum-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'title')
					@la_input($module, 'content')
					@la_input($module, 'type')
					@la_input($module, 'user_id')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/forums') }}">Cancel</a></button>
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
	$("#forum-edit-form").validate({
		
	});
});
</script>
@endpush
