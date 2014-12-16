component  implements="QRObject"
{
	Variables.title = "";
	public URL function init(required string url)
	{
		if(NOT isValid("url", url))
			throw("Invalid URL", "InvalidData");
		Variables.url = url;
		return this;
	}
	
	public string function getTitle()
	{
		return Variables.title;
	}
	
	public function setTitle(string title)
	{
		Variables.title = title;
	}
	
	public string function getURL()
	{
		return Variables.url;
	}
	
	public string function getType()
	{
		return "URL";
	}
	public string function getPrefix()
	{
		return "";
	}
	
	public struct function getDisplayResult()
	{
		var map = structnew();
		map["url"] = getuRL();
		map["title"] = gettitle();		
		return map;
		
	}
}