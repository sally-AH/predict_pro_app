<?php

namespace App\Http\Controllers;
use App\Models\Branch;
use App\Models\Product;
use App\Models\Stock;

use Illuminate\Http\Request;

class ProductController extends Controller {

    
    public function getProductsInStockByBranch(Request $request) {
        $branch_id =$request-> branch_id;
        $branch = Branch::find($branch_id);

        if (!$branch) {
            return response()->json(['error' => 'Branch not found'], 404);
        }
        $stocksInBranch = $branch->stocks()->with('product')->get();

        $branchName = $branch->desc; 

        $stocksInBranchData = [];

        foreach ($stocksInBranch as $stock) {
            $product = $stock->product;
            if ($product) {
                $stocksInBranchData[] = [
                    'id' => $stock->id,
                    'branch_name' => $branchName,
                    'product_name' => $product->desc,
                ];
            }
        }

        return response()->json(['stocksInBranchData' => $stocksInBranchData]);
    }

}

