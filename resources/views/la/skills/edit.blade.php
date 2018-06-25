@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/skills') }}">Skill</a> :
@endsection
@section("contentheader_description", $skill->$view_col)
@section("section", "Skills")
@section("section_url", url(config('laraadmin.adminRoute') . '/skills'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Skills Edit : ".$skill->$view_col)

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
				{!! Form::model($skill, ['route' => [config('laraadmin.adminRoute') . '.skills.update', $skill->id ], 'method'=>'PUT', 'id' => 'skill-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'name')
					@la_input($module, 'chapter_id')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/skills') }}">Cancel</a></button>
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
	$("#skill-edit-form").validate({
		
	});
});
</script>
@endpush
