<?php

namespace App\Http\Controllers;
use App\Models\Branch;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller {

    public function getUsersByBranch(Request $request) {
        $branch = Branch::find($request-> branch_id);
        if (!$branch) {
            return response()->json(['error' => 'Branch not found'], 404);
        }
        $users = $branch->users;
        return response()->json(['users' => $users]);
    }

    public function getAllUsers() {
        $users = User::all();
        return response()->json(['users' => $users]);
    }
}
