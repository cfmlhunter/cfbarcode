<cfscript>
	if(structkeyExists(form,"submit"))
	{
		if(structkeyExists(form,"qrurl"))
		{
			reader = new qrcodeReader();
			resultArray =  reader.readQRCodeFromImage(form.qrurl); 
			if(arraylen(resultArray) == 0)
				writeOutput("No QR Code found");			
			writeresults(resultArray);
		}
		else if(structkeyExists(form,"qrfile"))
		{
			reader = new qrCodeReader();
			random = rand("CFMX_COMPAT" );
			imagePath = expandPath("decode#random#.png");
			fileupload(imagepath, "qrfile"); 
			resultArray =  reader.readQRCodeFromImage(imagepath); 
			if(arraylen(resultArray) == 0)
				writeOutput("No QR Code found");
				writeresults(resultArray);
		}
	}
	
	function writeResults(array results) output="true" 
	{
		for(var index = 1; index LTE arraylen(results); index++)
		{
			writedump(results[index].getDisplayResult());
		}
	}
</cfscript>
<html>
	<head>
		<title>QR Code Decoder</title>
	</head>
	<body>
		<h1>Decode QR Code</h1>
		<form method="post" action="">
			QR Code from URL: <input type="url" name="qrurl" autocomplete="on"><br/><br/>
			QR Code from File: <input type="file" name="qrfile"><br/><br/>
			<input type="submit" name="submit">
		</form>
	</body>
</html>