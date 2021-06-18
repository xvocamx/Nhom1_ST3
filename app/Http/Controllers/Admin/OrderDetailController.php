<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Order;
use App\Order_detail;
use App\Http\Requests\OrderdetailRequest;

class OrderDetailController extends Controller
{
    public function getList($order_id){
      $order = Order::find($order_id);
      $order_details = Order_detail::where('order_id',$order_id)->get();
      return view('admin.OrderDetail.list',['order'=>$order,'order_details'=>$order_details]);
    }

    public function postEdit($id,OrderdetailRequest $request){
      $orderdetail = Order_detail::find($id);
      $orderdetail->quantity = $request->quantityedit;
      $orderdetail->price = $request->priceedit;
      $orderdetail->save();
      return redirect()->route('orderdetail.getlist',$orderdetail->order_id)->with('thongbao','Sửa Thành Công');
    }
    public function getDelete($id){
      $orderdetail = Order_detail::find($id);
      $orderdetail->delete();
      return redirect()->route('orderdetail.getlist',$orderdetail->order_id)->with('thongbao','Xóa Thành Công');
    }
}
