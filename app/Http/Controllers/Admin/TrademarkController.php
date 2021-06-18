<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\TrademarkRequest;
use App\Trademark;
use App\Category;

class TrademarkController extends Controller
{
    public function getList(){
      $trademarks = Trademark::all();
      return view('admin.Trademark.list',['trademarks'=>$trademarks]);
    }
    public function getAdd(){
      $categories = Category::all();
      return view('admin.Trademark.add',['categories'=>$categories]);
    }
    public function postAdd(TrademarkRequest $request){
      $trademark = new Trademark();
      $trademark->name = $request->txtTrademarkName;
      $trademark->category_id = $request->category;
      $trademark->save();
      return redirect()->route('trademark.getlist')->with('thongbao','Thêm Thành Công');
    }
    public function getEdit($id){
      $categories = Category::all();
      $trademark = Trademark::find($id);
      return view('admin.Trademark.edit',['categories'=>$categories,'trademark'=>$trademark]);
    }

    public function postEdit($id,TrademarkRequest $request){
      $trademark = Trademark::find($id);
      $trademark->name = $request->txtTrademarkName;
      $trademark->category_id = $request->category;
      $trademark->save();
      return redirect()->route('trademark.getlist')->with('thongbao','Sửa Thành Công');
    }
    public function getDelete($id){
      $trademark = Trademark::find($id);
      $trademark->delete();
      return redirect()->route('trademark.getlist')->with('thongbao','Xóa Thành Công');
    }
}
