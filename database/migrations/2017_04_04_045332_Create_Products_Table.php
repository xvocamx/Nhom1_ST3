<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('products', function (Blueprint $table) {
          $table->increments('id');
          $table->string('name')->unique();
          $table->text('detail');
          $table->integer('purchases');
          $table->integer('hightlights');
          $table->integer('quantity');
          $table->decimal('price', 10, 2);
          $table->decimal('price_sale',10,2);
          $table->string('color');
          $table->string('images');
          $table->integer('trademark_id')->unsigned();
          $table->foreign('trademark_id')->references('id')->on('trademarks')->onDelete('cascade');
          $table->integer('user_id')->unsigned();
          $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
          $table->timestamps();
      });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
