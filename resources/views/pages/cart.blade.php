@extends('layouts.master')
@section('title','Trang Giỏ Hàng')
@section('content')
<div class="content">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-12 top">
        <h3 class="pull-left">Điện Thoại</h3>
        <ol class="breadcrumb pull-right">
          <li><a href="#">Home</a></li>
          <li><a href="#">Library</a></li>
          <li class="active">Data</li>
        </ol>
      </div>
    </div>
    <div class="row">
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
      <div class="col-sm-12 col-md-12 col-lg-12 shopping_cart table-responsive">
        <table class="table table-bordered">
          <thead style="text-center">
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Total</th>
            <th style="width:70px;">Remove</th>
          </thead>
          <tbody>
            @if(count($content)>0)
            <?php $total=0; ?>
              @foreach($content as $item)
              <tr>
                <td style="overflow:hidden;">
                  <img src="{{asset('Admin_style/images/'.$item->options->image)}}" alt="" class="img-responsive img-thumbnail" style="width: auto;">
                  <p>{!! $item->name !!}</p>
                </td>
                <td>
                  @if($item->options->price_sale==0)
                    {!! number_format($item->price) !!} VNĐ
                  @else
                    {!! number_format($item->options->price_sale) !!} VNĐ
                  @endif
                </td>
                <td style="width:150px;">
                  <form class="quantity-form" action="{{route('postUpdateCart')}}" method="post">
                    <input type="hidden" name="_token" value="{{csrf_token()}}">
                    <input type="number" min=1 max=100 name="quantity" value="{{$item->qty}}" style="width:50px;">
                    <button class="update btn btn-info btn-sm" name="rowid" value="{{ $item->rowId }}">update</button>
                  </form>

                </td>
                <td class="total-item" rowid="{{ $item->rowId }}">
                  @if($item->options->price_sale==0)
                      <?php $totalprice = $item->price * $item->qty; ?>
                      {!! number_format($totalprice) !!} VNĐ
                  @else
                      <?php $totalprice = $item->options->price_sale * $item->qty; ?>
                      {!! number_format($totalprice) !!} VNĐ
                  @endif
                </td>
                <td><a href="{{route('getRemoveCart',$item->rowId)}}"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
              </tr>
              <?php $total +=$totalprice; ?>
              @endforeach
          </tbody>
        </table>
      </div>
      <div class="clearfix"></div>
      <div class="col-md-9">
        <div class="">
          <a href="{{route('getOrder')}}" class="btn btn-success">Thanh Toán</a> hoặc
          <a href="" class="btn btn-info">Tiếp tục mua sắm</a>
        </div>
      </div>
      <div class="panel panel-default col-md-3">
        <div class="panel-heading" style="background:gray;">
          <h3 class="panel-title" style="font-weight:bold;">Tổng Tiền</h3>
        </div>
        <div class="panel-body">
          <p style="font-weight:bold;color:red;">{{ number_format($total) }} VNĐ</p>
        </div>
        </div>

      @else
        <tr>
          <td colspan='5' style="text-align:center;Color:red; font-weight:bold;">Không có sản phẩm nào trong giỏ hàng</td>
        </tr>
        </tbody>
      </table>
      <div class="col-md-12 col-lg-12">
        <a href="{{url('/')}}" style="color:red;font-weight:bold;">Trở về trang chủ</a>
      </div>
      @endif
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
