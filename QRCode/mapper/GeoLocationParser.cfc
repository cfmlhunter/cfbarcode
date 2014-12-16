component name="GeoLocationParser"
{
	public data.GeoLocation function parse(required string text)
	{
		// Java and CF Mixup
		if(Left(text, 4) EQ "GEO:")
		{
			text = Mid(text,4,Len(text));
			var queryIndex = text.indexOf("?");
			var queryStr = "";
			if(queryIndex == -1 || queryIndex == Len(text) -1)
				queryindex = Len(text);
			else
				querystr = text.substring(queryindex+1);			
		
			var coordinates = Mid(text, 1, queryindex);
			var coordinatesArray = listtoarray(coordinates);
			if(arraylen(coordinatesArray) GT 3)
				throw("Invalid Geo Location","InvalidData");
			var latitude = coordinatesArray[1];
			var longitude = coordinatesArray[2];
			var altitude = 0.0;
			if(arraylen(coordinatesArray) EQ 3)
				altitude = coordinatesArray[3];
			
			var geoLocation = new data.GeoLocation() 

		}
	}
}