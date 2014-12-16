component  implements="QRObject"
{
	public Text function init(required string text)
	{
		Variables.Text = text;
		return this;
	}
	
	public string function getText()
	{
		return Variables.Text;
	}
	
	public string function getType()
	{
		return "TEXT";
	}
	public string function getPrefix()
	{
		return "";
	}
	
	public struct function getDisplayResult()
	{
		var map = structnew();
		map["Content"] = getText();
		return map;
	}
}