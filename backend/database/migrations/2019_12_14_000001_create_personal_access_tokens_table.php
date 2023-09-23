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

        Schema::create('stocks', function (Blueprint $table) {
            $table->id();
            $table->integer("branch_id");
            $table->integer("product_id");
            $table->double("total_quantity");
            $table->double("unit_price");
            $table->double("remaining_quantity");
            $table->dateTime('in_date');
            $table->timestamps();
        });

        Schema::create('branches', function (Blueprint $table) {
            $table->id();
            $table->integer("region_id");
            $table->string("desc");
            $table->string('phone');
            $table->string('address');
            $table->timestamps();
        });

        Schema::create('brands', function (Blueprint $table) {
            $table->id();
            $table->string('desc');
            $table->timestamps();
        });

        
        Schema::create('carts', function (Blueprint $table) {
            $table->integer("invoice_id");
            $table->integer("product_id");
            $table->double("quantity");
            $table->double("net");
            $table->double("vat");
            $table->double("total");
            $table->timestamps();
        });

        Schema::create('categories', function (Blueprint $table) {
            $table->id();
            $table->string('desc');
            $table->timestamps();
        });

        Schema::create('events', function (Blueprint $table) {
            $table->id();
            $table->string('desc');
            $table->dateTime('from');
            $table->dateTime('to');
            $table->double("discount");
            $table->timestamps();
        });

        Schema::create('unit_types', function (Blueprint $table) {
            $table->id();
            $table->string('desc');
            $table->timestamps();
        });

        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->integer('branch_id');
            $table->dateTime('date');
            $table->double('total');
            $table->timestamps();
        });
        Schema::create('messages', function (Blueprint $table) {
            $table->id();
            $table->integer('sender_id');
            $table->integer('reciver_id');
            $table->string('content');
            $table->dateTime('date');
            $table->timestamps();
        });

        Schema::create('notifications', function (Blueprint $table) {
            $table->id();
            $table->string('content');
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
        Schema::dropIfExists('stocks');
        Schema::dropIfExists('branches');
        Schema::dropIfExists('brands');
        Schema::dropIfExists('carts');
        Schema::dropIfExists('categories');
        Schema::dropIfExists('events');
        Schema::dropIfExists('unit_types');
        Schema::dropIfExists('invoices');
        Schema::dropIfExists('messages');
        Schema::dropIfExists('notifications');
    }
};
