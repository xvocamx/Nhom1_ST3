@extends('admin.layouts.master')
@section('title','Danh sách thành viên')
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Comment
                <small>List</small>
                
            </h1>
        </div>
        <div class="col-md-12 col-lg-12">
          @if(Session::has('thongbao'))
            <div class="alert alert-{!! Session::get('color') !!}">
              {!! Session::get('thongbao') !!}
            </div>
          @endif
        </div>
        <!-- /.col-lg-12 -->
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
            <thead>
                <tr align="center">
                    <th>STT</th>
                    <th>User</th>
                    <th>Product</th>
                    <th>Comment</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
              <?php $stt=1; ?>
                @foreach($comment as $value)
                <tr class="odd gradeX" align="center">
                    <td>{{$stt}}</td>
                    @foreach($user as $item)
                      @if($value->idUser == $item->id)
                        <td>{{$item->name}}</td>
                      @endif
                    @endforeach
                    @foreach($product as $item)
                      @if($value->idProduct == $item->id)
                        <td>{{$item->name}}</td>
                      @endif
                    @endforeach
                    <td>{{$value->comment}}</td>              
                    <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a href="{{route('comment.getdelete',$value->comment_id)}}"> Delete</a></td>
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
