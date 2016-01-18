<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use DB;
class Driver extends Model
{
    public function getAll(){
		$table='driver';
		$data=(DB::select('SELECT * from '.$table));
		return var_dump($data);
	}
}
