component displayName="vCard 3.0 Contact" implements="QRObject"   
{
	Variables.Company = "";
	Variables.Title = "";
	Variables.Phone = "";
	Variables.Email = "";
	Variables.Address = "";
	Variables.Website = "";
	Variables.Memo = "";
	Variables.Prefix = "BEGIN:VCARD";
	
	public Contact function init(required String contactName)
	{
		Variables.contactName = contactName;
		return this;	
	}
	
	public String function getCompany()
	{
		return Variables.company;
	}
	
	public String function getTitle()
	{
		return Variables.Title;
	}
	
	public String function getPhone()
	{
		return Variables.Phone;
	}
	
	public String function getEmail()
	{
		return Variables.Email;
	}
	
	public String function getAddress()
	{
		return Variables.Address;
	}
	
	public String function getWebSite()
	{
		return variables.Website;
	}
	
	public String function getMemo()
	{
		return variables.memo;
	}
	
	public String function getEncoding()
	{
		return Variables.Encoding;
	}
	
	public String function getContactName()
	{
		return Variables.contactName;
	}
	
	public String function setCompany(String company)
	{
		Variables.company = company;
	}
	
	public String function setTitle(String title)
	{
		Variables.Title = title;
	}
	
	public String function setPhone(String phone)
	{
		Variables.Phone = phone;
	}
	
	public String function setEmail(String email)
	{
		Variables.Email = email;
	}
	
	public String function setAddress(String address)
	{
		Variables.Address = address;
	}
	
	public String function setWebSite(String website)
	{
		variables.Website = website; 
	}
	
	public String function setMemo(String memo)
	{
		variables.memo = memo;
	}

	public String function toString()
	{
		var QRString  = "#variables.Prefix##Chr(10)#VERSION:3.0#chr(10)#N:#Variables.contactName##chr(10)#";
		if(Len(Variables.company))
			QRString &= "ORG:#Variables.company##chr(10)#";
		if(Len(Variables.title))
			QRString &= "TITLE:#Variables.title##chr(10)#";
		if(Len(Variables.phone))
			QRString &= "TEL:#Variables.phone##chr(10)#";
		if(Len(Variables.website))
			QRString &= "URL:#Variables.website##chr(10)#";	
		if(Len(Variables.Email))
			QRString &= "EMAIL:#Variables.Email##chr(10)#";
		if(Len(Variables.Address))
			QRString &= "ADR:#Variables.Address##chr(10)#";	
		if(Len(Variables.Memo))
			QRString &= "NOTE:#Variables.Memo##chr(10)#";
		QRString &= "END:VCARD";
		return QRString;
	}

	public string function getType()
	{
		return "CONTACT";
	}
	
	public string function getPrefix()
	{
		return Variables.Prefix;
	}
	
	public struct function getDisplayResult()
	{
		var map = structnew();
		map["Name"] = getcontactName();
		map["Company"] = getCompany();
		map["Title"] = gettitle();
		map["Telephone"] = getPhone();
		map["Website"] = getWebSite();
		map["Email"] = getEmail();
		map["Address"] = getAddress();
		map["Memo"] = getMemo();
		map["Type"] = getType();
		return map;
	}	
}