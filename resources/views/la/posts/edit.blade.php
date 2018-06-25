@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/posts') }}">Post</a> :
@endsection
@section("contentheader_description", $post->$view_col)
@section("section", "Posts")
@section("section_url", url(config('laraadmin.adminRoute') . '/posts'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Posts Edit : ".$post->$view_col)

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
				{!! Form::model($post, ['route' => [config('laraadmin.adminRoute') . '.posts.update', $post->id ], 'method'=>'PUT', 'id' => 'post-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'name')
					@la_input($module, 'title')
					@la_input($module, 'description')
					@la_input($module, 'comments')
					@la_input($module, 'likes')
					@la_input($module, 'forum_id')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/posts') }}">Cancel</a></button>
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
	$("#post-edit-form").validate({
		
	});
});
</script>
@endpush
