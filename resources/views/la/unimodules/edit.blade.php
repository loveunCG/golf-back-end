@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/unimodules') }}">UniModule</a> :
@endsection
@section("contentheader_description", $unimodule->$view_col)
@section("section", "UniModules")
@section("section_url", url(config('laraadmin.adminRoute') . '/unimodules'))
@section("sub_section", "Edit")

@section("htmlheader_title", "UniModules Edit : ".$unimodule->$view_col)

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
				{!! Form::model($unimodule, ['route' => [config('laraadmin.adminRoute') . '.unimodules.update', $unimodule->id ], 'method'=>'PUT', 'id' => 'unimodule-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'name')
					@la_input($module, 'course_id')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/unimodules') }}">Cancel</a></button>
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
	$("#unimodule-edit-form").validate({
		
	});
});
</script>
@endpush
