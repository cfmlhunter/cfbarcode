component  displayname="QR Code Writer"
{	
	Variables.MatrixToImageWriterClass = createobject("java","com.google.zxing.client.j2se.MatrixToImageWriter");
	
	public QRCodeWriter function init(QRConfig qrConfig)
	{
		if(NOT isNull(arguments.qrConfig))
			Variables.qrConfig = qrConfig;
		else
			Variables.qrConfig = new QRConfig();
		return this; 
	}	
		
	private String function getText(required String text)
	{
		var result = text;
		
		if(isvalid("email", text))
			result = "mailto:#email#";
		else if(isvalid("telephone", text))
			result = "tel:#phonenumber#";
	}
	
	public any function toImageFromText(required String text)
	{	
		return toImage(getText(text));	
	}
	
	public any function toImageFromAny(required any object)
	{
		return toImage(object.toString());
	}
	
	public void function toFileFromText(required String text, required string destination, boolean overwrite = false)
	{
		toFile(getText(text), destination, overwrite);
	}	
	
	public void function toFileFromAny(required any object, required string destination, boolean overwrite = false)
	{
		toFile(object.toString(), destination, overwrite);
	}
	
	private any function toImage(required String text)
	{
		var bitMatrix = getBitMatrix(text);
		var bufferedImage = Variables.MatrixToImageWriterClass.toBufferedImage(bitmatrix, Variables.qrConfig.getMatrixToImageConfig());
		// HACK return coldfusion image object so that it can be used with CF image operations
		return createObject("java","coldfusion.image.Image").init(bufferedimage);
	}
	
	private void function toFile(required String text, required String filePath, boolean overwrite = false)
	{
		var image = toimage(text);
		Imagewrite(image, filePath, 1.0, overwrite);		
	}
	
	private any function getBitMatrix(required String text)   
	{
		var writer = createObject("java","com.google.zxing.qrcode.QRCodeWriter").init();
		var config = Variables.qrConfig;
		return writer.encode(text, config.getBarCodeFormat(), config.getWidth(), config.getHeight());
	}
}