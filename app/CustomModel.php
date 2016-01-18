<?php
use DB;
class CustomModel{
	public function all($table){
		return DB::select('SELECT * from \''.$table);
	}
}
