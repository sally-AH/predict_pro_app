<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cart extends Model
{
    use HasFactory;
    public function invoice() {
        return $this->belongsTo(Invoice::class, 'invoice_id');
    }

    public function product() {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
