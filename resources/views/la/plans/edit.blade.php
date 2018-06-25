@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/plans') }}">Plan</a> :
@endsection
@section("contentheader_description", $plan->$view_col)
@section("section", "Plans")
@section("section_url", url(config('laraadmin.adminRoute') . '/plans'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Plans Edit : ".$plan->$view_col)

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
				{!! Form::model($plan, ['route' => [config('laraadmin.adminRoute') . '.plans.update', $plan->id ], 'method'=>'PUT', 'id' => 'plan-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'name')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/plans') }}">Cancel</a></button>
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
	$("#plan-edit-form").validate({
		
	});
});
</script>
@endpush
