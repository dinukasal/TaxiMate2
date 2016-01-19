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
}
