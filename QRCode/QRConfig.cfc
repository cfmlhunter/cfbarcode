component name="QRConfig"
{
	Variables.BarCodeSiZe = "M";
	Variables.BarCodeValidValues = "S,M,L";
	Variables.ErrorCorrection = "L";
	Variables.ErrorCorrectionValues = "L,M,Q,H";
	Variables.charset = "UTF-8";
	Variables.MatrixToImageConfigClass = createObject("java","com.google.zxing.client.j2se.MatrixToImageConfig"); 
	variables.EncodeHintTypeClass = createObject("java","com.google.zxing.EncodeHintType");
	Variables.PixelOnColor = MatrixToImageConfigClass.BLACK;
	Variables.PixelOffColor = MatrixToImageConfigClass.WHITE;
	Variables.EncodingHits = createObject("java","java.util.HashMap").init();
	
	public QRConfig function init()
	{
		Variables.EncodingHits.put(EncodeHintTypeClass.ERROR_CORRECTION, Variables.ErrorCorrection);
		Variables.EncodingHits.put(EncodeHintTypeClass.CHARACTER_SET, Variables.charset);
		return this;
	}
	
	public String function getBarCodeSize()
	{
		return Variables.BarCodeSiZe;
	}
	
	public String function getErrorCorrection()
	{
		return Variables.ErrorCorrection;
	}
	
	public String function getCharset()
	{
		return Variables.charset;
	}
	
	public void function setBarCodeSize(required String barcodeSize)
	{
		if(ListcontainsNoCase(Variables.BarCodeValidValues,barcodeSize))
			Variables.BarCodeSiZe = barcodeSize;
	}
	
	public void function setErrorCorrection(required String errorCorrection)
	{
		if(listcontainsNoCase(Variables.ErrorCorrectionValues,errorCorrection)) {
			Variables.ErrorCorrection = errorCorrection;
			Variables.EncodingHits.put(EncodeHintTypeClass.ERROR_CORRECTION, Variables.ErrorCorrection);
		}
	}
	
	public void function setCharset(required String charset)
	{
		Variables.charset = charset;
		Variables.EncodingHits.put(EncodeHintTypeClass.CHARACTER_SET, Variables.charset);
	}
	
	public void function setImagePixelOnColor(required numeric onColor)
	{
		Variables.PixelOnColor = onColor;
	}
	
	public numeric function getImagePixelOnColor()
	{
		return Variables.PixelOnColor;
	}
	
	public numeric function getImagePixelOffColor()
	{
		return Variables.PixelOffColor;
	}
	
	public void function setImagePixelOffColor(required numeric offColor)
	{
		Variables.PixelOffColor = offColor;
	}
	
	package any function getMatrixToImageConfig()
	{
		return Variables.MatrixToImageConfigClass.init(Variables.PixelOnColor, Variables.PixelOffColor);
	}
	
	package any function getBarCodeFormat()
	{
		return createObject("java","com.google.zxing.BarcodeFormat").QR_CODE;
	}
	
	package any function getEncodingHints()
	{
		return Variables.encodingHits;
	}
	
	package numeric function getHeight()  
	{
		switch(Variables.BarCodeSiZe)
		{
			case "S":
				return 125;
			case "M":
				return 200;
			case "L":
				return 250;
		}

	}
	
	package numeric function getWidth()
	{
		return getHeight();
	}
}