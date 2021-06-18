@extends('layouts.master')
@section('title','Trang Đăng Nhập')
@section('content')
<div class="content">
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-md-offset-3 login">
        <fieldset>
          <legend>Login</legend>
          @if(Session::has('thongbao'))
            <div class="alert alert-{!! Session::get('color') !!}">
              {!! Session::get('thongbao') !!}
            </div>
          @endif
          <form class="form-horizontal" action="{{route('postloginMember')}}" method="post">
            <input type="hidden" name="_token" value="{{csrf_token()}}">
            <div class="form-group">
              <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
              <div class="col-sm-10">
                <input type="email" name="email" class="form-control" id="inputEmail3" placeholder="Email" required>
              </div>
            </div>
            <div class="form-group">
              <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
              <div class="col-sm-10">
                <input type="password" name="password" class="form-control" id="inputPassword3" placeholder="Password" required>
              </div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                  <label>
                    <input type="checkbox"> Remember me
                  </label>
                </div>
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
