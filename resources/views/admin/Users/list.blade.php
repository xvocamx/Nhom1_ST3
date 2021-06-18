@extends('admin.layouts.master')
@section('title','Danh sách thành viên')
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">User
                <small>List</small>
                <a href="{{route('user.getadd')}}" class="btn btn-primary btn-sm pull-right">Add User</a>
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
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Level</th>
                    <th>Gender</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
              <?php $stt=1; ?>
              @foreach($users as $user)
                <tr class="odd gradeX" align="center">
                    <td>{{$stt}}</td>
                    <td>{{$user["name"]}}</td>
                    <td>{{$user["email"]}}</td>
                    <td>{{$user["phone"]}}</td>
                    @if($user->level == 1 )
                      <td style="color:red;">Admin</td>
                    @else
                      <td>Thành Viên</td>
                    @endif
                    @if($user->gender == 1 )
                      <td>Male</td>
                    @else
                      <td>Female</td>
                    @endif
                    <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="{{route('user.getedit',$user->id)}}">Edit</a></td>
                    <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a href="{{route('user.getdelete',$user->id)}}"> Delete</a></td>
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
