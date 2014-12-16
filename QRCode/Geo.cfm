<cfscript>
	if(isDefined("form.submit"))
	{
		if(structkeyexists(form,"latitude") && structkeyExists(form,"longitude") && isnumeric(form.latitude) && isnumeric(form.longitude))
		{
			writedump(form);
			if(NOT structkeyExists(form,"altitude"))
					form["altitude"] = 0.0;
					
			if(NOT structkeyExists(form,"query"))
					form["query"] = "";

			geo = new data.GeoLocation(form.latitude, form.longitude);
			geo.setAltitude(form.altitude);
			geo.setSearchQuery(form.query);
			
			writeoutput("Raw String encoded: " & geo.toString());
			config = new QRConfig();
			config.setBarCodeSize("L");
			writer = new QRCodeWriter(config);  
			imageTempPath = expandPath("geo.png");
			writer.toFileFromAny(geo,imageTempPath, true);
			cfimage ( action="writeToBrowser" ,source=imagetempPath  );
		}
	}
</cfscript>
<html>
	<head>
		<title>
			QR Code Generate Geo
		</title>		
	</head>
	<body>
		<h1>Geo Location QR Encoder</h1>
		<form method="post" action="">
			<table>
			<tr>
			<td>Latitude: </td><td><input type="number"  name="latitude" autocomplete="on" step="0.0001" required="true"></td>
			</tr>
			<tr>
			<td>Longitude:</td><td><input type="number" name="longitude" autocomplete="on" step="0.0001" required="true"></td>
			</tr>
			<tr>
			<td>Altitude:</td><td><input type="number" name="altitude" autocomplete="on" step="0.0001"></td>
			</tr>
			<tr>
			<td>Query:</td><td><input type="text" name="query" autocomplete="on"></td>
			</tr>			
			<tr><td colspan="2">
			<input type="submit" name="submit"></td>
			</tr>
			</table>
		</form>
	</body>
</html>