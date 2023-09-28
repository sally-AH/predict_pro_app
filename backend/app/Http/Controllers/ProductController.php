<?php

namespace App\Http\Controllers;
use App\Models\Branch;
use App\Models\Product;
use App\Models\Stock;
use App\Models\Category;
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



    public function getProductsByCategoryAndBranch(Request $request) {
        $branch_id =$request-> branch_id;
        $branch = Branch::find($branch_id);

        if (!$branch) {
            return response()->json(['error' => 'Branch not found'], 404);
        }

        $category_id =$request-> category_id;
        $category = Category::find($category_id);

        if (!$category) {
            return response()->json(['error' => 'Category not found'], 404);
        }

        $products = Product::where('category_id', $category_id)
        ->whereHas('stocks', function ($query) use ($branch_id) {
            $query->where('branch_id', $branch_id);
        })
        ->with(['stocks' => function ($query) {
            $query->select('product_id', 'unit_price'); // Select the unit_price from stocks
        }])
        ->get();

    return response()->json(['products' => $products]);
    }


}