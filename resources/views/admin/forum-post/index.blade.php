@extends("la.layouts.app")

@section('main-content')
 

<button class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#AddPosts"><a href="{{url('/')}}/admin/posts/create" />Add Posts</a></button>
    <div class="table-responsive">
        <table class="table table-bordered table-striped table-hover">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Content</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                
            @foreach($module as $item)
                <tr>
                    <td>{{ $item->title }}</td>
                    <td>{{ $item->content }}</td>
                    <td>
                        <a href="{{ url('/admin/posts/' . $item->id . '/edit') }}" class="btn btn-primary btn-xs" title="Edit Posts"><span class="glyphicon glyphicon-pencil" aria-hidden="true"/></a>
                        {!! Form::open([
                            'method'=>'DELETE',
                            'id'=>'DELETE_'.$item->id,
                            'url' => ['/admin/posts/', $item->id],
                            'style' => 'display:inline'
                        ]) !!}
                            {!! Form::button('<span class="glyphicon glyphicon-trash" aria-hidden="true" title="Delete Posts" />', array(
                                    'type' => 'submit',
                                    'class' => 'btn btn-danger btn-xs',
                                    'title' => 'Delete Posts',
                                    'onclick'=>'return myFunction('.$item->id.')'
                            ));!!}
                        {!! Form::close() !!}</td>
                </tr>
            @endforeach
            </tbody>
        </table>
        
    </div>

@endsection
