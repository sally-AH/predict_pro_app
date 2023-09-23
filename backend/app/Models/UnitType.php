<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UnitType extends Model
{
    use HasFactory;

    public function products() {
        return $this->hasMany(Product::class, 'unit_type_id');
    }

}
