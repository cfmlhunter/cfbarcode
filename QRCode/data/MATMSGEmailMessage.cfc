component  extends="EmailMessage"
{
	Variables.Prefix = "MATMSG:";
	public string function toString()
	{
		var qrString = getprefix();
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
}