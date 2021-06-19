@extends('admin.layouts.master')
@section('title','Danh sach san pham')
@section('content')
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Order
                <small>List</small>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
        @include('admin.errors.message')
        <table class="table table-striped table-bordered table-hover" id="dataTables-example">
            <thead>
                <tr align="center">
                    <th>Order</th>
                    <th>User Name</th>
                    <th>Email</th>
                    <th>Date</th>
                    <th>Total Price</th>
                    <th>Status</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>

                @foreach($orders as $order)
                <tr class="odd gradeX" align="center">
                    <td>DH{{$order->id}}</td>
                    <td><a href="{{route('orderdetail.getlist',$order->id)}}">{{$order->name}}</a></td>
                    <td>{{$order->email}}</td>
                    <td>
                        <?php
                          $timestamp = strtotime($order->purchase_date);
                          echo $purchase_date = date('d/m/Y H:m:s',$timestamp);
                        ?>
                    </td>
                    <td>{{ number_format($order->total_price) }} VNĐ</td>

                    @if($order->status == 0)
                    <td style="color:red;font-weight:bold;">Đơn Hàng Mới</td>
                    @elseif($order->status == 1)
                    <td style="color:blue;font-weight:bold;">Xác Nhận</td>
                    @elseif($order->status==2)
                    <td style="color:green;font-weight:bold;">Đã Chuyển Hàng</td>
                    @endif

                    <td class="center">
                        <i class="fa fa-pencil fa-fw"></i>
                        <a href="javascript:void(0)" data-toggle="modal" data-target="#exampleModal{{$order->id}}"
                            data-whatever="@mdo">Edit</a>
                        <!--Edit Order-->
                        <div class="modal fade" id="exampleModal{{$order->id}}" tabindex="-1" role="dialog"
                            aria-labelledby="exampleModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title" id="exampleModalLabel">Edit Order</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form action="{{route('order.postedit',$order->id)}}" method="POST">
                                            <input type="hidden" name="_token" value="{{csrf_token()}}">
                                            <div class="form-group">
                                                <label for="recipient-name" class="control-label">Status:</label>

                                                <select class="form-control" id="recipient-name" name="status">
                                                    <option value="1" @if($order->status == 1) {{'selected'}} @endif
                                                        >Xác Nhận</option>
                                                    <option value="2" @if($order->status == 2) {{'selected'}} @endif >Đã
                                                        Chuyển Hàng</option>
                                                </select>

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
                    </td>

                    <td class="center">
                        <i class="fa fa-trash-o  fa-fw"></i>
                        <a onclick="return xacnhanxoa('Bạn có chắc là muốn xóa hay không ?')"
                            href="{{route('order.getdelete',$order->id)}}">Delete</a>
                    </td>

                </tr>
                @endforeach

            </tbody>
        </table>
    </div>
    <!-- /.row -->
</div>
<!-- /.container-fluid -->
@stop