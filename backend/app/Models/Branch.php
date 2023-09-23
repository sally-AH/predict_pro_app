<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Branch extends Model
{
    use HasFactory;

    public function users() {
        return $this->hasMany(User::class, 'branch_id');
    }

    public function stocks() {
        return $this->hasMany(Stock::class, 'branch_id');
    }

    public function region() {
        return $this->belongsTo(Region::class, 'region_id');
    }

    



}
