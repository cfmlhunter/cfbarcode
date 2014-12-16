component displayname="QR Code Reader or Detector"  
{

	public array function readQRCodeFromImage(required string path) output="true" 
	{
		var givenImage =  imageread(path);
		var results = getresults(givenImage);

		var resultsArray = ArrayNew(1);
		var mapper = new mapper.ResultMapper(); 
		for(var index = 1; index LTE ArrayLen(results); index++)
		{
			var result = results[index];
			if(Result.getBarcodeFormat() == createObject("java","com.google.zxing.BarcodeFormat").QR_CODE)
			{
				// Parse for results
				var parsedResult = createObject("java","com.google.zxing.client.result.ResultParser").parseResult(result);
				try
				{
					var mappedResult = mapper.map(parsedResult);
					arrayappend(resultsArray,mappedResult);
				}
				catch(any e)
				{
					writedump(e);
					arrayappend(resultsArray,new data.Text(result.getText()));
				}
			}
		}
		return resultsArray;
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