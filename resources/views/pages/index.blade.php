@extends('layouts.master')
@section('title','Trang Chủ')
@section('content')
<div class="slide">
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
      <li data-target="#carousel-example-generic" data-slide-to="1"></li>
      <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="{{asset('images/slider1.jpg')}}" alt="..." class="img-responsive">
      </div>
      <div class="item">
        <img src="images/slider2.png" alt="..." class="img-responsive">
      </div>
      <div class="item">
        <img src="images/slider3.jpg" alt="..." class="img-responsive">
      </div>
      <div class="item">
        <img src="images/slider4.jpg" alt="..." class="img-responsive">
      </div>
    </div>
    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<!--end slide-->

<div class="container">
  <h2 style="border-top:2px dashed black;"></h2>
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#phone1">Sản Phẩm Mới</a></li>
    <li><a data-toggle="tab" href="#phone2">Sản Phẩm khuyến mãi</a></li>
    <li><a data-toggle="tab" href="#phone3">Sản Phẩm Nổi Bật</a></li>
  </ul>

  <div class="tab-content">
    <div id="phone1" class="tab-pane fade in active">
      <!--new products-->
      <div class="product">
        <div class="container">
          <div class="row">
            <div class="col-md-12 col-sm-12 col-lg-12">
              <h2 style="color:blue;">Sản Phẩm Mới</h2>
            </div>
          </div>

          <div class="products">
            <div class="row">
              @foreach($new_products as $newproduct)
              <div class="col-md-3 pd">
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
              @endforeach
            </div>
          </div>

        </div><!--end container-->
      </div>
      <!--end product new-->
    </div>
    <div id="phone2" class="tab-pane fade">
      <!--sale products-->
      <div class="product">
        <div class="container">
          <div class="row">
            <div class="col-md-12 col-sm-12 col-lg-12">
              <h2 style="color:blue;">Sản Phẩm Khuyến Mãi</h2>
            </div>
          </div>

          <div class="products">
            <div class="row">
              @foreach($sale_products as $saleproduct)
                <div class="col-md-3 pd">
                  <div class="box">
                    <a href="{{route('detail',$saleproduct->id)}}"><img src="{{asset('Admin_style/images/'.$saleproduct->images)}}" alt="{!!$saleproduct->name!!}"></a>
                    <div class="ribbon"><span>Sale</span></div>
                  </div>
                <div class="product_details">
                  <a href="{{route('detail',$saleproduct->id)}}"><h3>{!!$saleproduct->name!!}</h3></a>
                  <div class="prices">
                    <span class="price_sale">{!! number_format($saleproduct->price) !!} VNĐ</span>
                    <span class="price">{!! number_format($saleproduct->price_sale) !!} VNĐ</span>
                  </div>
                  <form action="{{route('postCart')}}" method="post">
                    <input type="hidden" name="_token" value="{{csrf_token()}}">
                    <input type="hidden" name="quantity" value="1">
                    <button class="btn btn-default btn-primary btn-sm" name="product_id" value="{{$saleproduct->id}}"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                    <a href="{{route('detail',$saleproduct->id)}}" name="details" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                  </form>
                  </div>
              </div>
              @endforeach
            </div>
          </div>


        </div><!--end container-->
      </div>
      <!--end sale products-->
    </div>
    <div id="phone3" class="tab-pane fade">
      <!--hightlight products-->
      <div class="product">
        <div class="container">
          <div class="row">
            <div class="col-md-12 col-sm-12 col-lg-12">
              <h2 style="color:blue;">Sản Phẩm Nổi Bật</h2>
            </div>
          </div>

          <div class="products">
            <div class="row">
              @foreach($hightlight_products as $hightlightproduct)
                <div class="col-md-3 pd">
                  <div class="box">
                    <a href="{{route('detail',$hightlightproduct->id)}}"><img src="{{asset('Admin_style/images/'.$hightlightproduct->images)}}" alt="{!!$hightlightproduct->name!!}"></a>
                    @if($hightlightproduct->price_sale != 0)
                      <div class="ribbon"><span>Sale</span></div>
                    @endif
                  </div>
                <div class="product_details">
                  <a href="{{route('detail',$hightlightproduct->id)}}"><h3>{!! $hightlightproduct->name !!}</h3></a>
                  <div class="prices">
                    @if($hightlightproduct->price_sale == 0)
                      <span class="price">{!! number_format($hightlightproduct->price) !!} VNĐ</span>
                    @else
                      <span class="price_sale">{!! number_format($hightlightproduct->price) !!} VNĐ</span>
                      <span class="price">{!! number_format($hightlightproduct->price_sale) !!} VNĐ</span>
                    @endif
                  </div>
                  <form action="{{route('postCart')}}" method="post">
                    <input type="hidden" name="_token" value="{{csrf_token()}}">
                    <input type="hidden" name="quantity" value="1">
                    <button class="btn btn-default btn-primary btn-sm" name="product_id" value="{{$hightlightproduct->id}}"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                    <a href="{{route('detail',$hightlightproduct->id)}}" name="details" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                  </form>
                </div>
              </div>
              @endforeach
            </div>
          </div>


        </div><!--end container-->
      </div>
      <!--end hightlight products-->
    </div>
  </div>
</div>

@stop
