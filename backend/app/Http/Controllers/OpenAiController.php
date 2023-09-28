<?php

namespace App\Http\Controllers;
use OpenAI\Laravel\Facades\OpenAI;
use Illuminate\Http\Request;

class OpenAiController extends Controller
{
    function prompt () {
        $prompt = 'I have a biology and a chemistry and a maths exam';
        $prompt .= ".\nI sleep at 11:00 PM and wake at 5:00 AM.";
        $prompt .= "\nI have breakfast at 6:00 AM.";
        $prompt .= "\nI have lunch at 12:00 PM";
        $prompt .= "\nI have dinner at 8:00 PM";
        $prompt .= "\nI want to study 3 hours of biology material only. I want to study 4 hours of chemistry material only.";
        $prompt .= "\nDo not add additional hours of study.";
        $prompt .= "\n\nPlan the days 24/August/2023, 25/August/2023 in details where you state in every hour what to do. Include fun activities such as TV, Jogging, etc.";
        $prompt .= "\nReturn the answer as JSON parsable object (do not return any text or explanation or notes before or after the JSON object).";
        $prompt .= "\nThe JSON object should be in this format { \"result\": [ {\"hour\": \"\", \"task\":\"\", \"day\":\"\"},{\"hour\": \"\", \"task\":\"\", \"day\":\"\"}.......]}.";
        $prompt .= "\nIf the task is about study always start it with study and then state the subject (ex: study biology).";

        $result = OpenAI::completions()->create([
            'max_tokens' => 1024,
            'model' => 'text-davinci-003',
            // 'prompt' => 'PHP is',
            'prompt' => $prompt,
        ]);

        echo $result['choices'][0]['text'];

    }
}
