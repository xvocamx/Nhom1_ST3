<?php

namespace App\Http\Controllers\Admin;

//use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Trademark;
use App\Product_image;
use Request,File;

class AjaxController extends Controller
{
    public function getAjaxCate($cate_id){

      if(Request::ajax()){
        $category_id = Request::get('cate_id');
        $trademarks = Trademark::where('category_id',$category_id)->get();

        foreach ($trademarks as $trademark) {
          echo "<option value='".$trademark->id."'>".$trademark->name."</option>";
        }
      }

    }

}
