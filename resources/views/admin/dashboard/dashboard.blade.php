@extends('admin.layouts.master')
@section('title','Trang Chủ Admin')
@section('content')
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12 col-lg-12">
        <h2 style="font-weight:bold;">Dashboard</h2>
        <hr>
      </div>
      <?php
        $total_order = DB::table('orders')->count();
        $total_neworder = DB::table('orders')->where('status',0)->count();
        $total_products = DB::table('products')->count();
        $total_customer = DB::table('users')->where('level',0)->count();
        $total_admin = DB::table('users')->where('level',1)->count();
      ?>
      <div class="row">
        <div class="col-md-6 col-lg-6">
          <i class="fa fa-bar-chart" aria-hidden="true" style="font-size:40px;"></i>
          <a href="{{ url('admin/order/list') }}" style="color:#0000FF;font-size:20px;"> Tổng Đơn Hàng: </a>
          <span style="color:black;font-size:20px;font-weight:bold;">{{$total_order}}</span>
        </div>
        <div class="col-md-6 col-lg-6">
          <i class="fa fa-bar-chart" aria-hidden="true" style="font-size:40px;"></i>
          <a href="{{ url('admin/order/list') }}" style="color:red;font-size:20px;"> Đơn Hàng Mới: </a>
          <span style="color:black;font-size:20px;font-weight:bold;">{{$total_neworder}}</span>
        </div>
      </div>
      <div class="row" style="margin-top:5%;">
        <div class="col-md-6 col-lg-6">
          <i class="fa fa-bar-chart" aria-hidden="true" style="font-size:40px;"></i>
          <a href="{{ url('admin/product/list') }}" style="color:green;font-size:20px;"> Sản Phẩm: </a>
          <span style="color:black;font-size:20px;font-weight:bold;">{{$total_products}}</span>
        </div>
        <div class="col-md-6 col-lg-6">
          <i class="fa fa-bar-chart" aria-hidden="true" style="font-size:40px;"></i>
          <a href="{{ url('admin/user/list') }}" style="color:purple;font-size:20px;"> Khách Hàng: </a>
          <span style="color:black;font-size:20px;font-weight:bold;">{{$total_customer}}</span>
        </div>
      </div>
      <div class="row" style="margin-top:5%;">
        <div class="col-md-6 col-lg-6">
          <i class="fa fa-bar-chart" aria-hidden="true" style="font-size:40px;"></i>
          <a href="{{ url('admin/user/list') }}" style="color:black;font-size:20px;"> Administrator: </a>
          <span style="color:black;font-size:20px;font-weight:bold;">{{$total_admin}}</span>
        </div>
      </div>

    </div>
  </div>
@stop
