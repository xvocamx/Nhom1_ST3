<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\CategoryRequest;
use App\Category;

class CategoryController extends Controller
{
    public function getList(){
      $categories = Category::all();
      return view('admin.Categories.list')->with('categories',$categories);
    }
    public function getAdd(){
      return view("admin.Categories.add");
    }
    public function postAdd(CategoryRequest $request){
      $category = new Category();
      $category->name = $request->txtCateName;
      $category->save();
      return redirect()->route('cate.getlist')->with('thongbao','Thêm Thành Công');
    }

    public function getEdit($id){
      $category = Category::find($id);
      return view('admin.Categories.edit',['category'=>$category]);
    }
    public function postEdit($id,CategoryRequest $request){
      $category = Category::find($id);
      $category->name = $request->txtCateName;
      $category->save();
      return redirect()->route('cate.getlist')->with('thongbao','Sửa Thành Công');
    }
    public function getDelete($id){
      $category = Category::find($id);
      $category->delete();
      return redirect()->route('cate.getlist')->with('thongbao','Xóa Thành Công');
    }
}
