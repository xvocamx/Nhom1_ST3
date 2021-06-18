@extends('admin.layouts.master')
@section('title','Edit Categories')
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Trademark
                <small>Edit</small>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
        <div class="col-lg-7" style="padding-bottom:120px">
          @include('admin.errors.error')
            <form action="{{route('trademark.postedit',$trademark->id)}}" method="POST">
              <input type="hidden" name="_token" value="{{csrf_token()}}">
                <div class="form-group">
                    <label>Category Parent</label>
                    <select class="form-control" name="category">
                      @foreach($categories as $category)
                        <option
                          @if($trademark->category->id == $category->id)
                          {{'selected'}}
                          @endif
                         value="{{$category->id}}">{{$category->name}}</option>
                      @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label>Trademark Name</label>
                    <input class="form-control" name="txtTrademarkName" placeholder="Please Enter Trademark Name" value="{{$trademark->name}}" />
                </div>
                <button type="submit" class="btn btn-default">Trademark Edit</button>
            <form>
        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /.container-fluid -->
@stop
