<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    public function getAllCategories() {
        $categories = Category::all();
        return response()->json($categories);
    }
}
