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
    	//return DB::select('SELECT * from driver');
    }
}
