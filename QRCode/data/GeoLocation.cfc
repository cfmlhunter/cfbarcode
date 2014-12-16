component displayname="Geo Location" implements="QRObject"   
{
	Variables.searchQuery = "";
	Variables.Altitude = 0.0;

	public GeoLocation function init(required numeric Latitude, required numeric Longitude)
	{
		setlatitude(Latitude);
		setlongitude(Longitude);
		return this;
	}
	
	public numeric function getLatitude()
	{
		return Variables.Latitude;
	}
	
	public numeric function getLongitude()
	{
		return Variables.Longitude;
	}
	
	public numeric function getAltitude()
	{
		return Variables.Altitude;
	}
	
	public String function getSearchQuery()
	{
		return Variables.searchQuery;
	}
	
	public void function setLatitude(required numeric Latitude)
	{
		if(latitude > 90.0 || latitude < -90.0)
			throw("Invalid Latitude", "InvalidData");
		Variables.Latitude = Latitude;
	}
	
	public void function setLongitude(required numeric Longitude)
	{
		if(longitude > 180.0 || Longitude < -180.0)
			throw("Invalid Longitude","InvalidData");
		Variables.Longitude = Longitude;
	}
	
	public string function setSearchQuery(required String searchQuery)
	{
		Variables.searchQuery = searchQuery;
	}
	
	public string function setAltitude(required numeric altitude)
	{
		if(altitude < 0.0)
			throw("Invalid Altitude","InvalidData");
		Variables.Altitude = altitude;
	}
	
	public String function toString()
	{
		var QRString = getprefix() & Variables.Latitude & "," & Variables.Longitude & "," & Variables.Altitude;		
		if(Len(Variables.searchQuery))
			QRString &= "?q=#Variables.searchQuery#";
		return QRString;
	}
	
	public string function getPrefix()
	{
		return "GEO:";
	}
	
	public string function getType()
	{
		return "GEO";
	}
		
	public struct function getDisplayResult()
	{
		var map = structnew();
		map["Latitude"] = getLatitude();
		map["Longitude"] = getLongitude();
		map["Altitude"] = getAltitude();
		map["Search Query"] = getSearchQuery();
		map["Type"] = gettype();
		return map;
	}
}