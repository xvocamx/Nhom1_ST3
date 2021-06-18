<?php

use Illuminate\Database\Seeder;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      DB::table('orders')->insert([
           'purchase_date' => '2017/2/4',
           'total_price' => 122,
           'detail' => 'fdfdfdfdf',
           'status' => 1,
           'user_id' => 1
       ]);
    }
}
