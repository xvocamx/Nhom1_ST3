<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Category;
use App\Trademark;
use App\User;
use App\Comment;
use App\Http\Requests\UserRequest;
use App\Http\Requests\LoginRequest;
use Hash,Auth;

class PageController extends Controller
{

  public function getIndex(){
    $products = Product::all();
    $category = Category::all();
    $new_products = Product::orderBy('id','DESC')->take(8)->get();
    $sale_products = Product::where('price_sale','<>',0)->orderBy('id','DESC')->take(8)->get();
    $hightlight_products = Product::where('hightlights',1)->orderBy('id','DESC')->take(8)->get();
    return view('pages.index',['new_products'=>$new_products,'sale_products'=>$sale_products,'hightlight_products'=>$hightlight_products,'products'=>$products,'category'=>$category]);
  }

    public function getTrademark($id){
      $trademark = Trademark::find($id);
      $pd_trademark = Product::where('trademark_id',$id)->orderBy('id','DESC')->paginate(8);
      return view('pages.trademark',['trademark'=>$trademark,'pd_trademark'=>$pd_trademark]);
    }

    public function getCategories($id){
      $category = Category::find($id);
      $product = Product::all();
      return view('pages.categories',['product'=>$product,'category'=>$category]);
    }

    public function getDetail($id){
      $comment = Comment::all();
      $user = User::all();
      $product = Product::find($id);
      $product_images = Product::find($id)->product_images->take(3)->toArray();
      $different_products = Product::where('trademark_id',$product->trademark->id)->where('id','<>',$id)->orderBy('id','DESC')->take(10)->get();
      return view('pages.detail',['product'=>$product,'product_images'=>$product_images,'different_products'=>$different_products,'comment'=>$comment,'user'=>$user]);
    }

    public function getRegister(){
      return view('pages.register');
    }
    public function postRegister(UserRequest $request){
      $register = new User();
      $register->email = $request->txtEmail;
      $register->password = Hash::make($request->txtPass);
      $register->remember_token = $request->_token;
      $register->name = $request->txtUser;
      $register->phone = $request->txtPhone;
      $register->address = $request->txtAddress;
      $register->gender = $request->gender;
      $register->level = 0;
      $register->save();
      return redirect()->back()->with(['color'=>'success','thongbao'=>'Đăng Ký Thành Công']);
    }
    public function getLogin(){
      if(!Auth::check()){
        return view('pages.login');
      }else {
        return redirect()->route('index');
      }
    }
    public function postLogin(LoginRequest $request){
      if (Auth::attempt(['email' => $request->email, 'password' => $request->password,'level'=>0])) {
            // Authentication passed...
        return redirect()->route('index');
      }else{
        return redirect()->back()->with(['color'=>'danger','thongbao'=>'Sai tài khoản hoặc mật khẩu']);
      }
    }
    public function getLogout(){
      Auth::logout();
      return redirect()->route('index');
    }
    public function Search(Request $request){
      $key = $request->key;
      $pd_trademark = Product::where('name','like',"%$key%")->paginate(8);
      return view('pages.search',['pd_trademark'=>$pd_trademark,'key'=>$key]);
    }

    public function postComment($id,Request $request){
        $idProduct = $id;
        $product = Product::find($id);
        $comment = new Comment;
        $comment->idProduct = $idProduct;
        $comment->idUser = Auth::user()->id;
        $comment->comment = $request->comment;
        $comment->save();
        return redirect("detail/".$id);
    }

}
