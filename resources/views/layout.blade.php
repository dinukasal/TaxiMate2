<html>
	<head>
		<title>
			@if (1==0)
				{{ title }}
			@else
				
				{{ 'Title'}}
			@endif
		</title>
	</head>
	<body>
		@yield('content')
	</body>
</html>