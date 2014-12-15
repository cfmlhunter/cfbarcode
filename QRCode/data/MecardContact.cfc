component  extends="VCardContact" displayname="Mecard format Contact" 
{
	Variables.Prefix = "MECARD:";
	
	public string function toString()
	{
		var QRString = getPrefix() & "N:#Variables.contactName#";
		if(Len(Variables.company))
			QRString &= ";ORG:#Variables.company#";
		if(Len(Variables.title))
			QRString &= ";TITLE:#Variables.title#";
		if(Len(Variables.phone))
			QRString &= ";TEL:#Variables.phone#";
		if(Len(Variables.website))
			QRString &= ";URL:#Variables.website#";	
		if(Len(Variables.Email))
			QRString &= ";EMAIL:#Variables.Email#";
		if(Len(Variables.Address))
			QRString &= ";ADR:#Variables.Address#";	
		if(Len(Variables.Memo))
			QRString &= ";NOTE:#Variables.Memo#";
		QRString &= ";;";
		return QRstring;
	}
}