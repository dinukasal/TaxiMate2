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
    public function updateRates(Request $request){
    	
    }
}
