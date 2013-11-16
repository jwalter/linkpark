<!doctype html>

<html>
<head>
<meta charset="utf-8">
<title>Parkeringshus</title>

<meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
div
{
font-size: 18pt;
font-family: Helvetica;
}
.parking-area
{
background-color:#ffffff;
}
.parking-area:nth-child(odd)
{
    background:#ffffff;
}
.parking-area:nth-child(even)
{
    background:#eeeeee;
}
.parking-area-name
{
display:inline;
}
.parking-area-spaces
{
display:inline;
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
				var s = "";
				for (var i = 0; i < 8; i++) {
					var parkingArea = parkingAreas[i];
					if (parkingArea.Id.indexOf('_1') != -1) {
						s += "<div class='parking-area'>"
						s += "<div class='parking-area-name'>";
						s += parkingArea.Name;
						s += "</div>";
						s += "<div class='parking-area-spaces'>";
						s += parkingArea.ParkingSpacesAvailable;
						s += "</div>";
						s += "</div>";
					}
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
</html>
