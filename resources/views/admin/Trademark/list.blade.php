@extends('admin.layouts.master')
@section('title','Danh sách sản phẩm')
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Trademark
                <small>List</small>
                <a href="{{route('trademark.getadd')}}" class="btn btn-primary pull-right">Add Trademark</a>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
        @include('admin.errors.message')
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
            <thead>
                <tr align="center">
                    <th>ID</th>
                    <th>Name</th>
                    <th>Category Parent</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
              @foreach($trademarks as $trademark)
                <tr class="odd gradeX" align="center">
                    <td>{{$trademark->id}}</td>
                    <td>{{$trademark->name}}</td>
                    <td>{{$trademark->category->name}}</td>
                    <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="{{route('trademark.getedit',$trademark->id)}}">Edit</a></td>
                    <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a onclick="return xacnhanxoa('Bạn có chắc muốn xóa không ?')" href="{{route('trademark.getdelete',$trademark->id)}}"> Delete</a></td>
                </tr>
              @endforeach
            </tbody>
        </table>
    </div>
    <!-- /.row -->
</div>
<!-- /.container-fluid -->
@stop
