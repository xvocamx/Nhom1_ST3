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
        <img src="//cdn.tgdd.vn/2021/06/banner/hotsale-830-300-830x300-1.png" alt="..." class="img-responsive">
      </div>
      <div class="item">
        <img src="images/slider3.jpg" alt="..." class="img-responsive">
      </div>
      <div class="item">
        <img src="//cdn.tgdd.vn/2021/06/banner/hotsale-830-300-830x300-1.png" alt="..." class="img-responsive">
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



  <div class="tab-content">
    <div id="phone1" class="tab-pane fade in active">
      <!--new products-->
      <div class="product">
        <div class="container">
          <div class="row">
            <div class="col-md-12 col-sm-12 col-lg-12">
            <h2 class="box-common__title" style="font-size: 26px; font-weight: bold; line-height: 40px; width: 32%; padding-top: 25px;">SẢN PHẨM MỚI NHẤT</h2>
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
 
      <!--sale products-->
      <div class="product">
        <div class="container">
          <div class="row">
            <div class="col-md-12 col-sm-12 col-lg-12">
            <h2 class="box-common__title" style="font-size: 26px; font-weight: bold; line-height: 40px; width: 32%; padding-top: 25px;">Sản Phẩm Khuyến Mãi</h2>
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

      <!--hightlight products-->
      <div class="product">
        <div class="container">
          <div class="row">
            <div class="col-md-12 col-sm-12 col-lg-12">
            <h2 class="box-common__title" style="font-size: 26px; font-weight: bold; line-height: 40px; width: 32%; padding-top: 25px;">Sản Phẩm Nổi Bật</h2>
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




  @foreach($category as $item)
  <?php  $i = 0 ?>
   <!--hightlight products-->
    <div class="product">
          <div class="container">
            <div class="row">
              <div class="col-md-12 col-sm-12 col-lg-12">
              <h2 class="box-common__title" style="font-size: 26px; font-weight: bold; line-height: 40px; width: 32%; padding-top: 25px;">{{$item->name}}</h2>
              </div>
            </div>
            <div class="products">
              <div class="row">
                @foreach($products as $product)
                  @if($product->trademark->category->id == $item->id)
                  <?php  $i = $i + 1 ?>
                  @if($i < 5)
                      <div class="col-md-3 pd">
                          <div class="box">
                            <a href="{{route('detail',$product->id)}}"><img src="{{asset('Admin_style/images/'.$product->images)}}" alt="{!!$product->name!!}"></a>
                            @if($product->price_sale != 0)
                              <div class="ribbon"><span>Sale</span></div>
                            @endif
                          </div>
                        <div class="product_details">
                          <a href="{{route('detail',$product->id)}}"><h3>{!! $product->name !!}</h3></a>
                          <div class="prices">
                            @if($product->price_sale == 0)
                              <span class="price">{!! number_format($product->price) !!} VNĐ</span>
                            @else
                              <span class="price_sale">{!! number_format($product->price) !!} VNĐ</span>
                              <span class="price">{!! number_format($product->price_sale) !!} VNĐ</span>
                            @endif
                          </div>
                          <form action="{{route('postCart')}}" method="post">
                            <input type="hidden" name="_token" value="{{csrf_token()}}">
                            <input type="hidden" name="quantity" value="1">
                            <button class="btn btn-default btn-primary btn-sm" name="product_id" value="{{$product->id}}"><i class="fa fa-shopping-cart" aria-hidden="true"></i></button>
                            <a href="{{route('detail',$product->id)}}" name="details" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                          </form>
                        </div>
                     </div>
                     @endif
                  @endif
                @endforeach
              </div>
            </div>
          </div><!--end container-->
        </div>
      <!--end hightlight products-->
   @endforeach
@stop
