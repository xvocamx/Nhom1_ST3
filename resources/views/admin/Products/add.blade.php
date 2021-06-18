@extends('admin.layouts.master')
@section('title','them san pham')
@section('content')
<form action="{{route('product.postadd')}}" method="POST" enctype="multipart/form-data">
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Product
                <small>Add</small>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
        <div class="col-lg-7" style="padding-bottom:120px">
          @include('admin.errors.error')

              <input type="hidden" name="_token" value="{{csrf_token()}}">
                <div class="form-group">
                    <label>Category Name</label>
                    <select class="form-control" name="category" id="categories">
                      @foreach($categories as $category)
                        <option value="{{$category->id}}">{{$category->name}}</option>
                      @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label>Trademark Name</label>
                    <select class="form-control" name="trademark" id="trademarks">
                      @foreach($trademarks as $trademark)
                        <option value="{{$trademark->id}}">{{$trademark->name}}</option>
                      @endforeach
                    </select>
                </div>
                <div class="form-group">
                    <label>Name Product</label>
                    <input class="form-control" name="txtName" placeholder="Please Enter Name Product" required />
                </div>
                <div class="form-group">
                    <label>Price</label>
                    <input class="form-control" name="txtPrice" placeholder="Please Enter Price" required />
                </div>
                <div class="form-group">
                    <label>Price Sale</label>
                    <input class="form-control" name="txtPriceSale" placeholder="Please Enter Price Sale" required />
                </div>
                <div class="form-group">
                    <label>Quantity</label>
                    <input class="form-control" name="txtQuantity" placeholder="Please Enter Quantity" required />
                </div>
                <div class="form-group">
                    <label>Color</label>
                    <input class="form-control" name="txtColor" placeholder="Please Enter Color" required />
                </div>
                <div class="form-group">
                    <label>Image</label>
                    <input type="file" name="fImages">
                </div>

                <div class="form-group">
                    <label>Product Description</label>
                    <textarea class="form-control ckeditor" id="demo" rows="10" name="detail" required></textarea>
                </div>
                <div class="form-group">
                    <label>Product Hightlights</label>
                    <label class="radio-inline">
                        <input name="rdoStatus" value="0" checked="" type="radio">No
                    </label>
                    <label class="radio-inline">
                        <input name="rdoStatus" value="1" type="radio">Yes
                    </label>
                </div>

                <button type="submit" class="btn btn-default">Product Add</button>

        </div>
        <div class="col-md-1"></div>
        <div class="col-md-4">
          @for($i=1;$i<=10;$i++)
            <div class="form-group">
                <label for="">Images Detail {{$i}}</label>
                <input type="file" name="fProductDetail[]"/>
            </div>
          @endfor
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
