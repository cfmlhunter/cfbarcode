component  name="EmailMessage" implements="QRObject"     
{
	Variables.tos = "";
	Variables.ccs = "";
	Variables.bccs = "";
	Variables.subject = "";
	Variables.body = "";
	Variables.Prefix = "MAILTO:";
	
	public function setToAddresses(required array toAddresses)
	{
		validateAddresses(toAddresses);
		Variables.tos = toAddresses;
	}
	
	public function setCcAddresses(array ccAddresses)
	{
		validateaddresses(ccAddresses);
		Variables.ccs = ccAddresses;
	}
	
	public function setBccAddresses(array bccAddresses)
	{
		validateaddresses(bccAddresses);
		Variables.bccs = bccAddresses;
	}
	
	private function validateAddresses(array addrs)
	{
		if(arraylen(addrs) GTE 1)
		{
			for(var i = 1; i LTE arraylen(addrs);i++)
			{
				if(NOT isvalid("email",addrs[i]))
					throw(type="InvalidEmailAddress");
			}
		}
	}
	
	public function setSubject(required string subject)
	{
		Variables.subject = subject;
	}
	
	public function setBody(required string body)
	{
		Variables.body = body;
	}
	
	public array function getToAddresses()
	{
		return Variables.tos;
	}
	
	public array function getCcAddresses()
	{
		return variables.ccs;
	}
	
	public array function getBccAddresses()
	{
		return Variables.bccs;
	}
	
	public string function getSubject()
	{
		return Variables.subject;
	}
	
	public string function getBody()
	{
		return variables.body;
	}
	
	public string function toString()
	{
		var qrString = getprefix();
		if(arraylen(Variables.tos))
			qrString &= arraytolist(Variables.tos);
		
		var queryString = "";
		if(arraylen(Variables.ccs))
			querystring = "cc:" & arraytoList(Variables.ccs);
		
		if(arraylen(Variables.bccs))
		{
			if(Len(queryString))
				querystring &= "&";
			querystring &= "bcc:" & arraytolist(Variables.bccs);
		}
		
		if(Len(Variables.subject)){
			if(Len(queryString))
				querystring &= "&";
			querystring &= "subject:" & #Variables.subject#;
		}
		
		if(len(Variables.body))
		{
			if(len(querystring))
				querystring &= "&";
			querystring &= "body:" & Variables.body;
		}
		
		if(len(querystring))
			qrString &= "?" & queryString;
		
		return qrstring;	
	}
	
	public string function toMATMSGString()
	{
		var qrString = "MATMSG:";
		if(arraylen(Variables.tos))
			qrString &= "TO:"& arraytolist(Variables.tos);
		
		if(arraylen(Variables.ccs))
			qrString &= ";CC:" & arraytoList(Variables.ccs);
		
		if(arraylen(Variables.bccs))
			qrString &= ";BCC:" & arraytolist(Variables.bccs);
		
		if(Len(Variables.subject))
			qrString &= ";SUB:" & #Variables.subject#;
				
		if(len(Variables.body))
			qrString &= ";BODY:" & Variables.body;
		
		return qrstring & ";;";
	}
	
	public string function getPrefix()
	{
		return Variables.Prefix;
	}
	
	public string function getType()
	{
		return "EMAIL";
	}
}