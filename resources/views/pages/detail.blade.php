@extends('layouts.master')
@section('title','Trang Chi Tiết Sản Phẩm')
@section('content')
<div class="content">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-lg-12 top">
                <h3 class="pull-left">{!! $product->trademark->category->name !!} : {!! $product->trademark->name !!}
                </h3>
                <ol class="breadcrumb pull-right">
                    <li><a href="{{url('/')}}">Home</a></li>
                    <li><a href="{{route('trademarks',$product->trademark->id)}}">{!! $product->trademark->name !!}</a>
                    </li>
                    <li class="active">{!! $product->name !!}</li>
                </ol>
            </div>
        </div>
        <div class="row">
            <div class="col-md-9 col-lg-9">
                <div class="sanpham">
                    <img src="{{asset('Admin_style/images/'.$product->images)}}" alt=""
                        class="img-thumbnail img-responsive anhlon">
                    <div class="detailstyle">
                        <h3>{!! $product->name !!}</h3>
                        @if($product->price_sale != 0)
                        <div class="price_old">
                            <span style="color:black;font-weight:bold;font-size:17px;">Giá Cũ:</span>
                            <span class="price_sale">{!! number_format($product->price) !!} VNĐ</span>
                        </div>
                        <div class="price_new">
                            <span style="color:black;font-weight:bold;font-size:17px;">Giá Khuyến Mãi:</span>
                            <span class="price">{!! number_format($product->price_sale) !!} VNĐ</span>
                        </div>
                        @else
                        <div class="price_old">
                            <span style="color:black;font-weight:bold;font-size:17px;">Giá : </span><span
                                class="price">{!! number_format($product->price) !!} VNĐ</span>
                        </div>

                        @endif
                        <h5>
                            Color: @if($product->color == 'Red')
                            <span style="color:red;font-weight:bold;">{{ $product->color }}</span>
                            @elseif($product->color == 'Black')
                            <span style="color:black;font-weight:bold;">{{ $product->color }}</span>
                            @elseif($product->color == 'Pink')
                            <span style="color:pink;font-weight:bold;">{{ $product->color }}</span>
                            @elseif($product->color == 'Gold')
                            <span style="color:yellow;font-weight:bold;">{{ $product->color }}</span>
                            @elseif($product->color == 'White')
                            <span style="color:white;background:#222222;font-weight:bold;">{{ $product->color }}</span>
                            @endif
                        </h5>
                        <form action="{{ route('postCart') }}" method="post">
                            <input type="hidden" name="_token" value="{{csrf_token()}}">
                            <input type="hidden" name="product_id" value="{{ $product->id }}">
                            <div class="form-group">
                                <label for="">Số lượng</label>
                                <input type="text" name="quantity" value="1" size="1">
                            </div>
                            <button class="btn btn-primary">Đặt Hàng</button>
                        </form>

                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="images_product">
                    @if(count($product_images) > 0)
                    @foreach($product_images as $productimage)
                    <img src="{!! asset('Admin_style/images/details/'.$productimage['image']) !!}" alt=""
                        class="img-responsive img-thumbnail anhnho" style="cursor:pointer;">
                    @endforeach
                    @endif
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Chi Tiết Điện Thoại</h3>
                    </div>
                    <div class="panel-body" style="padding-left:50px;">
                        {!! $product->detail !!}
                    </div>
                </div>

            </div>
            @if(count($different_products)>0)
            <div class="col-md-3 col-lg-3">
                <div class="sanphamlienquan">
                    <h3 class="text-center" style="color:blue;">Sản phẩm khác</h3>
                    @foreach($different_products as $differentpd)
                    <div class="sp">
                        <a href="{{route('detail',$differentpd->id)}}">
                            <img src="{!! asset('Admin_style/images/'.$differentpd->images) !!}" alt="">
                            <h5>{{$differentpd->name}}</h5>
                        </a>
                        @if($differentpd->price_sale != 0)
                        <del>{!! number_format($differentpd->price) !!} VNĐ</del><br>
                        <span style="color:orange;">{!! number_format($differentpd->price_sale) !!} VNĐ</span>
                        @else
                        <span style="color:orange;">{!! number_format($differentpd->price) !!} VNĐ</span>
                        @endif
                    </div>
                    <div class="clearfix"></div>
                    @endforeach
                </div>
            </div>
            @endif
        </div>



    </div>
    
</div>
@stop
@section('script')
<script type="text/javascript">
$(document).ready(function() {
    $(".anhnho").hover(function() {
        anho = $(this).attr("src");
        $(".anhlon").attr('src', '' + anho);
        $(this).css('border', '1px solid black');
    }, function() {
        $(this).css('border', 'none');
    });
});
</script>
@endsection