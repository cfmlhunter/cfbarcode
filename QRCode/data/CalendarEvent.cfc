component name="CalendarEvent" displayname="Calendar Event" 
{
	Variables.DateStart = "";
	Variables.DateEnd = "";
	Variables.location  = "";
	Variables.description = "";
	Variables.AllDayEvent = false;
	
	public CalendarEvent function init(required String eventName)
	{
		Variables.eventTitle = eventName;
		return this;
	}
	
	public string function getEventName()
	{
		return Variables.eventTitle;
	}
	
	public string function getLocation()
	{
		return Variables.location;
	}
	
	public void function setLocation(required string location)
	{
		Variables.location = location;
	}
	
	public string function getDescription()
	{
		return Variables.description;
	}
	
	public void function setDescription(required string description)
	{
		Variables.description = description;
	}
	
	public void function setStartDateTime(required date startDate)
	{
		
		Variables.DateStart = startDate;
	}
	
	public void function setEndDateTime(required date endDate)
	{
		Variables.DateEnd = endDate;
	}
	
	public date function getStartDateTime()
	{
		return Variables.DateStart;
	} 
	
	public date function getEndDateTime()
	{
		return Variables.DateEnd;
	}
	
	public boolean function getAllDayEvent()
	{
		return Variables.AllDayEvent;
	}
	
	public void function setAllDayEvent(required boolean allDay)
	{
		Variables.AllDayEvent = allDay;		
	}
	
	public string function toString()
	{
		var qrString = getprefix() &  "#chr(10)#SUMMARY:#Variables.eventTitle##chr(10)#";
		if(Len(Variables.DateStart))
		{			
			if(Variables.AllDayEvent)
				qrString &= "DTSTART;VALUE=DATE:#year(Variables.DateStart)##month(Variables.DateStart)##day(Variables.DateStart)##chr(10)#";
			else
				qrString &= "DTSTART:";
		}
		
		if(Len(Variables.DateEnd))
			qrString &= "DTEND:#Variables.DateStart#Z#chr(10)#";	
		if(Len(Variables.location))
			qrString &= "LOCATION:#Variables.location##chr(10)#";
		if(Len(variables.description))
			qrString &= "DESCRIPTION:#variables.description##chr(10)#";
		qrString &= "END:VEVENT";
		return qrstring;
	}
	
	private string function getDate(required date inputdate)
	{
		
	}	
	
	public string function getType()
	{
		return "CALEVENT";
	}
	
	public string function getPrefix()
	{
		return "BEGIN:VEVENT";
	}
}