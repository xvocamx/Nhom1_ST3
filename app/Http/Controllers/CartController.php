<?php

namespace App\Http\Controllers;

use Cart;
use App\Product;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function store(Request $request)
    {
        $product = Product::findOrFail($request->product_id);
        $quantity = $request->quantity;
        Cart::add(['id'=>$product->id,'name'=> $product->name,'qty'=> (int)$quantity,'price'=> $product->price,'options' =>['image' => $product->images,'price_sale'=>$product->price_sale]]);

        return redirect()->route('getCart');
    }

    public function index()
    {
        $content = Cart::content();
        return view('pages.cart',['content'=>$content]);
    }
    public function remove($rowId){
      Cart::remove($rowId);
      return redirect()->route('getCart');
    }
    public function Update(Request $request){
      $this->validate($request,[
          'quantity'=> 'required',
      ],[
        'quantity.required'=>'Bạn phải nhập số lượng vào mới update chứ',
      ]);
      $quantity = $request->quantity;
      $rowId = $request->rowid;
      Cart::update($rowId, $quantity);
      return redirect()->route('getCart');
    }
}
