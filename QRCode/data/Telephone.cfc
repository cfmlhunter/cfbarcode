component  implements="QRObject"
{
	public Telephone function init(required string phoneNumber)
	{
		Variables.Phone = phoneNumber;
		return this;
	}
	
	public string function getType()
	{
		return "TEL";
	}
	
	public string function getPrefix()
	{
		return "TEL:";
	}
	
	public string function getPhoneNumber()
	{
		return Variables.Phone;
	}
	
	public string function toString()
	{
		return getPrefix() & Variables.phone;
	}
}