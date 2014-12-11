component displayname="Geo Location"
{
	Variables.searchQuery = "";

	public GeoLocation function init(required numeric Latitude, required numeric Longitude, 
	                                 String searchQuery)
	{
		Variables.Latitude = Latitude;
		Variables.Longitude = Longitude;
		Variables.searchQuery = searchQuery;
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
	
	public String function getSearchQuery()
	{
		return Variables.searchQuery;
	}
	
	public void function setLatitude(required numeric Latitude)
	{
		Variables.Latitude = Latitude;
	}
	
	public numeric function setLongitude(required numeric Longitude)
	{
		Variables.Longitude = Longitude;
	}
	
	public String function setSearchQuery(required String searchQuery)
	{
		Variables.searchQuery = searchQuery;
	}
	
	public String function toString()
	{
		var QRString = "geo:#Variables.Latitude#,#Variables.Longitude#";
		if(Len(Variables.searchQuery))
			QRString &= "?q=#Variables.searchQuery#";
		return QRString;
	}
	
}