<?php

namespace App\Http\Controllers;

class TestController extends Controller
{
	public function test(){
		return view('request',['title'=>'request','test'=>'this is a test']);
	}
}