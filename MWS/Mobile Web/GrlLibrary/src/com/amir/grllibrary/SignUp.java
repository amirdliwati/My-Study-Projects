package com.amir.grllibrary;

import org.ksoap2.SoapEnvelope;
import org.ksoap2.serialization.PropertyInfo;
import org.ksoap2.serialization.SoapObject;
import org.ksoap2.serialization.SoapSerializationEnvelope;
import org.ksoap2.transport.HttpTransportSE;

public class SignUp 
{
	public  final String SOAP_ACTION = "http://tempuri.org/signup";
    public  final String NAMESPACE = "http://tempuri.org/";
    public  final String METHOD_NAME = "signup";
    public  final String URL = "http://mohamedamir-001-site1.smarterasp.net/service1.asmx";
    
   
    public SignUp(){}

	
	public String getsignup(String Username , String password , String FName , String LName)
	{
		SoapObject request = new SoapObject(NAMESPACE, METHOD_NAME);
		
		PropertyInfo prinfo = new PropertyInfo();
		prinfo = new PropertyInfo();
		prinfo.setName("Username");
		prinfo.setValue(Username);
		prinfo.setType(String.class);
		request.addProperty(prinfo);
		
		prinfo = new PropertyInfo();
		prinfo.setName("password");
		prinfo.setValue(password);
		prinfo.setType(String.class);
		request.addProperty(prinfo);
		
		prinfo = new PropertyInfo();
		prinfo.setName("FName");
		prinfo.setValue(FName);
		prinfo.setType(String.class);
		request.addProperty(prinfo);
		
		prinfo = new PropertyInfo();
		prinfo.setName("LName");
		prinfo.setValue(LName);
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
