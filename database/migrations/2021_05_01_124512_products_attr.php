<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ProductsAttr extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products_attr', function (Blueprint $table) {
        $table->id();
        $table->integer('products_id');
        $table->string('sku');
        $table->string('attr_image');
        $table->integer('mrp');
        $table->integer('price');
        $table->integer('qty');
        $table->integer('size_id');
        $table->integer('color_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
