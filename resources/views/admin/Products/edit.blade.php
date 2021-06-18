@extends('admin.layouts.master')
@section('title','Edit san pham')
@section('content')
<form action="{{route('product.postedit',$product->id)}}" method="POST" enctype="multipart/form-data">
<input type="hidden" name="_token" value="{{csrf_token()}}">
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Product
                <small>Edit</small>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
        <div class="col-lg-7" style="padding-bottom:120px">
          @include('admin.errors.error')


                <div class="form-group">
                    <label>Category Name</label>
                    <select class="form-control" name="category" id="categories">
                      @foreach($categories as $category)
                        <option
                        @if($product->trademark->category->id == $category->id)
                        {{'selected'}}
                        @endif
                        value="{{$category->id}}">{{$category->name}}</option>
                      @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label>Trademark Name</label>
                    <select class="form-control" name="trademark" id="trademarks">
                      @foreach($trademarks as $trademark)
                        <option
                          @if($product->trademark->id == $trademark->id)
                          {{'selected'}}
                          @endif
                         value="{{$trademark->id}}">{{$trademark->name}}</option>
                      @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label>Name Product</label>
                    <input class="form-control" name="txtName" placeholder="Please Enter Name Product" required value="{{$product->name}}"/>
                </div>
                <div class="form-group">
                    <label>Price</label>
                    <input class="form-control" name="txtPrice" placeholder="Please Enter Price" required value="{{$product->price}}"/>
                </div>
                <div class="form-group">
                    <label>Price Sale</label>
                    <input class="form-control" name="txtPriceSale" placeholder="Please Enter Price Sale" required value="{{$product->price_sale}}"/>
                </div>
                <div class="form-group">
                    <label>Quantity</label>
                    <input class="form-control" name="txtQuantity" placeholder="Please Enter Quantity" required value="{{$product->quantity}}"/>
                </div>
                <div class="form-group">
                    <label>Color</label>
                    <input class="form-control" name="txtColor" placeholder="Please Enter Color" required value="{{$product->color}}"/>
                </div>
                <div class="form-group">
                    <label>Image Current </label>
                    <img src="Admin_style/images/{{$product->images}}" alt="" style="width:200px;padding-left:20px;" name="fImages">
                    <input type="hidden" name="img_current" value="{{$product->images}}">
                </div>
                <div class="form-group">
                    <label>Image New</label>
                    <input type="file" name="fImageedit">
                </div>

                <div class="form-group">
                    <label>Product Description</label>
                    <textarea class="form-control ckeditor" id="demo" rows="10" name="detail" required>{{$product->detail}}</textarea>
                </div>
                <div class="form-group">
                    <label>Product Hightlights</label>
                    <label class="radio-inline">
                        <input name="rdoStatus" value="0"
                          @if($product->hightlights == 0)
                          {{'checked'}}
                          @endif
                         type="radio">No
                    </label>
                    <label class="radio-inline">
                        <input name="rdoStatus" value="1"
                        @if($product->hightlights == 1)
                        {{'checked'}}
                        @endif
                        type="radio">Yes
                    </label>
                </div>

                <button type="submit" class="btn btn-default">Product Edit</button>

        </div>
        <div class="col-md-1"></div>
        <div class="col-md-4">


          @foreach($product_images as $product_image)
          <div class="form-group">
            <img src="Admin_style/images/details/{{$product_image['image']}}" alt="" style="width:250px;padding:20px;"/>
            <input type="file" name="fEditimages[]">
          </div>
          @endforeach

          <button type="button" name="button" id='button' class="btn btn-primary">Add Images</button>
          <div class="insert"></div>

        </div>
    </div>

    <!-- /.row -->
  </div>
</form>
<!-- /.container-fluid -->
@stop
@section('script')
<script type="text/javascript">
  $(document).ready(function(){
    $("#categories").change(function(){
      var cate_id = $(this).val();
      $.ajax({
        url:"admin/product/"+cate_id+"/ajax",
        type:"GET",
        data:'cate_id='+cate_id,
        async:true,
        success:function(data){
          $("#trademarks").html(data);
        }
      });
    });
  });
</script>
@endsection
@section('style')
<style media="screen">
 .delete{
   position:absolute;
   right:70px;
 }
 #button{
   margin:20px;
 }
 .insert{
   padding:20px;
 }

</style>
@endsection
