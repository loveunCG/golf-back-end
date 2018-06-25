@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/members') }}">Member</a> :
@endsection
@section("contentheader_description", $member->$view_col)
@section("section", "Members")
@section("section_url", url(config('laraadmin.adminRoute') . '/members'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Members Edit : ".$member->$view_col)

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
				{!! Form::model($member, ['route' => [config('laraadmin.adminRoute') . '.members.update', $member->id ], 'method'=>'PUT', 'id' => 'member-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'UserName')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/members') }}">Cancel</a></button>
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
	$("#member-edit-form").validate({
		
	});
});
</script>
@endpush
