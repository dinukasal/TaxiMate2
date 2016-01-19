<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
//use DB;
use App\Driver;
class DriverController extends Controller
{

    public function getAll(){
    	$driver=new Driver;
    	return $driver->getAll();
    }
    public function checkAvailability(Request $request){
    	$driver=new Driver;
    	$availability=$driver->checkAvailability($request->input('contactNo'))[0]->availability;
    	return $availability;
    }
    public function getDriver(Request $request){        //get basic information
        $driver=new Driver;
        return $driver->getDriver($request->input('contactNo'));
    }
    public function getProfile(Request $request){
        $driver=new Driver;
        return $driver->getProfile($request->input('contactNo'));   // return 2nd element of the object array
    }
    public function updateProfile(Request $request){
        $driver=new Driver;
        $driver->vehicleType=$request->input('vehicleType');
        $driver->vehicleModel=$request->input('vehicleModel');
        $driver->discription=$request->input('discription');
        $driver->contactNo=$request->input('contactNo');
        $driver->updateProfile($driver);
    }
    public function updateRates(Request $request){
	    $driver=new Driver;
        return $driver->updateRates($request->input('contactNo'),['specialFare'=>'123']);
    }
}
