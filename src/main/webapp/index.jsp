<!doctype html>

<html>
<head>
<meta charset="utf-8">
<title>Parkeringshus</title>

<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
div {
	font-size: 18pt;
	font-family: Helvetica;
}

.parking-area:nth-child(odd) {
	background: #ffffff;
}

.parking-area:nth-child(even) {
	background: #eeeeee;
}

.parking-area-name {
	display: inline;
}

.parking-area-spaces {
	display: inline;
	float: right;
}
</style>
<!-- /// -->
<script type="text/javascript">
<!--
	function loadXMLDoc() {
		if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

				var jsn = eval('(' + xmlhttp.responseText + ')');
				var parkingAreas = jsn.ParkingAreaUpdateList;
				parkingAreas = parkingAreas
						.filter(function(a) {
							return a.Id.indexOf('_1') != -1
									&& !(a.Name === 'Korttidsparkeringen Baggen' || a.Name === 'Linköping City Airport Långtidsparkering');
						});
				parkingAreas.sort(function(a, b) {
					if (a.Name < b.Name)
						return -1;
					if (a.Name > b.Name)
						return 1;
					return 0;
				});
				var s = "";
				for ( var i = 0; i < parkingAreas.length; i++) {
					var parkingArea = parkingAreas[i];
					s += "<div class='parking-area'>"
					s += "<div class='parking-area-name'>";
					s += parkingArea.Name;
					s += "</div>";
					s += "<div class='parking-area-spaces'>";
					s += parkingArea.ParkingSpacesAvailable;
					s += "</div>";
					s += "</div>";
				}
				document.getElementById("myDiv").innerHTML = s;
			}
		}
		xmlhttp.open("GET", "hello", true);
		xmlhttp.send();
	}
// -->
</script>
</head>

<body onLoad="loadXMLDoc()">
	<div id="myDiv"></div>

</body>
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js',
			'ga');

	ga('create', 'UA-2723853-7', 'linkpark.herokuapp.com');
	ga('send', 'pageview');
</script>
</html>
