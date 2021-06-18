<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
  protected $table = "products";
  protected $fillable = ['name','detail','purchases','hightlights','quantity','price','price_sale','color','images','trademark_id','user_id '];

  public function product_images(){
    return $this->hasMany('App\Product_image');
  }

  public function order_details(){
    return $this->hasMany('App\Order_detail');
  }

  public function trademark(){
    return $this->belongsTo('App\Trademark');
  }

  public function user(){
    return $this->belongsTo('App\User');
  }

}
