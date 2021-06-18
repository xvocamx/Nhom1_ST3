@extends('admin.layouts.master')
@section('title','Danh sach san pham')
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Product
                <small>List</small>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
        @include('admin.errors.message')
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
            <thead>
                <tr align="center">
                    <th>STT</th>
                    <th>Name Product</th>
                    <th>Image</th>
                    <th>Price</th>
                    <th>Price Sale</th>
                    <th>Trademark Name</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
              <?php $stt=1; ?>
              @foreach($products as $product)
                <tr class="odd gradeX" align="center">
                    <td>{{$stt}}</td>
                    <td><a href="#">{!! $product["name"] !!}</a></td>
                    <td><img src="Admin_style/images/{{$product->images}}" alt="" style="width:70px;"></td>
                    <td>{!! number_format($product["price"]) !!} VNĐ</td>
                    <td>{!! number_format($product["price_sale"]) !!} VNĐ</td>
                    <td>{!! $product->trademark->name !!}</td>
                    <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="{{route('product.getedit',$product->id)}}">Edit</a></td>
                    <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a onclick="return xacnhanxoa('Bạn có chắc là muốn xóa hay không ?')" href="{{route('product.getdelete',$product->id)}}"> Delete</a></td>
                </tr>
                <?php $stt++; ?>
              @endforeach
            </tbody>
        </table>
    </div>
    <!-- /.row -->
</div>
<!-- /.container-fluid -->
@stop
