<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class LoginController extends Controller
{
	public function login(Request $request){
		if($request->input('user')){
			$user=$request->input('user');
		}else{
			return 'please specify user driver or customer';
		}

		$contactNo=$request->input('contactNo');
		$password=$request->input('password');

		$user=DB::select('SELECT firstName FROM '.$user.' WHERE contactNo=\''.
			$contactNo.'\''
			);
		if($user){
			$user=DB::select('SELECT firstName FROM '.$user.' WHERE contactNo=\''.
			$contactNo.'\' AND password=\''.$password."'"
			);
			if($user){
				return $user[0]->firstName;
			}else{
				return -1;
			}
		}else{
			return 0;
		}
	}
}