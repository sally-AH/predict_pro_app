<?php

namespace App\Http\Controllers;
use App\Models\Invoice;

use Illuminate\Http\Request;

class InvoiceController extends Controller
{
    public function getAllInvoices() {
        $invoices = Invoice::all();
        return response()->json(['invoices' => $invoices]);
    }

    public function getInvoicesWithProductDetails() {
        $invoices = Invoice::with([
            'branch:id,desc',
            'carts' => function ($query) {
                $query->with([
                    'product:id,desc',
                ])->select('invoice_id', 'quantity', 'net', 'total', 'product_id');
            }
        ])->select('id', 'date', 'total')->get();
    
        return response()->json(['invoices' => $invoices]);
    }
}
