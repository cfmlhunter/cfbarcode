component name="WifiTextParser"
{
	public data.WifiNetwork function parse(required string text) output="false" 
	{
		if(Left(text, 5) EQ "WIFI:")
		{
			text = Mid(text,5,Len(text));
			var paramsArray = listToArray(text,";", false);
			var prefixMap = structNew();
			for(var index =1; index LTE Arraylen(paramsArray); index++)
			{
				// Java functions are 0-index based whereas CF functions are 1-index based
				var currentParam = paramsArray[index];
				var prefixIndex = currentParam.indexOf(":");
				if(prefixIndex == -1)
					throw("Invalid Wifi String","InvalidData");
				var key = mid(currentparam, 1, prefixIndex);
				if(prefixindex == len(currentparam) -1)	
					prefixMap[key] = "";
				else
					prefixMap[key] = mid(currentparam, prefixindex +1, len(currentparam));	
			}
			return getData(prefixmap);			
		}
	}
	
	private data.WifiNetwork function getData(struct prefixMap)
	{
			var SSID = "";
			
			if(structkeyExists(prefixmap,"S"))
				SSID = prefixMap["S"];
			
			if(Not Len(SSID))
				throw("Invalid Wifi Message", "Invalid Data");
			var type = "";
			
			if(structkeyExists(prefixmap,"T"))
				type = prefixMap["T"];
			
			if(Not Len(type))
				type="nopass";
				
			var password = "";
			if(structkeyExists(prefixmap,"P"))
				password = prefixMap["P"];
			
			var hidden = "no";
			if(structkeyexists(prefixMap,"H"))
				hidden = YesNoFormat(prefixMap["H"]);
				
			var wifi = new data.WifiNetWork(unEscape(SSID));
			wifi.setAuthScheme(type);
			wifi.setWifiPassword(unEscape(password));
			wifi.setHidden(hidden);
			return wifi;
	}
	
	private string function unEscape(required string input)
	{
		// FIXME Pretty Bad Logic need to change
		return input.replaceAll("\\\\","\\").replaceAll("\\'","'").replaceAll("\\.",".").replaceAll("\\,",",").replaceAll("\\:",":").replaceAll("\\;",";").replaceAll('\\"','"');
	}
}