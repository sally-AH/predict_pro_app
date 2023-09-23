<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    public function stocks() {
        return $this->hasMany(Stock::class, 'product_id');
    }

    public function category() {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function brand() {
        return $this->belongsTo(Brand::class, 'brand_id');
    }

    public function unitType() {
        return $this->belongsTo(UnitType::class, 'unit_type_id');
    }

    public function events() {
        return $this->belongsToMany(Event::class);
    }





}
