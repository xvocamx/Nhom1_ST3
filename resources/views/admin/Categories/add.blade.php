@extends('admin.layouts.master')
@section('title','Thêm Category')
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Category
                <small>Add</small>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
        <div class="col-lg-7" style="padding-bottom:120px">
            @include('admin.errors.error')
            <form action="{{route('cate.postadd')}}" method="POST">
              <input type="hidden" name="_token" value="{{csrf_token()}}">

                <div class="form-group">
                    <label>Category Name</label>
                    <input class="form-control" name="txtCateName" placeholder="Please Enter Category Name" />
                </div>

                <button type="submit" class="btn btn-default">Category Add</button>
            <form>
        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /.container-fluid -->
@stop
