@extends("la.layouts.app")

@section('main-content')
<div class="container">

    
    {!! Form::model($posts, [
        'method' => 'PATCH',
        'url' => ['/admin/posts', $posts->id],
        'class' => 'form-horizontal','files' => true
    ]) !!}

    <div class="form-group {{ $errors->has('title') ? 'has-error' : ''}}">
        {!! Form::label('title', 'Title', ['class' => 'col-sm-3 control-label']) !!}
        <div class="col-sm-6">
            {!! Form::text('title', null, ['class' => 'form-control']) !!}
            {!! $errors->first('title', '<p class="help-block">:message</p>') !!}
        </div>
    </div>

    <div class="form-group {{ $errors->has('content') ? 'has-error' : ''}}">
        {!! Form::label('content',  'Content', ['class' => 'col-sm-3 control-label']) !!}
        <div class="col-sm-6">
            {!! Form::textarea('content', null, ['class' => 'form-control']) !!}
            {!! $errors->first('content', '<p class="help-block">:message</p>') !!}
        </div>
    </div>
    <div class="form-group {{ $errors->has('thread_id') ? 'has-error' : ''}}">
        {!! Form::label('thread_id', 'Thread', ['class' => 'col-sm-3 control-label']) !!}
        <div class="col-sm-6">
            {{ Form::select('thread_id', $thread, null,['class' => 'form-control']) }}
            {!! $errors->first('thread_id', '<p class="help-block">:message</p>') !!}
        </div>
    </div>
    <input type="hidden" value="{{ Auth::user()->id }}" name="author_id" />

    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-3">
            {!! Form::submit('Update', ['class' => 'btn btn-primary form-control']) !!}
        </div>
    </div>
    {!! Form::close() !!}

    @if ($errors->any())
        <ul class="alert alert-danger">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    @endif

</div>
@endsection