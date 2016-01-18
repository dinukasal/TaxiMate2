@if(!isset($_SESSION))
	<p style="visibility:hidden">{{ session_start()  }}</p>
@endif
@if(isset($_SESSION['username']) and $_SESSION['username']!='')

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
	.inline{
		display:inline;
	}
</style>

<title>{{$title }}</title>

<link href="/css/bootstrap.min.css" rel="stylesheet">
<link href="/css/styles.css" rel="stylesheet">

<!--Icons-->
<script src="/js/lumino.glyphs.js"></script>

<!--[if lt IE 9]>
<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><span>EDEX</span>MAG</a>
				<ul class="user-menu">
					<li class="dropdown pull-right">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> {{ $_SESSION['username']}} <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/logout"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"></use></svg> Logout</a></li>
						</ul>
					</li>
				</ul>
			</div>
							
		</div><!-- /.container-fluid -->
	</nav>
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<ul class="nav menu">
			<li class="active"><a href="/view"><svg class="glyph stroked clipboard with paper"><use xlink:href="#stroked-clipboard-with-paper"/></svg> View All Magazines</a></li>
			<li><a href="/addmag"><svg class="glyph stroked notepad "><use xlink:href="#stroked-notepad"/></svg> Add Magazine</a></li>
			<li><a href="/list"><svg class="glyph stroked cancel"><use xlink:href="#stroked-cancel"/></svg> Delete Magazine</a></li>
			
			
			<li role="presentation" class="divider"></li>
			<li><a href="/logout"><svg class="glyph stroked male-user"><use xlink:href="#stroked-male-user"></use></svg> Logout</a></li>
		</ul>

	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		
	@yield('content')


	</div>	<!--/.main-->


	<script src="/js/jquery-1.11.1.min.js"></script>
	<script src="/js/bootstrap.min.js"></script>
	
</body>

</html>

@else
	{{ Redirect::away('/login') }}
@endif