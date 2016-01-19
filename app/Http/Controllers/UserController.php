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
    		$user->savePassenger($user);

    	}elseif($request->input('user')=='driver'){
    		$user=new Driver;
    		$user->firstName=$request->input('firstName');
    		$user->lastName=$request->input('lastName');
    		$user->contactNo=$request->input('contactNo');
    		$user->password=$request->input('password');
    		$user->saveDriver($user);
    	}
    }
    public function getUser(Request $request){
        if($request->input('user')=='passenger'){
            return Passenger::getPassenger($request->contactNo);
        }elseif($request->input('user')=='driver'){
            return Driver::getDriver($request->input('contactNo'));
        }
    }
    public function changePassword(Request $request){
        if($request->input('user')=='passenger'){
            $user=new Passenger;
            $user->changePassword($request->input('contactNo'),$request->input('password'));
        }elseif($request->input('user')=='driver'){
            $user=new Driver;
            $user->changePassword($request->input('contactNo'),$request->input('password'));
        }
    }

}
