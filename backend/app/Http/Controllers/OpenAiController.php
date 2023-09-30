<?php

namespace App\Http\Controllers;
use App\Http\Controllers\CartController;
use OpenAI\Laravel\Facades\OpenAI;
use Illuminate\Http\Request;

class OpenAiController extends Controller {


    function prompt () {
        $CartCont = new CartController();
        $data = $CartCont->getAllCartsWithDetails();
        $jsonData = json_encode(['cart_data' => $data]);
        
        $prompt = 'Here is the cart data in JSON format: ' . $jsonData;
        $prompt .= "\n\nNow, generate a response based on this data. Analyse the Cart and The Invoices and the Products";
        $prompt .= "\nReturn the answer as JSON parsable object (do not return any text or explanation or notes before or after the JSON object).";

        $result = OpenAI::completions()->create([
            'max_tokens' => 1024,
            'model' => 'text-davinci-003',
            // 'prompt' => 'PHP is',
            'prompt' => $prompt,
        ]);

        echo $result;

    }
}


