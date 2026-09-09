package com.amir.grllibrary;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

public class AddAuthor 
{
	public  final String SOAP_ACTION = "http://tempuri.org/AddAuthor";
    public  final String NAMESPACE = "http://tempuri.org/";
    public  final String METHOD_NAME = "AddAuthor";
    public  final String URL = "http://mohamedamir-001-site1.smarterasp.net/service1.asmx";
    
   
    public String UserIdsign ;
    public AddAuthor(){}

	
	public String addauthors(String FName , String LName , String Country , String City , String Address)
	{
		SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME);
		
		PropertyInfo prinfo = new PropertyInfo();
		prinfo = new PropertyInfo();
		prinfo.setName("Fname");
		prinfo.setValue(FName);
		prinfo.setType(String.class);
		request.addProperty(prinfo);
		
		prinfo = new PropertyInfo();
		prinfo.setName("Lname");
		prinfo.setValue(LName);
		prinfo.setType(String.class);
		request.addProperty(prinfo);
		
		prinfo = new PropertyInfo();
		prinfo.setName("Country");
		prinfo.setValue(Country);
		prinfo.setType(String.class);
		request.addProperty(prinfo);
		
		prinfo = new PropertyInfo();
		prinfo.setName("City");
		prinfo.setValue(City);
		prinfo.setType(String.class);
		request.addProperty(prinfo);
		
		prinfo = new PropertyInfo();
		prinfo.setName("Address");
		prinfo.setValue(Address);
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
