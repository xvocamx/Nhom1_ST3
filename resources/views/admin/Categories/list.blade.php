@extends('admin.layouts.master')
@section('title','Danh sách sản phẩm')
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Category
                <small>List</small>
                <a href="{{route('cate.getadd')}}" class="btn btn-primary pull-right">Add Category</a>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
          @include('admin.errors.message')
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
            <thead>
                <tr align="center">
                    <th>STT</th>
                    <th>Name</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
              <?php $stt=1; ?>
              @foreach($categories as $category)
                <tr class="odd gradeX" align="center">
                    <td>{{$stt}}</td>
                    <td>{{$category->name}}</td>
                    <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="{{route('cate.getedit',$category->id)}}">Edit</a></td>
                    <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a href="{{route('cate.getdelete',$category->id)}}" onclick="return xacnhanxoa('Bạn có chắc muốn xóa không ?')"> Delete</a></td>
                </tr>
                <?php $stt++; ?>
              @endforeach
            </tbody>
        </table>
    </div>
    <!-- /.row -->
</div>
<!-- /.container-fluid -->
@stop
