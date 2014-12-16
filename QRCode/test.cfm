<cfscript>
	import data.*;
	contact = new Contact("Pavan Kumar Sannisetty");
	contact.setCompany("Adobe Systems India Private Limited");
	contact.setEmail("sanniset@adobe.com");
	contact.setEncoding("mecard");
	contact.setMemo("This is my business contact");
	contact.setTitle("Computer Scientist");
	contact.setWebSite("http://cfpavankumar.blogspot.in"); 
	contact.setAddress("##5 Salarpuria Infinity, Bhannerghetta Road, Bangalore - 560029");
	contact.setAddress("##5 Salarpuria Infinity");
	writeoutput(contact.toString() & "<br/>");
	
	
	sms = new SMS();
	//sms.setMessage("This is pavan kumar");
	sms.setPhoneNumber("+91 7760269 545");
	writeoutput(sms.toString() & "<br/>");
	
	config = new qrConfig();
	config.setBarCodeSize("L");
	writer = new qrCodeWriter(config);
	filePath = expandpath("test.png");
	qrImage =  writer.toFileFromAny(CONTACT, filePath , true); 
	cfimage ( action="writeToBrowser" ,source="#filepath#"  );
	
	wifi = new WifiNetWork("Phidel");
	//wifi.setAuthScheme("NOPASS");
	wifi.setVisible(true);
	wifi.setWifiPassword("C0mmunic@te1t");
	wifi.setAuthScheme("WEP");
	writeoutput(wifi.toString());
	
	image =  writer.toimageFromAny(wifi);
	imagewrite(image, expandpath("wifi.png"), 1.0, true);
	cfimage ( action="writeToBrowser" ,source="#expandpath('wifi.png')#"  );
	
	emailMessage = new EmailMessage();
	emailmessage.setToAddresses(["pavan@pavan.com"]);
	emailmessage.setCcAddresses(["pavan@pavan.com"]);
	emailmessage.setBccAddresses(["pavan@pavan.com"]);
	emailmessage.setsubject("subject");
	emailmessage.setbody("sdivnskf sdnlskds soijfslekfs slkisvlsnvl skdnvksd cskncks cskd cancl dsclaeileldke clc slnlcs dcsdnclsdclksamdcl dcljanclad c adcljandcla dcla dcla dcla dc adlc ald clda cla dclda cladsafwpoekfpsmflskmlsmlcdsmlkcmdslk slnsdncs clsdncks dlcsdcskd cjs cj sdjcs dc sdk kd sk sndvksnv skc sdkc sdk cskd cks dk csdk skcd sk dcksd ck dskc dskc dsk csknd cksd ck dsck ds cknds c dcn dsknc dsn cknds cds cds knc sdc sdn cns dc sdc dsk  sjkncsd kc sdk cskd ckns dknc dsnc dsn cknds cn dnc dskn cns d csd cnds shbcksd kcs dkncs dnc sd c ke kfwneofmead qlwdla clsd cjsd vfs vsrjifwjrlf rs rwlf wlr lwmr flmr flmw flmw fm wlf wlm flmw eflmw emf wem fwlme flmwe flmwe flmew flmwe flm ewfm welmfew lmf wel kjsdnks d sdk skdbcs dcs dckns c sd cnda cnd cnds cnds nc ");
	writer = new qrCodeWriter(config);
	writeoutput(emailmessage.toMATMSGString());
	filePath = expandpath("test1.png");
	qrImage =  writer.toFileFromAny(emailmessage.toMATMSGString(), filePath , true); 
	cfimage ( action="writeToBrowser" ,source="#filepath#"  );
	
	 reader = new QRcodeReader();
	 result = reader.readQRCodeFromImage(expandpath("wifi.png"));
	 writedump(result.toString());
	
</cfscript>