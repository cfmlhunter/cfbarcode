component name="WifiNetWork" implements="QRObject"   
{
	//http://daniel-baumann.ch/other/qr-codes/wifi/
	Variables.Password = "";
	Variables.AuthScheme = "WEP";
	Variables.AuthSchemeValues = "WEP,WPA,WPA2,NOPASS";
	Variables.Visible = false;
	
	public WifiNetWork function init(required String SSID)
	{
		Variables.SSID = escape(SSID);
		return this;
	}
	
	public String function getWifiPassword()
	{
		return Variables.password;
	}
	
	public String function getWifiAuthScheme()
	{
		return Variables.AuthScheme;
	}
	
	public boolean function isVisible()
	{
		return Variables.Visible;
	}
	
	public String function getSSID()
	{
		return Variables.SSID;
	}
	
	public void function setWifiPassword(String wifiPassword)
	{
		if(authscheme NEQ "NOPASS")
			Variables.Password = escape(wifiPassword);
	}
	
	public void function setAuthScheme(required String authScheme)
	{
		if(listcontainsNoCase(Variables.AuthSchemeValues,authScheme))
		{
			if(authscheme eq "WPA2")
				authscheme = "WPA";
			else if(isnoEncryption(authScheme))
				Variables.Password = "";
			Variables.authScheme = authScheme;
		}
	}
	
	public void function setVisible(boolean visible)
	{
		Variables.visible = visible;
	}
	
	private boolean function isNoEncryption(string scheme)
	{
		return scheme eq "NOPASS";
	}
	
	private string function escape(required string input)
	{
		var builder = createObject("java","java.lang.StringBuilder").init();
		for(var index = 0; index LT Len(input); index++)
		{
			var escape = false;
			var character = input.charAt(index);
			switch(character)
			{
				case "\":
				case "'":
				case ".":
				case ":":
				case ",":
				case ";":
				case '"':
					escape = true;
			}
			if(escape)
				builder.append("\");
			builder.append(character);
		}
		return builder.toString();
	}
	
	public String function toString()
	{
		var QRString = getprefix() & "S:#Variables.SSID#";
		if(Len(Variables.AuthScheme) && NOT isNoEncryption(Variables.AuthScheme))
			QRString &= ";T:#Variables.AuthScheme#";
		
		if(Len(Variables.Password))
			QRString &= ";P:#Variables.Password#";

		if(Variables.Visible)
			QRString &= ";H:#variables.visible#";
			
		QRString &= ";;";
		return QRString;
	}
	
	public string function getType()
	{
		return "WIFI";
	}
	
	public string function getPrefix()
	{
		return "WIFI:";
	}	
}