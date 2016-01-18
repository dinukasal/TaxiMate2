@extends('layout')

@section('content')
	<form method="post" action="{{ url('/login') }}">
		<label>Username</label>
		<input name="contactNo" type="text"></input>
		<br>
		<label>Password</label>
		<input name="password" type="password"></input>
		<br>
		<button>Login</button>
	</form>
@endsection