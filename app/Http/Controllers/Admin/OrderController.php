<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Order;
use App\Comment;
use App\User;
use App\Product;

class OrderController extends Controller
{
    public function getList(){
      $orders = Order::all();
      return view('admin.Orders.list',['orders'=>$orders]);
    }
    public function postEdit($id,Request $request){
      $order = Order::find($id);
      $order->status = $request->status;
      $order->save();
      return redirect()->route('order.getlist')->with('thongbao','Sửa Thành Công');
    }

    public function getDelete($id){
      $order = Order::find($id);
      $order->delete();
      return redirect()->route('order.getlist')->with('thongbao','Xóa Thành Công');
    }

    public function getCommentList(){
      $comment = Comment::all();
      $user = User::all();
      $product = Product::all();
      return view('admin.Comment.list',['comment'=>$comment,'user'=>$user,'product'=>$product]);
    }
    public function getCommentDelete($id){
      $comment = Comment::where('comment_id',$id);
      $comment->delete();
      return redirect()->route('comment.getlist')->with('thongbao','Xóa Thành Công');
    }

}
