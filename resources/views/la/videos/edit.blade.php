@extends("la.layouts.app")

@section("contentheader_title")
<a href="{{ url(config('laraadmin.adminRoute') . '/videos') }}">Video</a> :
@endsection
@section("contentheader_description", $video->$view_col)
@section("section", "Videos")
@section("section_url", url(config('laraadmin.adminRoute') . '/videos'))
@section("sub_section", "Edit")

@section("htmlheader_title", "Videos Edit : ".$video->$view_col)

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
                {!! Form::model($video, ['route' => [config('laraadmin.adminRoute') . '.videos.update', $video->id ], 'method'=>'PUT', 'id' => 'video-edit-form']) !!}
                <div class="form-group {{ $errors->has('name') ? 'has-error' : ''}}">
                    {!! Form::label('name', 'Name') !!}
                    {!! Form::text('name', $video->name, array('class' => 'form-control')) !!}
                    {!! $errors->first('name', '<p class="help-block">:message</p>') !!}
                </div>
                <div class="form-group {{ $errors->has('url') ? 'has-error' : ''}}">
                    {!! Form::label('url', 'Video Url') !!}
                    {!! Form::text('url', $video->url, array('class' => 'form-control')) !!}
                    {!! $errors->first('url', '<p class="help-block">:message</p>') !!}
                </div>
                <div class="form-group {{ $errors->has('url') ? 'has-error' : ''}}">
                    {!! Form::label('vimeo_id', 'Vimeo Id') !!}
                    {!! Form::text('vimeo_id', $video->vimeo_id, ['class' => 'form-control', 'disabled' => '']) !!}
                    {!! $errors->first('vimeo_id', '<p class="help-block">:message</p>') !!}
                </div>
                <div class="form-group {{ $errors->has('vimeo_image_path') ? 'has-error' : ''}}">
                    {!! Form::label('vimeo_image_path', 'Vimeo Image Path') !!}
                    {!! Form::text('vimeo_image_path', $video->vimeo_image_path, ['class' => 'form-control', 'disabled' => '']) !!}
                    {!! $errors->first('vimeo_image_path', '<p class="help-block">:message</p>') !!}
                    <?php if ($video->vimeo_image_path != "") { ?>
                        <image height="100" width="100" src="{{$video->vimeo_image_path}}" >  
                    <?php } ?>    
                    
                </div>


                <br>
                <div class="form-group">
                    {!! Form::submit( 'Update', ['class'=>'btn btn-success']) !!} <button class="btn btn-default pull-right"><a href="{{ url(config('laraadmin.adminRoute') . '/videos') }}">Cancel</a></button>
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
        $("#video-edit-form").validate({

        });
    });
</script>
@endpush
