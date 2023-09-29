<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class FCMService
{ 
    public static function send($token, $notification)
    {
        $fcm_token ='f_xuUhMYR_SPDGQTK44d6A:APA91bEswlyF6wpY6R5V7YArSbGH0nd2h7Lc-itQJIyEBhUa0uoxlZES9hSCoDR_7zsxo3AnbexSgPiMdBjInDtjdx4qAfVW0zZunbcJ8hqSOaNmiynJyEi5VhKZnqgt8fmlSkDg4a6Y';

        Http::acceptJson()->withToken(config($fcm_token))->post(
            'https://fcm.googleapis.com/fcm/send',
            [
                'to' => $token,
                'notification' => $notification,
            ]
        );
    }
}