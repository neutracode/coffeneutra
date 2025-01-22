<?php

namespace App\Http\Controllers\users;

use App\Http\Controllers\Controller;
use App\Models\user\OTPModel;
use Illuminate\Http\Request;

class UsersController extends Controller
{
    public function sendOtp(
        $number
    ) {
        $message = '';
        $target = $number;
        $otp = $this->generateRandomString();
        $message = 'Hello!, your OTP is '. $otp . ' use this code before 30 minutes';

        $this->inputOTPtoDatabase($otp);

        $curl = curl_init();

        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://api.fonnte.com/send',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => array(
                'target' => $target,
                'message' => $message,
                'countryCode' => '62', //optional
            ),
            CURLOPT_HTTPHEADER => array(
                'Authorization: 1vAs3cyuwkdUAVQveLdv' //change TOKEN to your actual token
            ),
        ));

        $response = curl_exec($curl);

        curl_close($curl);
        //echo $response;
    }

    public function inputOTPtoDatabase($otp_code)
    {
        $otp = new OTPModel();
        $otp->OTP = $otp_code;
        $otp->save();
    }

    public function checkOTP(Request $request) {
        $validate = $request->validate([
            'otp' => 'string'
        ]);

        $otp = OTPModel::where('OTP', $request->otp)->first();

        if ($otp) {
            // Jika OTP tersedia
            return response()->json(['message' => 'OTP is valid'], 200);
        } else {
            // Jika OTP tidak tersedia
            return response()->json(['message' => 'OTP is invalid'], 404);
        }
    }

    function generateRandomString($length = 4)
    {
        $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[random_int(0, $charactersLength - 1)];
        }
        return $randomString;
    }
}
