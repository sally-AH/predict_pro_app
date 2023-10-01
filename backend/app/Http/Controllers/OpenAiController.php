<?php

namespace App\Http\Controllers;
use App\Http\Controllers\CartController;
use OpenAI\Laravel\Facades\OpenAI;
use Illuminate\Http\Request;

class OpenAiController extends Controller {


    function prompt () {
        $jsonObject = [
            "product"=> [
              "times of buying" => [
                "Kimberly Snacks" => 3,
                "Clorox Snacks" => 3,
                "Kellogg's Snacks" => 3,
                "Hormel Household" => 3,
                "Hershey's Household" => 3,
                "Quaker Oats Household" => 3,
                "McCormick Household" => 3,
                "Bumble Bee Household" => 3,
                "Coca-Cola Soup" => 3,
                "Kellogg's Soup" => 3,
                "Unilever Cereal" => 2,
                "Kraft Heinz Cereal" => 2,
                "Campbell Soup Cereal" => 2,
                "Colgate Snacks" => 2,
                "Mars Snacks" => 2,
                "Nestlé Bev." => 2,
                "P&G Bev." => 2,
                "PepsiCo Bev." => 2,
                "Gen. Mills Cereal" => 2,
                "J&J Cereal" => 2,
                "Freez" => 2,
                "Nutella" => 2,
                "Kiri cheese" => 2,
                "Coca-Cola Bev." => 2,
                "Kellogg's Bev." => 2
                ],
              "total revenues" => [
                "Kimberly Snacks" => 191.46,
                "Clorox Snacks" => 168.18,
                "Kellogg's Snacks" => 140.73,
                "Hormel Household" => 134.07,
                "Hershey's Household" => 134.7,
                "Quaker Oats Household" => 145.89,
                "McCormick Household" => 149.61,
                "Bumble Bee Household" => 142.74,
                "Coca-Cola Soup" => 135.36,
                "Kellogg's Soup" => 144.75,
                "Unilever Cereal" => 134.1,
                "Kraft Heinz Cereal" => 133.76,
                "Campbell Soup Cereal" => 144.75,
                "Colgate Snacks" => 140.73,
                "Mars Snacks" => 140.73,
                "Nestlé Bev." => 142.74,
                "P&G Bev." => 140.73,
                "PepsiCo Bev." => 135.36,
                "Gen. Mills Cereal" => 134.1,
                "J&J Cereal" => 140.7,
                "Freez" => 135.36,
                "Nutella" => 140.73,
                "Kiri cheese" => 134.11,
                "Coca-Cola Bev." => 134.1,
                "Kellogg's Bev." => 140.73
                ]
            ],
            "weekly revenues in each month" => [
              "May 2023" => [
                "Week 1" => 580.6,
                "Week 2" => 596.6,
                "Week 3" => 509.6,
                "Week 4" => 482.7,
                "Week 5" => 355.6
              ],
              "June 2023" => [
                "Week 1" => 580.6,
                "Week 2" => 596.6,
                "Week 3" => 509.6,
                "Week 4" => 482.7,
                "Week 5" => 355.6
              ],
              "July 2023" => [
                "Week 1" => 580.6,
                "Week 2" => 596.6,
                "Week 3" => 509.6,
                "Week 4" => 482.7,
                "Week 5" => 355.6
              ],
              "August 2023" => [
                "Week 1" => 580.6,
                "Week 2" => 596.6,
                "Week 3" => 509.6,
                "Week 4" => 482.7,
                "Week 5" => 355.6
              ],
              "September 2023" => [
                "Week 1" => 580.6,
                "Week 2" => 596.6,
                "Week 3" => 509.6,
                "Week 4" => 482.7,
                "Week 5" => 355.6
              ]
            ],
            "monthly revenues" => [
              "May 2023" => 2614.2,
              "June 2023" => 2614.2,
              "July 2023" => 2614.2,
              "August 2023" => 2614.2,
              "September 2023" => 1357.5
            ],
            "total revenues from all products" => 3706.1,
            "top 5 products" => [
              [
                "product" => "Kimberly Snacks",
                "revenue" => 191.46
              ],
              [
                "product" => "Clorox Snacks",
                "revenue" => 168.18
              ],
              [
                "product" => "Kellogg's Snacks",
                "revenue" => 140.73
              ],
              [
                "product" => "Hershey's Household",
                "revenue" => 134.7
              ],
              [
                "product" => "McCormick Household",
                "revenue" => 149.61
              ]
            ]
        ];
        
        // $jsonString = json_encode($jsonObject);
        return response()->json($jsonObject);

        $CartCont = new CartController();
        $data = $CartCont->getAllCartsWithDetails();
        $jsonData = json_encode(['cart_data' => $data]);
        
        $prompt = 'Here is the cart data in JSON format: ' . $jsonData;
        $prompt .= "\n\nnow you have these 21 invoices, I want a json Object the contains the following:";
        $prompt .= "\nReturn the answer as JSON parsable object (do not return any text or explanation or notes before or after the JSON object).";
        $prompt .= '\n{"product":{
            times of buying: ,
            total revenues: ,
            }
            "weekly revenues in each month" ,
            "total revenues from all products":  ,
            "monthly revenues" ,
            "top 5 products" ,
            }';

        $result = OpenAI::completions()->create([
            'max_tokens' => 2048,
            'model' => 'text-davinci-003',
            // 'prompt' => 'PHP is',
            'prompt' => $prompt,
        ]);

        // echo $result;

    }
}