@extends('layouts.master')
@section('title','Trang thương hiệu')
@section('content')
<div class="content">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-12 top">
        <h3 class="pull-left">{!! $trademark->category->name !!} : {!! $trademark->name !!}</h3>
        <ol class="breadcrumb pull-right">
          <li><a href="{{url('/')}}">Home</a></li>
          <li><a href="javascript:void(0)">{{$trademark->category->name}}</a></li>
          <li class="active">{{$trademark->name}}</li>
        </ol>
      </div>
    </div>
    <div class="row">

      <div class="col-sm-12 col-md-12 col-lg-12 trademark">
        <!--new products-->
        <div class="product" style="margin-top:20px;">
            <div class="products">
              <div class="row">
              @if(count($pd_trademark) > 0)
                @foreach($pd_trademark as $pdtrademark)
                  <div class="col-md-3 pd">
                    <div class="box">
                      <a href="{{route('detail',$pdtrademark->id)}}"><img src="{!! asset('Admin_style/images/'.$pdtrademark->images) !!}" alt=""></a>
                      @if($pdtrademark->price_sale != 0)
                        <div class="ribbon"><span>Sale</span></div>
                      @endif
                    </div>
                    <div class="product_details">
                      <a href="{{route('detail',$pdtrademark->id)}}"><h3>{!! $pdtrademark->name  !!}</h3></a>
                      <div class="prices">
                        @if($pdtrademark->price_sale == 0)
                          <span style="font-weight:bold;">Giá : </span> <span class="price">{!! number_format($pdtrademark->price) !!} VNĐ</span>
                        @else
                          <span class="price_sale">{!! number_format($pdtrademark->price) !!} VNĐ</span>
                          <span class="price">{!! number_format($pdtrademark->price_sale) !!} VNĐ</span>
                        @endif
                      </div>
                      <form action="{{route('postCart')}}" method="post">
                        <input type="hidden" name="_token" value="{{csrf_token()}}">
                        <input type="hidden" name="quantity" value="1">
                        <button class="btn btn-default btn-primary btn-sm" name="product_id" value="{{$pdtrademark->id}}"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                        <a href="{{route('detail',$pdtrademark->id)}}" name="details" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                      </form>
                    </div>
                  </div>
                @endforeach
                <div class="clearfix"></div>
                <div class="paginate text-center">
                  {{$pd_trademark->links()}}
                </div>
              @else
                <div style="font-weight:bold; font-size:30px; color:red;text-align:center;padding:20px 0px;">Không có sản phẩm nào</div>
              @endif
              </div>
            </div>
        </div>
        <!--end product new-->


      </div>
    </div>
  </div>
</div>
@stop
