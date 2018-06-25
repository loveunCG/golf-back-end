@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/course_skills') }}">Course Skill</a> :
@endsection
@section("contentheader_description", $course_skill->$view_col)
@section("section", "Course Skills")
@section("section_url", url(config('laraadmin.adminRoute') . '/course_skills'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Course Skills Edit : ".$course_skill->$view_col)

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
				{!! Form::model($course_skill, ['route' => [config('laraadmin.adminRoute') . '.course_skills.update', $course_skill->id ], 'method'=>'PUT', 'id' => 'course_skill-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'skill_name')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/course_skills') }}">Cancel</a></button>
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
	$("#course_skill-edit-form").validate({
		
	});
});
</script>
@endpush
