@extends('layout')

@section('content')
	<form method="post" url="{{ url('/request') }}">
		<label>Request</label>
		<input type="text"></input>

	</form>
@endsection