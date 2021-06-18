<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Cart;
use App\Order;
use App\Order_detail;
use DateTime,Auth;

class OrderController extends Controller
{
    public function getOrder(){
      $content = Cart::content();
      return view('pages.order',['content'=>$content]);
    }
    public function postOrder(Request $request){
      $this->validate($request,[
        'phone'=>'numeric|digits_between:10,11',
      ],[
        'phone.numeric'=>'Số điện thoại phải là kiểu số, vui lòng nhập lại cho đúng',
        'phone.digits_between'=> 'Vui lòng nhập số điện thoại có 10 hoặc 11 chữ số',
      ]);
      $order = new Order();
      $order->purchase_date = new DateTime();
      $order->total_price = $request->total;
      $order->detail = $request->detail;
      $order->status = 0;
      if(Auth::check()){
        $order->user_id = Auth::user()->id;
      }else {
        $order->user_id = 0;
      }
      $order->name = $request->txtname;
      $order->email = $request->txtemail;
      $order->phone = $request->txtphone;
      $order->address = $request->txtaddress;
      $order->save();
      $order_id = $order->id;
      $content = Cart::content();
      foreach($content as $item){
        $order_detail = new Order_detail();
        $order_detail->quantity = $item->qty;
        if($item->options->price_sale == 0){
          $order_detail->price = $item->price;
        }else {
          $order_detail->price = $item->options->price_sale;
        }
        $order_detail->order_id = $order_id;
        $order_detail->product_id = $item->id;
        $order_detail->save();
      }
      return redirect('order/success');
    }
    public function getSuccess(){
      Cart::destroy();
      return view('pages.ordersuccess');
    }
}
