@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/academies') }}">Academy</a> :
@endsection
@section("contentheader_description", $academy->$view_col)
@section("section", "Academies")
@section("section_url", url(config('laraadmin.adminRoute') . '/academies'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Academies Edit : ".$academy->$view_col)

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
				{!! Form::model($academy, ['route' => [config('laraadmin.adminRoute') . '.academies.update', $academy->id ], 'method'=>'PUT', 'id' => 'academy-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'name')
					@la_input($module, 'address')
					@la_input($module, 'phone')
					@la_input($module, 'dec')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/academies') }}">Cancel</a></button>
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
	$("#academy-edit-form").validate({
		
	});
});
</script>
@endpush
