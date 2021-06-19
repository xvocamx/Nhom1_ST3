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
        <div class="col-md-6 col-lg-6" style="border-radius: .25rem; box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%);display: block; margin-bottom: 20px;position: relative;background-color: #17a2b8!important;">
          <i class="fa fa-bar-chart" aria-hidden="true" style=" font-size: 90px;top: 20px;"></i>
          <a href="{{ url('admin/order/list') }}" style="color:#fff;font-size:24px;font-weight:bold;"> Tổng Đơn Hàng: </a>
          <span style="color:#fff;font-size:24px;font-weight:bold;">{{$total_order}}</span>
        </div>
        <div class="col-md-6 col-lg-6" style="border-radius: .25rem; box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%);display: block; margin-bottom: 20px;position: relative;background-color: #6c757d!important;">
          <i class="fa fa-dashboard fa-fw" aria-hidden="true" style="font-size:90px;"></i>
          <a href="{{ url('admin/order/list') }}" style="color:#fff;font-size:22px;"> Đơn Hàng Mới: </a>
          <span style="color:#fff;font-size:22px;font-weight:bold;">{{$total_neworder}}</span>
        </div>
      </div>
      <div class="row" >
        <div class="col-md-6 col-lg-6" style="border-radius: .25rem; box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%);display: block; margin-bottom: 20px;position: relative;background-color: #ffc107!important;">
          <i class="fa fa-cube fa-fw" aria-hidden="true" style="font-size:90px;"></i>
          <a href="{{ url('admin/product/list') }}" style="color:#fff;font-size:22px;"> Sản Phẩm: </a>
          <span style="color:#fff;font-size:22px;font-weight:bold;">{{$total_products}}</span>
        </div>
        <div class="col-md-6 col-lg-6" style="border-radius: .25rem; box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%);display: block; margin-bottom: 20px;position: relative;background-color: #dc3545!important;">
          <i class="fa fa-bar-chart" aria-hidden="true" style="font-size:90px;"></i>
          <a href="{{ url('admin/user/list') }}" style="color:#fff;font-size:22px;"> Khách Hàng: </a>
          <span style="color:#fff;font-size:22px;font-weight:bold;">{{$total_customer}}</span>
        </div>
      </div>
      <div class="row" >
        <div class="col-md-6 col-lg-6" style="border-radius: .25rem; box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%);display: block; margin-bottom: 20px;position: relative;background-color: #28a745!important;">
          <i class="fa fa-users fa-fw" aria-hidden="true" style="font-size:90px;"></i>
          <a href="{{ url('admin/user/list') }}" style="color:#fff;font-size:22px;"> Administrator: </a>
          <span style="color:#fff;font-size:22px;font-weight:bold;">{{$total_admin}}</span>
        </div>
      </div>

    </div>
  </div>
@stop
