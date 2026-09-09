package com.amir.grllibrary;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

public class AddBook 
{
	public  final String SOAP_ACTION = "http://tempuri.org/AddBook";
    public  final String NAMESPACE = "http://tempuri.org/";
    public  final String METHOD_NAME = "AddBook";
    public  final String URL = "http://mohamedamir-001-site1.smarterasp.net/service1.asmx";
    
   
    public String UserIdsign ;
    public AddBook(){}

	
	public String addbooks(String Title , String Type , String Price, String pubId, String AuthorId)
	{
		SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME);
		
		PropertyInfo prinfo = new PropertyInfo();
		prinfo = new PropertyInfo();
		prinfo.setName("Title");
		prinfo.setValue(Title);
		prinfo.setType(String.class);
		request.addProperty(prinfo);
		
		prinfo = new PropertyInfo();
		prinfo.setName("Type");
		prinfo.setValue(Type);
		prinfo.setType(String.class);
		request.addProperty(prinfo);
		
		prinfo = new PropertyInfo();
		prinfo.setName("Price");
		prinfo.setValue(Price);
		prinfo.setType(String.class);
		request.addProperty(prinfo);
		
		prinfo = new PropertyInfo();
		prinfo.setName("pubId");
		prinfo.setValue(pubId);
		prinfo.setType(String.class);
		request.addProperty(prinfo);
		
		prinfo = new PropertyInfo();
		prinfo.setName("AuthorId");
		prinfo.setValue(AuthorId);
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
