<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use App\Http\Controllers\Controller;
use App\Category;
use App\Trademark;
use App\Product;
use App\Product_image;
use App\Http\Requests\ProductRequest;
use File,Input,Auth;

class ProductController extends Controller
{
    public function __construct(){
      $categories = Category::all();
      $trademarks = Trademark::all();
      view()->share(['categories'=>$categories,'trademarks'=>$trademarks]);
    }
    public function getList(){
      $products = Product::all();
      return view('admin.Products.list',['products'=>$products]);
    }

    public function getAdd(){
      return view('admin.products.add');
    }
    public function postAdd(ProductRequest $request){

        $fileimg = $request->file('fImages')->getClientOriginalName();

        $product = new Product();
        $product->name = $request->txtName;
        $product->detail = $request->detail;
        $product->purchases = 0;
        $product->hightlights = $request->rdoStatus;
        $product->quantity = $request->txtQuantity;
        $product->price = $request->txtPrice;
        $product->price_sale = $request->txtPriceSale;
        $product->color = $request->txtColor;
        $product->images = $fileimg;
        $product->trademark_id = $request->trademark;
        $product->user_id = Auth::user()->id;

        $request->file('fImages')->move('Admin_style/images/',$fileimg);

        $product->save();

        $product_id = $product->id;
        if($request->hasFile('fProductDetail'))
        {
          foreach($request->fProductDetail as $file) {
      			if(isset($file) && !empty($file)) {
      				$productimage = new Product_image();
      				$productimage->product_id = $product_id;
      				$productimage->image = $file->getClientOriginalName();
              $file->move('Admin_style/images/details/',$file->getClientOriginalName());
      				$productimage->save();
      			}
          }
      }
        return redirect()->route('product.getlist')->with('thongbao','Thêm Thành Công');
    }

    public function getDelete($id){
      $product_images = Product::find($id)->product_images->toArray();
      foreach ($product_images as $product_image) {
        File::delete('Admin_style/images/details/'.$product_image["image"]);
      }
      $product = Product::find($id);
      File::delete('Admin_style/images/'.$product->images);
      $product->delete();
      return redirect()->route('product.getlist')->with('thongbao','Xóa Thành Công');
    }

    public function getEdit($id){
      $product = Product::find($id);
      $product_images = Product::find($id)->product_images->toArray();
      return view('admin.Products.edit',['product'=>$product,'product_images'=>$product_images]);
    }
    public function postEdit($id,ProductRequest $request){
      $product = Product::find($id);
      $product->name = $request->txtName;
      $product->detail = $request->detail;
      $product->purchases = 0;
      $product->hightlights = $request->rdoStatus;
      $product->quantity = $request->txtQuantity;
      $product->price = $request->txtPrice;
      $product->price_sale = $request->txtPriceSale;
      $product->color = $request->txtColor;
      $product->trademark_id = $request->trademark;
      $product->user_id = Auth::user()->id;

      if($request->hasFile('fImageedit')){
        $image_current =  'Admin_style/images/'.$request->img_current;
        if(file_exists($image_current)){
          File::delete($image_current);
        }
        $imgeditname = $request->file('fImageedit')->getClientOriginalName();
        $product->images = $imgeditname;
        $request->file('fImageedit')->move('Admin_style/images/',$imgeditname);
      }
      $product->save();

      $product_id = $product->id;

      if($request->hasFile('fEditimages')){
        $product_images = Product_image::where('product_id',$id)->get();
        foreach($product_images as $product_image){
          $images_current = 'Admin_style/images/details/'.$product_image->image;
          if(file_exists($images_current)){
            File::delete($images_current);
          }
          $product_image->delete();
        }
        foreach($request->file('fEditimages') as $file){
          if(isset($file)){
            $img_name = $file->getClientOriginalName();
            $product_image = new Product_image();
            $product_image->product_id = $product_id;
            $product_image->image = $img_name;
            $file->move('Admin_style/images/details',$img_name);
            $product_image->save();
          }
        }

      }
      return redirect()->route('product.getlist');
    }
}
