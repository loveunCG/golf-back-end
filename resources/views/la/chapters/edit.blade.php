@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/chapters') }}">Chapter</a> :
@endsection
@section("contentheader_description", $chapter->$view_col)
@section("section", "Chapters")
@section("section_url", url(config('laraadmin.adminRoute') . '/chapters'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Chapters Edit : ".$chapter->$view_col)

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
				{!! Form::model($chapter, ['route' => [config('laraadmin.adminRoute') . '.chapters.update', $chapter->id ], 'method'=>'PUT', 'id' => 'chapter-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'name')
					@la_input($module, 'module_id')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/chapters') }}">Cancel</a></button>
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
	$("#chapter-edit-form").validate({
		
	});
});
</script>
@endpush
