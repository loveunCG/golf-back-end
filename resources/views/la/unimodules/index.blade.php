@extends("la.layouts.app")

@section("contentheader_title", "UniModules")
@section("contentheader_description", "UniModules listing")
@section("section", "UniModules")
@section("sub_section", "Listing")
@section("htmlheader_title", "UniModules Listing")

@section("headerElems")
<style>
.headerElems{
	    display: block;
    margin-top: -28px;
    position: relative;
    padding: 0 0 18px 0;
    float:none;
}
</style>
@la_access("UniModules", "create")
 <div class="tab" style="margin-top:32px;">
  <button class="tablinks btn btn-success btn-sm pull-left " onclick="openLearning(event, 'Academy')">Academies</button>
  <button class="tablinks btn btn-success btn-sm pull-left" onclick="openLearning(event, 'Course')">Courses</button>
  <button class="tablinks btn btn-success btn-sm pull-left active" onclick="openLearning(event, 'UniModule')">UniModules</button> 
   <button class="tablinks btn btn-success btn-sm pull-left " onclick="openLearning(event, 'Videos')">Videos</button> 
</div>
	<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddModal">Add UniModule</button>
@endla_access
@endsection

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

<div class="box box-success">
	<!--<div class="box-header"></div>-->
	<div class="box-body">
		<table id="example1" class="table table-bordered">
		<thead>
		<tr class="success">
			@foreach( $listing_cols as $col )
			<th>{{ $module->fields[$col]['label'] or ucfirst($col) }}</th>
			@endforeach
			@if($show_actions)
			<th>Actions</th>
			@endif
		</tr>
		</thead>
		<tbody>
			
		</tbody>
		</table>
	</div>
</div>

@la_access("UniModules", "create")
<div class="modal fade" id="AddModal" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title" id="myModalLabel">Add UniModule</h4>
			</div>
			{!! Form::open(['action' => 'LA\UniModulesController@store', 'id' => 'unimodule-add-form']) !!}
			<div class="modal-body">
				<div class="box-body">
                    @la_form($module)
					
					{{--
					@la_input($module, 'name')
					@la_input($module, 'course_id')
					--}}
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				{!! Form::submit( 'Submit', ['class'=>'btn btn-success']) !!}
			</div>
			{!! Form::close() !!}
		</div>
	</div>
</div>
@endla_access

@endsection

@push('styles')
<link rel="stylesheet" type="text/css" href="{{ asset('la-assets/plugins/datatables/datatables.min.css') }}"/>
@endpush

@push('scripts')
<script src="{{ asset('la-assets/plugins/datatables/datatables.min.js') }}"></script>
<script>
$(function () {
	$("#example1").DataTable({
		processing: true,
        serverSide: true,
        ajax: "{{ url(config('laraadmin.adminRoute') . '/unimodule_dt_ajax') }}",
		language: {
			lengthMenu: "_MENU_",
			search: "_INPUT_",
			searchPlaceholder: "Search"
		},
		@if($show_actions)
		columnDefs: [ { orderable: false, targets: [-1] }],
		@endif
	});
	$("#unimodule-add-form").validate({
		
	});
});
function openLearning(evt, learningName) {
		if(learningName == "Academy") {	
			window.location.href = "{{ url(config('laraadmin.adminRoute') . '/academies') }}";
		} else if(learningName == "Course") {
			window.location.href = "{{ url(config('laraadmin.adminRoute') . '/courses') }}";
		} else if(learningName == "UniModule") {
			window.location.href = "{{ url(config('laraadmin.adminRoute') . '/unimodules') }}";
		}else if(learningName == "Videos") {
			window.location.href = "{{ url(config('laraadmin.adminRoute') . '/videos') }}";
		}
	}
</script>
@endpush
