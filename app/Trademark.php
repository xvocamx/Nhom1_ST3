<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Trademark extends Model
{
    protected $table = "trademarks";
    protected $fillable = ['name','category_id'];

    public function products(){
      return $this->hasMany('App\Product');
    }

    public function category(){
      return $this->belongsTo('App\Category');
    }
}
