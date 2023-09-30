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
}
