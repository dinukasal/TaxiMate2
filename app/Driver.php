<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;
class Driver extends Model
{
	protected $table='driver';
    public function getAll(){
		$table='driver';
		$data=(DB::select('SELECT * from '.$table));
		return var_dump($data);
	}
	public function saveDriver(Driver $driver){
		$user=DB::select('SELECT * from driver where contactNo=\''.$driver->contactNo.'\'');
		if($user){
				$affected=DB::update('UPDATE driver SET 
								firstName=\''.$driver->contactNo.'\',
								lastName=\''.$driver->lastName.'\' where 
								contactNo=\''.$driver->contactNo.'\'
								');
				if($affected){
					return 'ok';
				}else{
					return 'error';
				}
		}else{
			DB::insert('INSERT INTO driver (id,firstName
				lastName,email,nic,availability,contactNo,password)
				VALUES (?,?,?,?,?,?,?,?)',
				[null,$driver->firstName,
				$driver->lastName,
				$driver->email,
				$driver->nic,
				$driver->availability,
				$driver->contactNo,
				$driver->password ]
				);
		}
	}
    public function getDriver($contactNo){
    	return DB::select('SELECT * from driver where contactNo=\''.$contactNo.'\'');
    }
    public function checkAvailability($contactNo){
    	$availability= DB::select('SELECT availability FROM driver 
    					where contactNo=\''.$contactNo.'\'');
    	if($availability){
    		return $availability;
    	}else{
    		return 'no user with contactNo:'.$contactNo;
    	}
    }
    public function changePassword($contactNo,$password){
    	$changed=DB::update("UPDATE driver SET password='".$password
    				."' WHERE contactNo='".$contactNo."'"
    		);
    	if($changed){
    		return 1;
    	}else{
    		return 0;
    	}
    }
    public function getProfile($contactNo){
    	$driver=DB::select("SELECT * FROM driver natural join driverprofile WHERE contactNo='".$contactNo."'");
    	if($driver){
    		return $driver;
    	}else{
    		return 0;
    	}
    }
    public function updateProfile(Driver $driver){
    	$driverid=DB::select("SELECT id FROM driver where contactNo='".$driver->contactNo."'");
    	if($driverid){
	    	$vehicleType=$driver->vehicleType;
	    	$vehicleModel=$driver->vehicleModel;
	    	$discription=$driver->discription;
	    	$updated=DB::update(" UPDATE driverprofile SET
	    						Driver_id='".$driverid[0]->id."'
	    						vehicleType='".$vehicleType."',
	    						vehicleModel='".$vehicleModel."',
	    						discription='".$discription."'
	    		");
    	}
    }
    public function updateRates($contactNo,$rates){
    	$driverid=DB::select("SELECT id FROM driver where contactNo='".$contactNo."'")[0]->id;

    	if($driverid){
	    	if(isset($rates['specialFare'])){
	    		$updated=DB::update("
				UPDATE fare SET 
				specialFare='".$rates['specialFare']."'
				WHERE Driver_id='".$driverid."'
				");
				return $updated;
	    	}else{
	    		$updated=DB::update("
	    					UPDATE fare SET 
	    					dayTimeFare='".$rates['dayTimeFare']."'
	    					nightTimeFare='".$rates['nightTimeFare']."'
	    					WHERE Driver_id='".$driverid."'
	    			");	    	
	    		return $updated;
	    	}
    	}else{
    		return 0;
    	}
    }
}
