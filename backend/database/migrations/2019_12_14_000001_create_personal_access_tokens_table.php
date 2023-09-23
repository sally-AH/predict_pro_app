<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->integer("usertype_id");
            $table->integer("branch_id");
            $table->string('username')->unique();
            $table->string('email')->unique();
            $table->string('password');
            $table->string('phone');
            $table->text('pic_url');
            $table->timestamps();
        });

        Schema::create('user_types', function (Blueprint $table) {
            $table->id();
            $table->string('desc');
            $table->timestamps();
        });

        Schema::create('stock', function (Blueprint $table) {
            $table->id();
            $table->integer("branch_id");
            $table->integer("product_id");
            $table->double("total_quantity");
            $table->double("unit_price");
            $table->double("remaining_quantity");
            $table->dateTime('in_date');
            $table->timestamps();
        });

        Schema::create('branch', function (Blueprint $table) {
            $table->id();
            $table->integer("region_id");
            $table->string("desc");
            $table->string('phone');
            $table->string('address');
            $table->timestamps();
        });

        Schema::create('brand', function (Blueprint $table) {
            $table->id();
            $table->string('desc');
            $table->timestamps();
        });

        
        Schema::create('cart', function (Blueprint $table) {
            $table->integer("invoice_id");
            $table->integer("product_id");
            $table->double("quantity");
            $table->double("net");
            $table->double("vat");
            $table->double("total");
            $table->timestamps();
        });

        Schema::create('category', function (Blueprint $table) {
            $table->id();
            $table->string('desc');
            $table->timestamps();
        });

        Schema::create('event', function (Blueprint $table) {
            $table->id();
            $table->string('desc');
            $table->dateTime('from');
            $table->dateTime('to');
            $table->double("discount");
            $table->timestamps();
        });

        Schema::create('unit_type', function (Blueprint $table) {
            $table->id();
            $table->string('desc');
            $table->timestamps();
        });

        Schema::create('invoice', function (Blueprint $table) {
            $table->id();
            $table->integer('branch_id');
            $table->dateTime('date');
            $table->double('total');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
        Schema::dropIfExists('user_types');
        Schema::dropIfExists('stock');
        Schema::dropIfExists('branch');
        Schema::dropIfExists('brand');
        Schema::dropIfExists('cart');
        Schema::dropIfExists('category');
        Schema::dropIfExists('event');
        Schema::dropIfExists('unit_type');
        Schema::dropIfExists('invoice');
    }
};
