@extends('layouts.master')
@section('title','Trang thương hiệu')
@section('content')
<div class="content">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-12 top">
        <h3 class="pull-left">{!! $category->name !!} </h3>
        <ol class="breadcrumb pull-right">
          <li><a href="#">Home</a></li>
          <li><a href="#">Library</a></li>
          <li class="active">Data</li>
        </ol>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-3 col-md-3 col-lg-3 menudoc">
        <ul class="nav nav-pills nav-stacked" role="tablist">
          <li class="active"><a href="#">Home</a></li>
        </ul>
      </div>
      <div class="col-sm-9 col-md-9 col-lg-9 trademark">
        <!--new products-->
        <div class="product">
            <div class="row">
              <div class="col-md-12 col-sm-12 col-lg-12">
                <h2>Sản Phẩm Mới</h2>
              </div>
            </div>
            <div class="products">
              <div class="row">
              @foreach($product as $newproduct)
              @if($newproduct->trademark->category->id == $category->id)
              <div class="col-md-4 pd">
                  <div class="box">
                    <a href="{{route('detail',$newproduct->id)}}"><img src="{{asset('Admin_style/images/'.$newproduct->images)}}" alt=""></a>
                    <span class="newicon"><img src="images/icon-new.gif" alt=""></span>
                    @if($newproduct->price_sale != 0)
                      <div class="ribbon"><span>Sale</span></div>
                    @endif
                  </div>
                <div class="product_details">
                  <a href="{{route('detail',$newproduct->id)}}"><h3>{!! $newproduct->name !!}</h3></a>
                  <div class="prices">
                    @if($newproduct->price_sale != 0)
                      <span class="price_sale">{!! number_format($newproduct->price) !!} VNĐ</span>
                      <span class="price">{!! number_format($newproduct->price_sale) !!} VNĐ</span>
                    @else
                    <span class="price">{!! number_format($newproduct->price) !!} VNĐ</span>
                    @endif
                  </div>
                  <div class="chuyenhuong">
                    <form class="form-group" action="{{route('postCart')}}" method="post">
                      <input type="hidden" name="_token" value="{{csrf_token()}}">
                      <input type="hidden" name="quantity" value="1">
                      <button class="btn btn-default btn-primary btn-sm" name="product_id" value="{{$newproduct->id}}"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                      <a href="{{route('detail',$newproduct->id)}}" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                    </form>
                  </div>
                  </div>
              </div>
              @endif
              @endforeach
              </div>
            </div>
        </div>
        <!--end product new-->
      </div>
    </div>
  </div>
</div>
@stop
