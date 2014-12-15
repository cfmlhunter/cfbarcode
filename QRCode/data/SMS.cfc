component name="SMS" implements="QRObject"   
{
	// http://goqr.me/qr-codes/type-qr-sms.html
	Variables.message = "";
	Variables.phoneNumber = "";
	Variables.Prefix = "SMSTO:";
	
	public String function getPhoneNumber()
	{
		return Variables.phoneNumber;
	}
	
	public String function getMessage()
	{
		return Variables.message;
	}
	
	public void function setPhoneNumber(required String phoneNumber)
	{
		phoneNumber = phoneNumber.replaceAll(" ","").replaceAll("-","");
		var num = phoneNumber;
		if(phoneNumber.startsWith("+"))
			num = phoneNumber.subString(1);
    	if(NOT isValid("regex",num,"^[0-9]*$"))
    		throw(type = "InvalidData", message = "Invalid Phone Number");
    		
    	Variables.phoneNumber = phoneNumber;
	}
	
	public void function setMessage(String message)
	{
		Variables.message = message;
	}
	
	public string function getPrefix()
	{
		return Variables.Prefix;
	}
	
	public String function toString()
	{
		if(NOT Len(Variables.message) && NOT Len(Variables.phoneNumber))
	        Throw(type="InvalidData",message="SMS/MMS is not valid");
		
		var qrString = getprefix() & ":";
		if(Len(variables.phoneNumber))
			qrString &= variables.phoneNumber;
		
		if(Len(variables.message))
			qrString &= ":#variables.message#"; 
		return qrString;
	}
}