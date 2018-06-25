@extends("la.layouts.app")

@section("contentheader_title")
	<a href="{{ url(config('laraadmin.adminRoute') . '/messages') }}">Message</a> :
@endsection
@section("contentheader_description", $message->$view_col)
@section("section", "Messages")
@section("section_url", url(config('laraadmin.adminRoute') . '/messages'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Messages Edit : ".$message->$view_col)

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
				{!! Form::model($message, ['route' => [config('laraadmin.adminRoute') . '.messages.update', $message->id ], 'method'=>'PUT', 'id' => 'message-edit-form']) !!}
					@la_form($module)
					
					{{--
					@la_input($module, 'sender')
					@la_input($module, 'receiver')
					@la_input($module, 'message')
					@la_input($module, 'video_id')
					--}}
                    <br>
					<div class="form-group">
						{!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/messages') }}">Cancel</a></button>
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
	$("#message-edit-form").validate({
		
	});
});
</script>
@endpush
