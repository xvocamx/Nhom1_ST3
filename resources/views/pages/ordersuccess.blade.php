@extends('layouts.master')
@section('title','Thanh Toán Thành Công')
@section('content')
  <div class="container">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <h2 class="text-center" style="color:red;font-weight:bold;">Thanh Toán Thành Công</h2>
        <h3 class="text-center">Cảm ơn bạn đã mua hàng tại công ty của chúng tôi</h3>
        <h3 class="text-center">Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất</h3>
        <h5 class="text-center" style="padding:20px 0px;"><a href="{{url('/')}}" class="btn btn-primary">Tiếp Tục Mua Sắm</a></h5>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>
@stop
