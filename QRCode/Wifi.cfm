<cfscript>
	function validate() output="true" 
	{

		if(structkeyExists(form, "submit"))
		{
			if(structkeyExists(form, "SSID"))
			{
				if(NOT Len(form.SSID))
				{
					writeoutput("Invalid SSID" & " <br/><br/>");
					return;
				}
			}
			else
			{
				writeoutput("Provide valid SSID" & " <br/><br/>");
					return;
			}
			
			type = "nopass";
			if(structkeyExists(form,"type"))
				type = form.type;
			if(NOT structkeyExists(form,"password")|| NOT Len(form.password))
			{
				writeoutput("Invalid Password " & "<br/><br/>");
				return;	
			}
			hidden = false;
			if(structkeyExists(form,"hidden"))
				hidden = form.hidden;
			
			try
			{
				wifi = new data.WifiNetWork(form.SSID);
				wifi.setAuthScheme(type);
				wifi.setHidden(hidden);
				wifi.setWifiPassword(form.password);
				
				config = new QRConfig();
				writer = new QRCodeWriter(config);
				path = expandpath("wifi.png");
				writeoutput("Raw Encoded String: " & wifi.toString() & "<br/><br/>");
				qrImage =  writer.toFileFromAny(wifi,path, true);
				cfimage ( action="writeToBrowser" ,source=path  );
			}
			catch(any e)
			{
				writeDump(e);
			}
				
		}
	}
	
	validate();
</cfscript>
<html>
	<title>
		Wifi QR Code
	</title>
	<body>
		<h1>Wifi QR Code</h1>
		<form method="post" action="">
			SSID: <input name="SSID" type="text" autocomplete="off" required="true"><br/><br/>
			Encryption: 
			<select name="type">
    			<option value="nopass">No Encryption</option>
			    <option value="WEP">WEP</option>
			    <option value="WAP">WAP/WAP2</option>
			</select><br/><br/>
			Password: <input type="password" autocomplete="off" name="Password"><br/><br/>
			Hidden: <input type="checkbox" name="hidden" value="false"><br/><br/>
			Submit: <input type="submit" value="submit" name="submit">
		</form>
	</body>
</html>