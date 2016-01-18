<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Customer;
use App\Driver;

class UserController extends Controller
{
    public function registerUser(Request $request){
    	if($request->input('user')=='passenger'){
    		$user=new Passenger;
    		$user->firstName=$request->input('firstName');
    		$user->lastName=$request->input('lastName');
    		$user->nic=$request->input('nic');
    		$user->contactNo=$request->input('contactNo');
    		$user->password=$request->input('password');
    		$user->save();

    	}elseif($request->input('user')=='driver'){
    		$user=new Driver;
    		$user->firstName=$request->input('firstName');
    		$user->lastName=$request->input('lastName');
    		$user->contactNo=$request->input('contactNo');
    		$user->password=$request->input('password');
    		$user->saveDriver($user);
    	}
    }
}
