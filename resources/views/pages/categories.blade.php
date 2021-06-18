@extends('layouts.master')
@section('title','Trang thương hiệu')
@section('content')
<div class="content">
  <div class="container">
    <div class="row">
      <div class="col-md-12 col-lg-12 top">
        <h3 class="pull-left">{!! $trademark->category->name !!} : {!! $trademark->name !!}</h3>
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

                <div class="col-md-3 pd">
                    <div class="box">
                      <a href="#"><img src="images/slider.jpg" alt=""></a>
                      <span class="newicon"><img src="images/icon-new.gif" alt=""></span>
                      <div class="ribbon"><span>Sale</span></div>
                    </div>
                  <div class="product_details">
                    <a href="#"><h3>Tên sản phẩm</h3></a>
                    <div class="prices">
                      <span class="price_sale">1500000 VNĐ</span>
                      <span class="price">1500000 VNĐ</span>
                    </div>
                    <a href="" class="btn btn-default btn-primary btn-sm" name="cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                    <a href="" name="details" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                  </div>
                </div>
                <div class="col-md-3 pd">
                    <div class="box">
                      <a href="#"><img src="images/slider.jpg" alt=""></a>
                      <span class="newicon"><img src="images/icon-new.gif" alt=""></span>
                      <div class="ribbon"><span>Sale</span></div>
                    </div>
                  <div class="product_details">
                    <a href="#"><h3>Tên sản phẩm</h3></a>
                    <div class="prices">
                      <span class="price_sale">1500000 VNĐ</span>
                      <span class="price">1500000 VNĐ</span>
                    </div>
                    <a href="" class="btn btn-default btn-primary btn-sm" name="cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                    <a href="" name="details" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                  </div>
                </div>
                <div class="col-md-3 pd">
                    <div class="box">
                      <a href="#"><img src="images/slider.jpg" alt=""></a>
                      <span class="newicon"><img src="images/icon-new.gif" alt=""></span>
                      <div class="ribbon"><span>Sale</span></div>
                    </div>
                  <div class="product_details">
                    <a href="#"><h3>Tên sản phẩm</h3></a>
                    <div class="prices">
                      <span class="price_sale">1500000 VNĐ</span>
                      <span class="price">1500000 VNĐ</span>
                    </div>
                    <a href="" class="btn btn-default btn-primary btn-sm" name="cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                    <a href="" name="details" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                  </div>
                </div>
                <div class="col-md-3 pd">
                    <div class="box">
                      <a href="#"><img src="images/slider.jpg" alt=""></a>
                      <span class="newicon"><img src="images/icon-new.gif" alt=""></span>
                      <div class="ribbon"><span>Sale</span></div>
                    </div>
                  <div class="product_details">
                    <a href="#"><h3>Tên sản phẩm</h3></a>
                    <div class="prices">
                      <span class="price_sale">1500000 VNĐ</span>
                      <span class="price">1500000 VNĐ</span>
                    </div>
                    <a href="" class="btn btn-default btn-primary btn-sm" name="cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                    <a href="" name="details" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                  </div>
                </div>
                <div class="col-md-3 pd">
                    <div class="box">
                      <a href="#"><img src="images/slider.jpg" alt=""></a>
                      <span class="newicon"><img src="images/icon-new.gif" alt=""></span>
                      <div class="ribbon"><span>Sale</span></div>
                    </div>
                  <div class="product_details">
                    <a href="#"><h3>Tên sản phẩm</h3></a>
                    <div class="prices">
                      <span class="price_sale">1500000 VNĐ</span>
                      <span class="price">1500000 VNĐ</span>
                    </div>
                    <a href="" class="btn btn-default btn-primary btn-sm" name="cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                    <a href="" name="details" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                  </div>
                </div>
                <div class="col-md-3 pd">
                    <div class="box">
                      <a href="#"><img src="images/slider.jpg" alt=""></a>
                      <span class="newicon"><img src="images/icon-new.gif" alt=""></span>
                      <div class="ribbon"><span>Sale</span></div>
                    </div>
                  <div class="product_details">
                    <a href="#"><h3>Tên sản phẩm</h3></a>
                    <div class="prices">
                      <span class="price_sale">1500000 VNĐ</span>
                      <span class="price">1500000 VNĐ</span>
                    </div>
                    <a href="" class="btn btn-default btn-primary btn-sm" name="cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                    <a href="" name="details" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                  </div>
                </div>
                <div class="col-md-3 pd">
                    <div class="box">
                      <a href="#"><img src="images/slider.jpg" alt=""></a>
                      <span class="newicon"><img src="images/icon-new.gif" alt=""></span>
                      <div class="ribbon"><span>Sale</span></div>
                    </div>
                  <div class="product_details">
                    <a href="#"><h3>Tên sản phẩm</h3></a>
                    <div class="prices">
                      <span class="price_sale">1500000 VNĐ</span>
                      <span class="price">1500000 VNĐ</span>
                    </div>
                    <a href="" class="btn btn-default btn-primary btn-sm" name="cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                    <a href="" name="details" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                  </div>
                </div>
                <div class="col-md-3 pd">
                    <div class="box">
                      <a href="#"><img src="images/slider.jpg" alt=""></a>
                      <span class="newicon"><img src="images/icon-new.gif" alt=""></span>
                      <div class="ribbon"><span>Sale</span></div>
                    </div>
                  <div class="product_details">
                    <a href="#"><h3>Tên sản phẩm</h3></a>
                    <div class="prices">
                      <span class="price_sale">1500000 VNĐ</span>
                      <span class="price">1500000 VNĐ</span>
                    </div>
                    <a href="" class="btn btn-default btn-primary btn-sm" name="cart"><i class="fa fa-shopping-cart" aria-hidden="true"></i></a>
                    <a href="" name="details" class="btn btn-default btn-sm">Details <i class="fa fa-chevron-right" aria-hidden="true"></i></a>
                  </div>
                </div>
              </div>
            </div>

        </div>
        <!--end product new-->


      </div>
    </div>
  </div>
</div>
@stop
