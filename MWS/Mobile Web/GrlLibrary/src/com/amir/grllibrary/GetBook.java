package com.amir.grllibrary;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

public class GetBook 
{
	public  final String SOAP_ACTION = "http://tempuri.org/GetDetailsBookByTitle";
    public  final String NAMESPACE = "http://tempuri.org/";
    public  final String METHOD_NAME = "GetDetailsBookByTitle";
    public  final String URL = "http://mohamedamir-001-site1.smarterasp.net/service1.asmx";
    
   
    public GetBook(){}

	
	public String Getdebook(String Title)
	{
		SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME);
		
		PropertyInfo prinfo = new PropertyInfo();
		prinfo = new PropertyInfo();
		prinfo.setName("Title");
		prinfo.setValue(Title);
		prinfo.setType(String.class);
		request.addProperty(prinfo);
	

		SoapSerializationEnvelope envelope = new SoapSerializationEnvelope(SoapEnvelope.VER11);
		envelope.dotNet = true;
		envelope.setOutputSoapObject(request);
		HttpTransportSE androidHttpTransport = new HttpTransportSE(URL);
	

		Object response = null;
		try {

			androidHttpTransport.call(SOAP_ACTION, envelope);
			response  =  envelope.getResponse();
			
		   
		     } 
		catch (Exception e) 
		{
			response=e.toString();
		}
		
	
	return	response.toString();
		 
		 
	}
}
