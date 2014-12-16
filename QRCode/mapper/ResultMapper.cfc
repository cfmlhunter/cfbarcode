component name="ResultMapper"
{	
	public data.QRObject function map(required any mappedObj) output="true" 
	{
		var className = mappedObj.getClass().getName();
		var result1 = new data.Text(mappedObj.toString()); 
		if(className.startsWith("com.google.zxing.client.result."))
		{

			var mappedClass = className.subString(className.lastIndexOf(".") + 1);
			if(Right(mappedClass, 12) eq "ParsedResult")
			{
				var type = mappedClass.subString(0, mappedClass.lastIndexOf("ParsedResult"));
				
				switch(type)
				{
					case "Wifi":
						var result = new data.WifiNetWork(mappedObj.getSsid());
						result.setAuthScheme(mappedObj.getNetworkEncryption());
						result.setWifiPassword(mappedObj.getPassword());
						result.setHidden(mappedObj.isHidden());
						return result;
					case "Geo":
						var result = new data.GeoLocation(mappedObj.getLongitude(), mappedObj.getLatitude());
						result.setaltitude(mappedObj.getAltitude());
						result.setSearchQuery(mappedobj.getQuery());
						return result;
					case "SMS":
						var result = new data.SMS();
						if(arraylen(mappedObj.getNumbers()) != 0)
							result.setPhoneNumber(mappedObj.getNumbers[1]);
						result.setMessage(mappedObj.getBody());
						return result;
					case "AddressBook":
						var result = new data.Contact(mappedObj.getNames()[1]);
						if(arraylen(mappedObj.getEmails()) != 0)
							result.setEmail(mappedObj.getEmails()[1]);
						result.setCompany(mappedObj.getOrg());
						if(arraylen(mappedObj.getAddresses()) != 0)
							result.setAddress(mappedObj.getAddresses()[1]);
						result.setTitle(mappedObj.getTitle());
						if(arraylen(mappedObj.getURLs()) != 0)
							result.setWebSite(mappedObj.getURLs()[1]);
						result.setmemo(mappedObj.getNote());
						if(arraylen(mappedObj.getPhoneNumbers()) != 0)
						result.setPhone(mappedObj.getPhoneNumbers()[1]);
						return result;
					case "EmailAddress":
						var result = new data.EmailMessage();
						result.settoAddresses([mappedobj.getEmailAddress()]);
						result.setsubject(mappedObj.getSubject());
						result.setBody(mappedObj.getBody());
						return result;
					case "Tel":
						return new data.Telephone(mappedObj.getNumber());
					case "URI":
						var result = new data.URL(mappedObj.getURI());
						result.setTitle(mappedObj.getTitle()); 
						return result;
					case "Calendar":
						var result = new data.CalendarEvent(mappedObj.getSummary());
						result.setdescription(mappedObj.getDescription());
						result.setLocation(mappedObj.getLocation());
						result.setStartDateTime(mappedObj.getStart());
						result.setEndDateTime(mappedObj.getEnd());
						return result;
					case "Text":
						return new data.Text(mappedObj.getText()); 
				}
			}
		}
		return result1;			
	}
	
}