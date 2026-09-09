package com.amir.grllibrary;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapPrimitive;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

public class test 
{
	private final String NAMESPACE = "http://www.w3schools.com/webservices/";
	private final String URL = "http://www.w3schools.com/webservices/tempconvert.asmx";
	private final String SOAP_ACTION = "http://www.w3schools.com/webservices/CelsiusToFahrenheit";
	private final String METHOD_NAME = "CelsiusToFahrenheit";
	public  String fahren;
	public void getFahrenheit(String celsius) 
	{

		SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME);
		PropertyInfo celsiusPI = new PropertyInfo();
		celsiusPI.setName("Celsius");
		celsiusPI.setValue(celsius);
		celsiusPI.setType(double.class);
		request.addProperty(celsiusPI);
		SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(
				SoapEnvelope.VER11);
		envelope.dotNet = true;
		envelope.setOutputSoapObject(request);
		HttpTransportSE androidHttpTransport = new HttpTransportSE(URL);

		try {
			androidHttpTransport.call(SOAP_ACTION, envelope);
			SoapPrimitive response = (SoapPrimitive) envelope.getResponse();
			fahren = response.toString();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
