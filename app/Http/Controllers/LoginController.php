<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
use App\Http\Requests;
use App\Http\Controllers\Controller;

class LoginController extends Controller
{
	public function login(Request $request){
		$contactNo=$request->input('contactNo');
		$password=$request->input('password');
		return DB::select('SELECT name FROM customer WHERE contactNo=\''.
			$contactNo.'\' AND password=\''.$password.'\''
			);
	}
}