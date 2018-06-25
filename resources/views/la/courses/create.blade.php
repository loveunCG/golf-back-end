@extends("la.layouts.app")

@section("contentheader_title")
<a href="{{ url(config('laraadmin.adminRoute') . '/courses') }}">Course</a> :
@endsection
@section("contentheader_description",'')
@section("section", "Courses")
@section("section_url", url(config('laraadmin.adminRoute') . '/courses'))
@section("sub_section", "Edit")
<style>
    .module-box {
        padding: 20px 20px;
        border: 1px solid #eaeaea;
        border-radius: 5px;
        margin-bottom: 15px;
    }
    .add-module {
        border: 1px solid #777;
        padding: 0px 6px 2px;
        border-radius: 50%;
        font-size: 12px;
        color: #777;
        position: absolute;
        top: -10px;
        right: 5px;
        background: #fff;
    }
    .chap-vdo-box {
        padding: 20px;
        border: 1px solid #eaeaea;
        border-radius: 5px;
    }
    .add-chap-vdo {
        border: 1px solid #777;
        padding: 0px 6px 2px;
        border-radius: 50%;
        font-size: 12px;
        color: #777;
        position: absolute;
        top: -10px;
        right: 5px;
        background: #fff;
    }
</style>
@section("htmlheader_title", "Create Course")

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
                {!! Form::open(['action' => 'LA\CoursesController@store', 'id' => 'course-add-form', 'files' => true]) !!}
                <div class="form-group">
                    {!! Form::label('name', 'Name') !!}
                    {!! Form::text('name', null, array('class' => 'form-control')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('description', 'Description') !!}
                    {!! Form::textarea('description', null, array('class' => 'form-control')) !!}
                </div>
                <div class="form-group {{ $errors->has('featureimage') ? 'has-error' : ''}}">
                    {!! Form::label('featureimage', 'Feature Image') !!}
                    {!! Form::file('featureimage', null, ['class' => 'form-control']) !!}
                    {!! $errors->first('featureimage', '<p class="help-block">:message</p>') !!}
                </div>
                <div class="form-group {{ $errors->has('academy_id') ? 'has-error' : ''}}">
                    {!! Form::label('academy_id', 'Academy') !!}
                    {!! Form::select('academy_id', $academies, null, array('class' => 'form-control')) !!}
                    {!! $errors->first('academy_id', '<p class="help-block">:message</p>') !!}
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="module-box">
                            <div class="form-group">
                                {!! Form::label('modules', 'Modules') !!}
                                {!! Form::text('modules[]', '', array('class' => 'form-control')) !!}
                                {!! Form::hidden('hidden_total_modules_chapters[]', 1, array('class' => 'total_items')) !!}
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="chap-vdo-box">							
                                        <div class="form-group">
                                            {!! Form::label('chapters', 'Chapters') !!}
                                            {!! Form::text('chapters[]', '', array('class' => 'form-control')) !!}
                                        </div>
                                        <div class="form-group">
                                            {!! Form::label('videos', 'Videos') !!}
                                            {!! Form::select('videos[]', $videos, null, array('class' => 'form-control all-vids')) !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row chapters_div">
                            </div>
                            <div class="form-group text-right">
                                {!! Form::button('+ Add New Chapter/Video', ['class' => 'btn btn-primary AddChapterBtn','name'=>'AddChapterBtn']) !!}
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row modules_div">
                    
                </div>
                <div class="form-group text-right">
                {!! Form::button('+ Add New Module', ['class' => 'btn btn-primary','name'=>'AddModuleBtn','id'=>'AddModuleBtn']) !!}
                </div>
                <div class="form-group">
                    {!! Form::submit( 'Create', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/courses') }}">Cancel</a></button>
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
        $("#course-edit-form").validate({

        });
    });
    $x = 1;
    $("#AddModuleBtn").on("click", function (e) {
        e.preventDefault();
        $x++;
        $strItems = '<div class="col-sm-12">';
        $strItems += '<div class="module-box">';
        $strItems += '<div class="form-group">';
        $strItems += '<label for="modules">Modules</label>';
        $strItems += '<input class="form-control" name="modules[]" type="text" value="">';
        $strItems += '<input name="hidden_total_modules_chapters[]" value="1" class="total_items" type="hidden">';
        $strItems += '</div>';
        $strItems += '<div class="row">';
        $strItems += '<div class="col-md-12">';
        $strItems += '<div class="chap-vdo-box">';
        $strItems += '<div class="form-group">';
        $strItems += '<label for="chapters">Chapters</label>';
        $strItems += '<input class="form-control" name="chapters[]" type="text" value="">';
        $strItems += '</div>';
        $strItems += '<div class="form-group">';
        $strItems += '<label for="videos">Videos</label>';
        $strItems += '<select class="form-control" name="videos[]">'+$('.all-vids').html()+'</select>';
        $strItems += '</div>';
        $strItems += '</div>';
        $strItems += '</div>';
        $strItems += '</div>';
        $strItems += '<div class="row chapters_div"></div>';
        $strItems += '<div class="form-group text-right">';
        $strItems += '<button class="btn btn-primary AddChapterBtn" name="AddChapterBtn" type="button">+ Add New Chapter/Video</button>';
        $strItems += '</div>';
        $strItems += '<a href="javascript:void(0);" class="removeItems">Remove Module</a>';
        $(".modules_div").append($strItems);

    });

    $(".modules_div").on("click", ".removeItems", function (e) {
        e.preventDefault();
        $(this).parents('div.col-sm-12').remove();
    });

    
     $('body').on('click', '.AddChapterBtn', function (e) {    
        e.preventDefault();
        $x++;
        $strItems = '<div class="col-md-12">';
        $strItems += '<div class="chap-vdo-box">';
        $strItems += '<div class="form-group">';
        $strItems += '<label for="chapters">Chapters</label>';
        $strItems += '<input class="form-control" name="chapters[]" type="text" value="">';
        $strItems += '</div>';
        $strItems += '<div class="form-group">';
        $strItems += '<label for="videos">Videos</label>';
         $strItems += '<select class="form-control" name="videos[]">'+$('.all-vids').html()+'</select>';
        $strItems += '</div>';
        $strItems += '<a href="javascript:void(0);" class="removeChapters">Remove Chapter</a>';
        $strItems += '</div>';
        
        $strItems += '</div>';
        $strItems += '</div>';
        $(this).parents('div.col-sm-12').find('.chapters_div').append($strItems);
        $(this).parents('div.col-sm-12').find('.total_items').val($(this).parents('div.col-sm-12').find('.chap-vdo-box').length);
        
    });
    $('body').on('click', '.removeChapters', function (e) {    
        
        $(this).parents('div.col-sm-12').find('.total_items').val($(this).parents('div.col-sm-12').find('.chap-vdo-box').length-1);
        $(this).closest('div.col-md-12').remove();
    });

</script>
@endpush
