<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\OpenAiController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\UserController;



Route::get("prompt",[OpenAiController::class, 'prompt']);
Route::get('getusers', [UserController::class, "getAllUsers"]);
Route::get('getCategoryProducts', [ProductController::class, "getProductsByCategoryAndBranch"]);
Route::get('getcategories', [CategoryController::class, "getAllCategories"]);

Route::group(["prefix" => "guest"], function(){
    Route::get("unauthorized", [AuthController::class, "unauthorized"])->name("unauthorized");
    Route::post("login", [AuthController::class, "login"]);
    Route::post("register", [AuthController::class, "register"]);
});

Route::group(["middleware" => "auth:api"], function(){
    Route::group(["prefix" => "user"], function(){
        Route::post("logout", [AuthController::class, "logout"]);
        Route::post("refresh", [AuthController::class, "refresh"]);
        Route::get('getusers', [UserController::class, "getUsersByBranch"]);
        Route::get('getproducts', [ProductController::class, "getProductsInStockByBranch"]);

    });
});