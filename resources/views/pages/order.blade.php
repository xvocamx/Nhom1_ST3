@extends('layouts.master')
@section('title','Trang Thanh Toán')
@section('content')
<div class="content">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-12 top">
        <h3 class="pull-left"></h3>
        <ol class="breadcrumb pull-right">
          <li><a href="{{url('/')}}">Home</a></li>
          <li><a href="{{route('getCart')}}">Giỏ Hàng</a></li>
          <li class="active">Order</li>
        </ol>
      </div>
    </div>
    <div class="row">

      <div class="col-md-6 col-lg-6 donhang pull-right">
        <div class="panel panel-default">
          <div class="panel-heading">
            <h3 class="panel-title" style="font-weight:bold;">Đơn Hàng của bạn</h3>
          </div>
          <div class="panel-body">
            <?php $total=0; ?>
            @foreach($content as $item)
            <div style="padding-bottom:30px;">
              <img src="{{asset('Admin_style/images/'.$item->options->image)}}" alt="" class="img-responsive img-thumbnail">
              <p style="font-weight:bold;font-size:17px;">{!!$item->name!!}</p>
              <p>Đơn giá: @if($item->options->price_sale == 0)
                              {{number_format($item->price)}} VNĐ
                          @else
                              {{number_format($item->options->price_sale)}} VNĐ
                          @endif</p>
              <p>Số lượng: {{$item->qty}}</p>
            </div>
            <?php
            if($item->options->price_sale==0){
                 $totalprice = $item->price * $item->qty;
              }else{
                $totalprice = $item->options->price_sale * $item->qty;
              }
            $total +=$totalprice;
            ?>
            <div class="clearfix"></div>
            @endforeach
          </div>
          <div class="panel-footer">
            <p style="color:black;font-weight:bold;">Tổng Tiền :<span style="color:red;font-weight:bold;"> {{number_format($total)}} VNĐ</span></p>
          </div>
        </div>
      </div>
      <div class="col-md-6 col-lg-6 dathang pull-left">
        <h3 style="color:black;font-weight:bold;">Đặt Hàng</h3>
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
        (*): bắt buộc

        @if(Auth::check())
          <form class="" action="{{route('postOrder')}}" method="post">
          <input type="hidden" name="_token" value="{{csrf_token()}}">
            <table>
              <tr>
                <td><label for="" class="form-label">Họ Tên (*)</label></td>
                <td><input type="text" name="txtname" value="{!! Auth::user()->name !!}" class="form-control" required></td>
              </tr>
              <tr>
                <td><label for="" class="form-label">Email (*)</label></td>
                <td><input type="email" name="txtemail" value="{!! Auth::user()->email !!}" class="form-control" required></td>
              </tr>
              <tr>
                <td><label for="">Điện Thoại (*)</label></td>
                <td><input type="text" name="txtphone" value="{{Auth::user()->phone}}" class="form-control" required></td>
              </tr>
              <tr>
                <td><label for="">Địa Chỉ (*)</label></td>
                <td><input type="text" name="txtaddress" value="{{Auth::user()->address}}" class="form-control" required></td>
              </tr>
              <tr>
                <td><label for="">Ghi Chú</label></td>
                <td><textarea name="detail" rows="8" cols="80" class="form-control"></textarea></td>
              </tr>
              <tr>
                <td></td>
                <td><button name="total" value="{{$total}}" class="btn btn-primary buttondathang">Đặt Hàng</td>
              </tr>
            </table>
          </form>
        @else
          <form class="" action="{{route('postOrder')}}" method="post">
          <input type="hidden" name="_token" value="{{csrf_token()}}">
            <table>
              <tr>
                <td><label for="" class="form-label">Họ Tên (*)</label></td>
                <td><input type="text" name="txtname" value="" class="form-control" value="{{old('name')}}" required></td>
              </tr>
              <tr>
                <td><label for="" class="form-label">Email (*)</label></td>
                <td><input type="email" name="txtemail" value="" class="form-control" value="{{old('email')}}" required></td>
              </tr>
              <tr>
                <td><label for="">Điện Thoại (*)</label></td>
                <td><input type="text" name="txtphone" value="" class="form-control" value="{{old('phone')}}" required></td>
              </tr>
              <tr>
                <td><label for="">Địa Chỉ (*)</label></td>
                <td><input type="text" name="txtaddress" value="" class="form-control" value="{{old('address')}}" required></td>
              </tr>
              <tr>
                <td><label for="">Ghi Chú</label></td>
                <td><textarea name="detail" rows="8" cols="80" class="form-control">{{old('detail')}}</textarea></td>
              </tr>
              <tr>
                <td></td>
                <td><button name="total" value="{{$total}}" class="btn btn-primary buttondathang">Đặt hàng<button></td>
              </tr>
            </table>
          </form>
        @endif
      </div>

    </div><!--end row-->

  </div>
</div>
@stop
