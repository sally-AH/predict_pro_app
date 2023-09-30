<?php

namespace App\Http\Controllers;
use App\Models\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function getAllCartsWithDetails() {
        $carts = Cart::with(['invoice.branch', 'product.brand'])->get();
        return response()->json(['carts' => $carts]);
    }
}
