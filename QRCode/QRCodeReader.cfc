component displayname="QR Code Reader or Detector"  
{
	
	public QRCodeReader function init()
	{
		var metaData = getComponentMetaData("QRCodeReader");
		if(!structkeyexists(metadata,"parsers"))
		{
			lock name="metadata.parsers" timeout="10"{
				var parsersArray = Arraynew(1);				
				arrayappend(parsersArray,createobject("java","com.google.zxing.client.result.WifiResultParser").init());
				arrayappend(parsersArray,createobject("java","com.google.zxing.client.result.VCardResultParser").init());
				arrayappend(parsersArray,createobject("java","com.google.zxing.client.result.GeoResultParser").init());
				arrayappend(parsersArray,createobject("java","com.google.zxing.client.result.TelResultParser").init());
				arrayappend(parsersArray,createobject("java","com.google.zxing.client.result.BizcardResultParser").init());
			} 
		}
		return this;
	}
	
	public any function readQRCodeFromImage(required string path)
	{
		var givenImage =  imageread(path);
		var results = getresults(givenImage);
		var resultsArray = ArrayNew(1);
		/*for(index = 1; index LTE Len(results); index++)
		{
			var result = results[index];
			if(Result.getBarcodeFormat() == createObject("java","com.google.zxing.BarcodeFormat").QR_CODE)
			{
				// Parse for results
			}
		}*/
		return results[1];
	}
	
	private any function getResults(required any givenImage)
	{
		var bufferedImage = givenImage.getCurrentImage();
		var lumianceSource  = createobject("java","com.google.zxing.client.j2se.BufferedImageLuminanceSource").init(bufferedimage);
		var binarizer = createobject("java","com.google.zxing.common.HybridBinarizer").init(lumianceSource);
		var binaryBitMap = createobject("java","com.google.zxing.BinaryBitmap").init(binarizer);
		var reader =  createobject("java","com.google.zxing.multi.qrcode.QRCodeMultiReader").init();
		return reader.decodeMultiple(binarybitMap);
	}
}