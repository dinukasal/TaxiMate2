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

		$loggedUser=DB::select('SELECT firstName FROM '.$user.' WHERE contactNo=\''.
			$contactNo.'\''
			);
		if($loggedUser){
			$loggedUser=DB::select('SELECT firstName FROM '.$user.' WHERE contactNo=\''.
			$contactNo.'\' AND password=\''.$password."'"
			);
			if($loggedUser){
				return response('1')->header('Access-Control-Allow-Origin','*');
			}else{
				return response('0')->header('Access-Control-Allow-Origin','*');
			}
		}else{
				return response('-1')->header('Access-Control-Allow-Origin','*');
		}
	}
}