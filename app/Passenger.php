<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Passenger extends Model
{
    public function savePassenger(Passenger $passenger){
    	$user=DB::select('SELECT * from passenger where contactNo=\''.$passenger->contactNo.'\'');
		if($user){
				$affected=DB::update('UPDATE passenger SET 
								firstName=\''.$passenger->contactNo.'\',
								lastName=\''.$passenger->lastName.'\',
								email=\''.$passenger->email.'\'
								 where 
								contactNo=\''.$passenger->contactNo.'\'
								');
				if($affected){
					return 1;
				}else{
					return 0;
				}
		}else{
			DB::insert('INSERT INTO passenger (id,firstName
				lastName,contactNo,email,date,password)
				VALUES (?,?,?,?,?,?,?)',
				[null,$passenger->firstName,
				$passenger->lastName,
				$passenger->contactNo,
				$passenger->email,
				date(Y-m-d),
				$passenger->password ]
				)
		}
    }
    public function getPassenger($contactNo){
    	$user=DB::select('SELECT * from passenger where contactNo=\''.$contactNo.'\'');
    	return $user;
    }
    public function changePassword($contactNo,$password){
    	$changed=DB::update('UPDATE passenger SET password=\''.$password
    				.'\' WHERE contactNo=\''.$contactNo.'\''
    		);
    	if($changed){
    		return 1;
    	}else{
    		return 0;
    	}
    }
}
