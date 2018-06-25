<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests;
use Validator, Hash, DB, Mail;
use JWTAuth;

use Tymon\JWTAuthExceptions\JWTException;

use App\User;

class AuthenticateController extends Controller
{

   public function refresh(Request $request)
   {
        $token = $request->get('refreshToken');
 
        try {
            if (!$token) {
                return response()->json(['error' => 'login_unauthorized'], 401);
            }
        } catch (JWTException $e) {
            return response()->json(['error' => 'could_not_create_token'], 500);
        }

        $user = JWTAuth::toUser($token);
        $refresh_token = JWTAuth::refresh($token);        

        return response()->json([
                'accessToken' => $token,
                'refreshToken' => $refresh_token,
                'user' => $this->generate_user_response($user),                
                'message' => 'login_success',
                'status' => 200
        ]);
   }

    public function authenticate(Request $request)
    {
        $credentials = $request->only('email', 'password');
//        print_r($credentials);
//        exit;
        //Added is verified
        $credentials['is_verified'] = 1;
        try {
            // verify the credentials and create a token for the user
            if (! $token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'invalid_credentials'], 401);
            }
        } catch (JWTException $e) {
            // something went wrong
            return response()->json(['error' => 'could_not_create_token'], 500);
        }

        // if no errors are encountered we can return a JWT
        $user = JWTAuth::toUser($token);
        $refresh_token = JWTAuth::refresh($token); 
        return response()->json([
            'accessToken' => $token,
            'refreshToken' => $refresh_token,
            'user' => $user,                
            'message' => 'login_success',
            'status' => 200
        ]);
    }
    
    /**
     * register user
     */
    
    public function signup(Request $request) {
        $credentials = $request->only('first_name', 'last_name','email', 'password');
        
        $rules = [
            'first_name' => 'required|max:255',
            'last_name' => 'required|max:255',
            'email' => 'required|email|max:255|unique:users',
            'password'=> 'required|min:6'
        ];
        $validator = Validator::make($credentials, $rules);
        if($validator->fails()) {
            return response()->json(['success'=> false, 'error'=> $validator->messages(), 'status' => 500]);
        }
        $first_name = $request->first_name;
        $last_name = $request->last_name;
        $email = $request->email;
        $password = $request->password;
        
        $user = User::create(['first_name' => $first_name, 'last_name' => $last_name, 'email' => $email, 'password' => Hash::make($password)]);
        $verification_code = str_random(30); //Generate verification code
        DB::table('user_verifications')->insert(['user_id'=>$user->id,'token'=>$verification_code]);
        $subject = "Please verify your email address.";
        Mail::send('emails.verify', ['first_name' => $first_name, 'verification_code' => $verification_code],
            function($mail) use ($email, $first_name, $subject){
                $mail->from('admin@yahoo.com');
                $mail->to($email, $first_name);
                $mail->subject($subject);
            });
        return response()->json(['success'=> true, 'message'=> 'Thanks for signing up! Please check your email to complete your registration.', 'status' => 200]);
    
    }
    
     /* API Verify User
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function verifyUser(Request $request)
    {
        $verification_code = $request->verification_code;
        $check = DB::table('user_verifications')->where('token',$verification_code)->first();
        if(!is_null($check)){
            $user = User::find($check->user_id);
            if($user->is_verified == 1){
                return response()->json([
                    'success'=> true,
                    'message'=> 'Account already verified..'
                ]);
            }
            $user->update(['is_verified' => 1]);
            DB::table('user_verifications')->where('token',$verification_code)->delete();
            return response()->json([
                'success'=> true,
                'message'=> 'You have successfully verified your email address.',
                "status" => 200
            ]);
        }
        return response()->json(['success'=> false, 'error'=> "Verification code is invalid.","status" => 500]);
    }
}
