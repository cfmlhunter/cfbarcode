<cfscript>
	if(isDefined("form.submit"))
	{
		if(structkeyexists(form,"fullname"))
		{
			fieldNames = ["company","title","phone","email","address","website","memo"];
			for(index = 1; index LTE Arraylen(fieldNames);index++)
			{
				if(NOT structkeyExists(form,fieldNames[index]))
					form[fieldNames[index]] = "";
			}
			contact = new data.Contact(form.fullname);
			contact.setCompany(form.company);
			contact.setAddress(form.address);
			contact.setwebSite(form.website);
			contact.setemail(form.email);
			contact.setmemo(form.memo);
			contact.setTitle(form.title);
			contact.setphone(form.phone);
			writeoutput("Raw String encoded: " & contact.toString());
			config = new QRConfig();
			config.setBarCodeSize("L");
			writer = new QRCodeWriter(config);  
			imageTempPath = expandPath("contact.png");
			writer.toFileFromAny(contact,imageTempPath, true);
			cfimage ( action="writeToBrowser" ,source=imagetempPath  );
		}
	}
</cfscript>
<html>
	<head>
		<title>
			QR Code Generate Contact
		</title>		
	</head>
	<body>
		<h1>Contact QR Encoder</h1>
		<form method="post" action="">
			<table>
			<tr>
			<td>Full Name: </td><td><input type="text" name="fullname" autocomplete="on" required="true"></td>
			</tr>
			<tr>
			<td>Organization:</td><td><input type="text" name="company" autocomplete="on"></td>
			</tr>
			<tr>
			<td>Title:</td><td><input type="text" name="title" autocomplete="on"></td>
			</tr>
			<tr>
			<td>Phone Number:</td><td><input type="tel" name="phone" autocomplete="on"></td>
			</tr>
			<tr>
			<td>Email:</td><td><input type="email" name="email" autocomplete="on"></td>
			</tr>
			<tr>
			<td>Address:</td><td><input type="text" name="address" autocomplete="on"></td>
			</tr>
			<tr>
			<td>Website:</td><td><input type="url" name="website"></td>
			</tr>
			<tr>
			<td>Memo:</td><td><input type="text" name="memo"></td>
			</tr>
			<tr><td colspan="2">
			<input type="submit" name="submit"></td>
			</tr>
			</table>
		</form>
	</body>
</html>