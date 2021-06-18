<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    protected $table = "orders";
    protected $fillable = ['purchase_date','total_price','detail','status','user_id'];

    public function order_details(){
      return $this->hasMany('App\Order_detail');
    }

}
