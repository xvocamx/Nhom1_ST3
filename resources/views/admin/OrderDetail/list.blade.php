@extends('admin.layouts.master')
@section('title','Danh sach san pham')
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Order Details
                <small>List</small>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
        @include('admin.errors.message')
        @include('admin.errors.error')
        <div class="row">
          <h4 style="margin-left:20px;"><a href="{{route('order.getlist')}}">Quay Lại</a></h4>
          <div class="col-lg-8">
            <div class="panel panel-default">
              <div class="panel-heading">
                <h3 class="panel-title">Chi Tiết Sản Phẩm</h3>
              </div>
              <div class="panel-body table-responsive">
                <p style="font-weight:bold;">Tổng Tiền: <span style="color:red; font-weight:bold;">{{number_format($order->total_price)}} VNĐ</span></p>
                <table class="table table-bordered table-condensed">
                  <thead>
                    <th>STT</th>
                    <th>Name Product</th>
                    <th>Image Product</th>
                    <th>Quantity</th>
                    <th>Price</th>
                    <th>Action</th>
                  </thead>
                  <tbody>
                    <?php $stt=1; ?>
                    @foreach($order_details as $orderdetail)
                    <tr>
                      <td>{{$stt}}</td>
                      <td>{!! $orderdetail->product->name !!}</td>
                      <td><img src="Admin_style/images/{!! $orderdetail->product->images !!}" alt="" style="width:70px;"></td>
                      <td>{!! $orderdetail['quantity'] !!}</td>
                      <td>{!! number_format($orderdetail['price']) !!} VNĐ</td>
                      <td>
                        <a href="javascript:void(0)" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#exampleModal{{$orderdetail->id}}" data-whatever="@mdo">Edit</a>
                        <!--Edit Order-->
                        <div class="modal fade" id="exampleModal{{$orderdetail->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="exampleModalLabel">Edit OrderDetails</h4>
                              </div>
                              <div class="modal-body">
                                <form action="{{route('orderdetail.postedit',$orderdetail->id)}}" method="POST">
                                  <input type="hidden" name="_token" value="{{csrf_token()}}">
                                  <div class="form-group">
                                    <label for="recipient-name" class="control-label">ID Product:</label>
                                    <input type="text" name="" value="{{$orderdetail->product_id}}" disabled class="form-control">
                                  </div>
                                  <div class="form-group">
                                    <label for="recipient-name" class="control-label">Name Product:</label>
                                    <input type="text" name="" value="{{$orderdetail->product->name}}" disabled class="form-control">
                                  </div>
                                  <div class="form-group">
                                    <label for="recipient-name" class="control-label">Quantity:</label>
                                    <input type="text" name="quantityedit" value="{{$orderdetail->quantity}}"  class="form-control"  required>
                                  </div>
                                  <div class="form-group">
                                    <label for="recipient-name" class="control-label">Price:</label>
                                    <input type="text" name="priceedit" value="{{$orderdetail->price}}"  class="form-control"  required>
                                  </div>

                              </div>
                              <div class="modal-footer">
                                <input type="submit" value="Edit" class="btn btn-primary">
                              </div>
                               </form>
                            </div>
                          </div>
                        </div>
                        <!--end Edit Order-->
                        <a href="{{route('orderdetail.getdelete',$orderdetail->id)}}" onclick="return xacnhanxoa('Bạn có chắc là muốn xóa không ?')" class="btn btn-danger btn-sm">Delete</a>
                      </td>
                    </tr>
                    <?php $stt++; ?>
                    @endforeach
                  </tbody>
                </table>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="panel panel-default table-responsive">
              <div class="panel-heading">
                <h3 class="panel-title">Thông Tin Khách Hàng</h3>
              </div>
              <div class="panel-body">
                <table class="table table-condensed">
                    <td style="width:100px;">Họ Tên :</td>
                    <td>{!! $order->name  !!}</td>
                  </tr>
                  <tr>
                    <td style="width:100px;">Email :</td>
                    <td>{!! $order->email  !!}</td>
                  </tr>
                  <tr>
                    <td style="width:100px;">Điện Thoại</td>
                    <td>{!! $order->phone  !!}</td>
                  </tr>
                  <tr>
                    <td style="width:100px;">Địa Chỉ</td>
                    <td>{!! $order->address  !!}</td>
                  </tr>
                  <tr>
                    <td style="width:100px;">Ngày Đặt</td>
                    <td>
                      <?php
                        $timestamp = strtotime($order->purchase_date);
                        echo $ngaydat = date('d/m/Y H:m:s',$timestamp);
                      ?>
                    </td>
                  </tr>
                  @if(!empty($order->detail))
                  <tr>
                    <td style="width:100px;">Ghi Chú</td>
                    <td>{!! $order->detail !!}</td>
                  </tr>
                  @endif
                </table>
              </div>
            </div>
          </div>
        </div>
    </div>
    <!-- /.row -->
</div>
<!-- /.container-fluid -->



@stop
