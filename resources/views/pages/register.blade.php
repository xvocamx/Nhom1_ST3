@extends('layouts.master')
@section('title','Trang Đăng Nhập')
@section('content')
<div class="content">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3 login">
        <fieldset>
          <legend>Register</legend>
          @if(Session::has('thongbao'))
            <div class="alert alert-{!! Session::get('color') !!}">
              {!! Session::get('thongbao') !!}
            </div>
          @endif
          <div class="col-md-12">
            @if(count($errors)>0)
              <ul>
                <div class="alert alert-danger">
                  @foreach($errors->all() as $error)
                    <li>{{$error}}</li>
                  @endforeach
                </div>
              </ul>
            @endif
          </div>
          <form class="form-horizontal" action="{{route('postregister')}}" method="post">
            <input type="hidden" name="_token" value="{{csrf_token()}}">
            <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
              <div class="col-sm-10">
                <input type="email" name="txtEmail" class="form-control" id="inputEmail3" value="{!!old('txtEmail')!!}" placeholder="Email" required>
              </div>
            </div>
            <div class="form-group">
              <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
              <div class="col-sm-10">
                <input type="password" name="txtPass" class="form-control" id="inputPassword3" placeholder="Password" required value="{!!old('txtPass')!!}">
              </div>
            </div>
            <div class="form-group">
              <label for="inputPassword3" class="col-sm-2 control-label">RePassword</label>
              <div class="col-sm-10">
                <input type="password" name="txtRePass" class="form-control" id="inputPassword3" placeholder="Password" required value="{!!old('txtRePass')!!}">
              </div>
            </div>
            <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">Name</label>
              <div class="col-sm-10">
                <input type="text" name="txtUser" class="form-control" id="inputEmail3" value="{!!old('txtUser')!!}" placeholder="Name" required>
              </div>
            </div>
            <div class="form-group">
              <label for="inputPassword3" class="col-sm-2 control-label">Phone</label>
              <div class="col-sm-10">
                <input type="text" name="txtPhone" class="form-control" id="inputPassword3" placeholder="Phone" required value="{!!old('txtPhone')!!}">
              </div>
            </div>
            <div class="form-group">
              <label for="inputPassword3" class="col-sm-2 control-label">Address</label>
              <div class="col-sm-10">
                <input type="text" name="txtAddress" class="form-control" id="inputPassword3" placeholder="Address" required value="{!!old('txtAddress')!!}">
              </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">Gender</label>
                <div class="col-sm-10">
                  <label class="radio-inline">
                      <input name="gender" value="1" checked="" type="radio">Male
                  </label>
                  <label class="radio-inline">
                      <input name="gender" value="0" type="radio">Female
                  </label>
                </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Sign in</button>
              </div>
            </div>
          </form>
        </fieldset>
      </div>
    </div>

  </div>
</div>

@stop
@section('script')
  <script type="text/javascript">
    $(document).ready(function(){
      $('.alert').delay(3000).slideUp();
    });
  </script>
@endsection
