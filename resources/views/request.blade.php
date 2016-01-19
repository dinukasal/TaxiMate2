@extends('layout')

@section('content')
	<form method="post" action="{{ url('/updaterates') }}">
		<label>first name</label>
		<input name="firstName" type="text"></input>
		<label>second name</label>
		<input name="secondName" type="text"></input>
		<br>
		<label>Contact No</label>
		<input name="contactNo" type="text"></input>
		<br>
		<label>Password</label>
		<input name="password" type="password"></input>
		<br>
		<select name="user">
			<option value="driver">Driver</option>
			<option value="passenger">Passenger</option>
		</select>
		<br>

		<button>Login</button>
	</form>
@endsection