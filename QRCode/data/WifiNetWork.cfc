component name="WifiNetWork" implements="QRObject"   
{
	//http://daniel-baumann.ch/other/qr-codes/wifi/
	Variables.Password = "";
	Variables.AuthScheme = "WEP";
	Variables.AuthSchemeValues = "WEP,WPA,WPA2,NOPASS";
	Variables.hidden = false;
	
	public WifiNetWork function init(required String SSID)
	{
		Variables.SSID = SSID;
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
	
	public boolean function isHidden()
	{
		return Variables.hidden;
	}
	
	public String function getSSID()
	{
		return Variables.SSID;
	}
	
	public void function setWifiPassword(String wifiPassword)
	{
		if(authscheme != "NOPASS")
			Variables.Password = wifiPassword;
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
	
	public void function setHidden(boolean hidden)
	{
		Variables.hidden = hidden;
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
		var QRString = getprefix() & "S:" & escape(Variables.SSID);
		if(Len(Variables.AuthScheme) && !isNoEncryption(Variables.AuthScheme))
			QRString &= ";T:#Variables.AuthScheme#";
		
		if(Len(Variables.Password))
			QRString &= ";P:" & escape(Variables.Password);

		if(Variables.hidden)
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
	
	public struct function getDisplayResult()
	{
		var map = structnew();
		map["SSID"] = getSSID();
		map["Encryption"] = getWifiAuthScheme();
		map["Password"] = getWifiPassword();
		map["Hidden"] = ishidden();
		map["Type"] = gettype();
		return map;
	}	
}