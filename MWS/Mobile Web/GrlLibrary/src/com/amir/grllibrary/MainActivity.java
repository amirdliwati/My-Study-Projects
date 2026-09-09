package com.amir.grllibrary;






import java.util.ArrayList;
import java.util.List;
import android.app.Activity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;



public class MainActivity extends Activity {


	public String Userlogin ;
    public String  passlogin ;
	private String TAG = "PGGURU";
	private String celcius;
	public String signupnName ;
	public String signupPassword ;
	public String signupFname ;
	public String signupLname ;
	public String addauthorFname ;
	public String addauthorLastname ;
	public String addauthorCountry ;
	public String addauthorCity ;
	public String addauthorAddress ;
	public String addbookTitle ;
	public String addbookType ;
	public String addbookPrice ;
	public String addpublisherName ;
	public String addpublisherCity ;
	public String getpublisherName ;
	public String getauthor1Name ;
	public String getauthor2Name ;
    public String Booketails = "";
    public String sebookName_txt ;
    public String valuesp2 ;
    public String valuesp1 ;
    public String Idauthor ;
    public String Idpublisher ;
	public List<String> TextList = new ArrayList<String>();
	public List<String> ValueList = new ArrayList<String>();
	public List<String> list = new ArrayList<String>();
	public String Bookeswort ;
	public String getText1seauthor1 ;
	

	
	
	
    @Override
     protected void onCreate(Bundle savedInstanceState) 
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        
    }
    
 
     public void LoginClick(View e)

    {
        setContentView(R.layout.login);
    }
     
     public void showbookClick(View e)

     {
         setContentView(R.layout.showallbooks);
     }
     
     public void AdbookClick(View e)

     {
         setContentView(R.layout.addbook);
         AsyncCallGetallpublisher task = new AsyncCallGetallpublisher();
		  task.execute();
		  AsyncCallGetallauthor task2 = new AsyncCallGetallauthor();
		  task2.execute();
     }
     
     public void addpublisherClick(View e)

     {
         setContentView(R.layout.addpublisher);
     }
     
     public void addauthorClick(View e)

     {
         setContentView(R.layout.addauthor);
     }
     
     public void adminClick(View e)

     {
         setContentView(R.layout.admin);
     }
     
     public void userClick(View e)

     {
         setContentView(R.layout.user);
     }
     
     public void sebookClick(View e)
    {
        setContentView(R.layout.searchbook);
    }
     
     public void seauthor1Click(View e)
    {
        setContentView(R.layout.searchauthor1);
    }
     
     
     public void sepublisherClick(View e)
    {
        setContentView(R.layout.searchpublisher);
    }
     
     public void testClick(View e)
    {
        setContentView(R.layout.test);
    }
    
	 public void SignIn(View e)
     {
			
         EditText LoginName_txt = (EditText)findViewById(R.id.et1login);
         EditText Password_txt = (EditText)findViewById(R.id.et2login);
	     Userlogin = LoginName_txt.getText().toString();
		 passlogin = Password_txt.getText().toString();

		  AsyncCalllogin task = new AsyncCalllogin();
 		  task.execute();
   
     	
     }
	 
	 private class AsyncCalllogin extends AsyncTask<String, Void, Void> {
		 
		 
		 public String Userloginid ;
			@Override
			protected Void doInBackground(String... params) {
			   login log = new login();
			   Userloginid = log.getlogin(Userlogin,passlogin);
				
				return null;
			}

			@Override
			protected void onPostExecute(Void result) {
				TextView tv2 =(TextView)findViewById(R.id.textViewlogin);
				
				if (Integer.parseInt(Userloginid) == 0 )
				{tv2.setText("User Name Or Password Wrong");}
				else if (Integer.parseInt(Userloginid) == 1)
					{setContentView(R.layout.admin);}
				else 
				{setContentView(R.layout.user);}
				
				

			}

			@Override
			protected void onPreExecute() {
				
			}

			@Override
			protected void onProgressUpdate(Void... values) {
			}
		}

	 public void testconvert(View e)
	 { 
		 
		TextView tv = (TextView) findViewById(R.id.tv_result);
		EditText et;
		et = (EditText) findViewById(R.id.editTextconvert);

		 if (et.getText().length() != 0 && et.getText().toString() != "") {
				celcius = et.getText().toString();
				AsyncCalltest task = new AsyncCalltest();
				task.execute();
			} else {
				 tv.setText("Please enter Celcius");
			}
		 
		 
		 
	 }

	 private class AsyncCalltest extends AsyncTask<String, Void, Void> {

		 
			@Override
			protected Void doInBackground(String... params) {
				test ts = new test();
				Log.i(TAG, "doInBackground");
				ts.getFahrenheit(celcius);
				return null;
			}

			@Override
			protected void onPostExecute(Void result) {
				TextView tv = (TextView) findViewById(R.id.tv_result);
				test ts = new test();
				Log.i(TAG, "onPostExecute");
				tv.setText(ts.fahren + "° F");
			}

			@Override
			protected void onPreExecute() {
				TextView tv = (TextView) findViewById(R.id.tv_result);
				Log.i(TAG, "onPreExecute");
				tv.setText("Calculating...");
			}

			@Override
			protected void onProgressUpdate(Void... values) {
				Log.i(TAG, "onProgressUpdate");
			}

		}

	 public void signupClick(View e)

	    {
	        setContentView(R.layout.signup);
	    }
	  
     public void Signup (View v)
     { 
    	 EditText signupnName_txt = (EditText)findViewById(R.id.editText1signup);
         EditText signupPassword_txt = (EditText)findViewById(R.id.editText4signu);
         EditText signupFname_txt = (EditText)findViewById(R.id.editText2signup);
         EditText signupLname_txt = (EditText)findViewById(R.id.editText3signup);
         signupnName = signupnName_txt.getText().toString();
         signupPassword = signupPassword_txt.getText().toString();
         signupFname = signupFname_txt.getText().toString();
         signupLname = signupLname_txt.getText().toString();

         AsyncCallsignup task = new AsyncCallsignup();
 		  task.execute();

     }

     private class AsyncCallsignup extends AsyncTask<String, Void, Void> {
		 
    	TextView tv2 =(TextView)findViewById(R.id.textViewsignup);
		 public String Successfully ;
			@Override
			protected Void doInBackground(String... params) {
			   SignUp sin = new SignUp();
			   Successfully = sin.getsignup(signupnName, signupPassword, signupFname, signupLname);
				
				return null;
			}

			@Override
			protected void onPostExecute(Void result) {
				
				if(Integer.parseInt(Successfully) == 1)
				{
				
				tv2.setText("Successfully");
				}
				else
					{tv2.setText("Faild");}
			}

			@Override
			protected void onPreExecute() {
				
			}

			@Override
			protected void onProgressUpdate(Void... values) {
			}
		}



     public void Addbook(View v)
     {
    	 EditText addbookTitle_txt = (EditText)findViewById(R.id.editText1addbook);
         EditText addbookType_txt = (EditText)findViewById(R.id.editText2addbook);
         EditText addbookPrice_txt = (EditText)findViewById(R.id.editText10addbook);
         addbookTitle = addbookTitle_txt.getText().toString();
         addbookType = addbookType_txt.getText().toString();
         addbookPrice = addbookPrice_txt.getText().toString();


         AsyncCalladdbook task = new AsyncCalladdbook();
 		  task.execute();
    	 
     }
     
     private class AsyncCalladdbook extends AsyncTask<String, Void, Void> {
		 
      	TextView tv2 =(TextView)findViewById(R.id.textViewaddbook);
  		 public String Successfully1 ;
  			@Override
  			protected Void doInBackground(String... params) {
  			   AddBook sin = new AddBook();
  			   Successfully1 = sin.addbooks(addbookTitle, addbookType ,addbookPrice ,Idpublisher,Idauthor );
  				
  				return null;
  			}

  			@Override
  			protected void onPostExecute(Void result) {
  				
  				if(Integer.parseInt(Successfully1) > 0)
  				{
  				
  				tv2.setText("Successfully");
  				}
  				else
  					{tv2.setText("Faild");}
  			}

  			@Override
  			protected void onPreExecute() {
  				
  			}

  			@Override
  			protected void onProgressUpdate(Void... values) {
  			}
  		}

     public void Addauthor(View v)
     {
    	 EditText addauthorFname_txt = (EditText)findViewById(R.id.editText1addauthor);
         EditText addauthorLastname_txt = (EditText)findViewById(R.id.editText2addauthor);
         EditText addauthorCountry_txt = (EditText)findViewById(R.id.editText3addauthor);
         EditText addauthorCity_txt = (EditText)findViewById(R.id.editText4addauthor);
         EditText addauthorAddress_txt = (EditText)findViewById(R.id.editText5addauthor);
         addauthorFname = addauthorFname_txt.getText().toString();
         addauthorLastname = addauthorLastname_txt.getText().toString();
         addauthorCountry = addauthorCountry_txt.getText().toString();
         addauthorCity = addauthorCity_txt.getText().toString();
         addauthorAddress = addauthorAddress_txt.getText().toString();

         AsyncCalladdauthor task = new AsyncCalladdauthor();
 		  task.execute();
    	 
     }
     private class AsyncCalladdauthor extends AsyncTask<String, Void, Void> {
		 
     	TextView tv2 =(TextView)findViewById(R.id.textViewaddauthor);
 		 public String Successfully2 ;
 			@Override
 			protected Void doInBackground(String... params) {
 			   AddAuthor auth = new AddAuthor();
 			   Successfully2 = auth.addauthors(addauthorFname, addauthorLastname, addauthorCountry, addauthorCity , addauthorAddress);
 				
 				return null;
 			}

 			@Override
 			protected void onPostExecute(Void result) {
 				
 				if(Integer.parseInt(Successfully2) > 0)
 				{
 				
 				tv2.setText("Successfully");
 				}
 				else
 					{tv2.setText("Faild");}
 			}

 			@Override
 			protected void onPreExecute() {
 				
 			}

 			@Override
 			protected void onProgressUpdate(Void... values) {
 			}
 		}
     
     public void Addpublisher(View v)
     {
    	 EditText addpublisherName_txt = (EditText)findViewById(R.id.editText1addpublisher);
         EditText addpublisherCity_txt = (EditText)findViewById(R.id.editText2addpublisher);
         addpublisherName = addpublisherName_txt.getText().toString();
         addpublisherCity = addpublisherCity_txt.getText().toString();


         AsyncCalladdpublisher task = new AsyncCalladdpublisher();
 		  task.execute();
    	 
     }
     
     private class AsyncCalladdpublisher extends AsyncTask<String, Void, Void> {
		 
       	TextView tv3 =(TextView)findViewById(R.id.textViewaddpublisher);
   		 public String Successfully3 ;
   			@Override
   			protected Void doInBackground(String... params) {
   			   AddPublisher publis = new AddPublisher();
   			   Successfully3 = publis.addpublishers(addpublisherName, addpublisherCity);
   				
   				return null;
   			}

   			@Override
   			protected void onPostExecute(Void result) {
   				
   				if(Integer.parseInt(Successfully3) > 0)
   				{
   				
   				tv3.setText("Successfully");
   				}
   				else
   					{tv3.setText("Faild");}
   			}

   			@Override
   			protected void onPreExecute() {
   				
   			}

   			@Override
   			protected void onProgressUpdate(Void... values) {
   			}
   		}

     public void Getallbook(View v)
     {
    	 setContentView(R.layout.showallbooks);
		  AsyncCallgetallbook task = new AsyncCallgetallbook();
		  task.execute();
     }
     
     private class AsyncCallgetallbook extends AsyncTask<String, Void, Void> {
		 
    	 TextView tv3 =(TextView)findViewById(R.id.textView1namebook);
  		 public String Successfully3 ;
    			@Override
    			protected Void doInBackground(String... params) {
    				GetAllBook books = new GetAllBook();
    	  			   Successfully3 = books.GetAllBooks();
    				return null;
    			}

    			@Override
    			protected void onPostExecute(Void result) {
    				TextList.clear();
    				Successfully3 = Successfully3.replace("anyType{", "");
      				Successfully3 = Successfully3.replace("string=", "");
      				Successfully3 = Successfully3.replace("}", ""); 
      				String[] ArrItems = Successfully3.split(";");
      		    	
      		    	for(int i=0;i<ArrItems.length-1; i++)
      		    	{
      		    		
      		    		String[] ArrItem = ArrItems[i].split("@");
      		    		TextList.add(ArrItem[0]);
      		    	}
      		    	
      		    	final ListView lv = (ListView)findViewById(R.id.listView1);
      		    	ArrayAdapter<String> arrAdpt = new ArrayAdapter<String>(
      		    			MainActivity.this, 
      		                android.R.layout.simple_list_item_1,
      		                TextList );
      		    	lv.setOnItemClickListener(new android.widget.AdapterView.OnItemClickListener() {
      		    		public void onItemClick(AdapterView<?> parent, View view,int position, long id) 
      		    		{
      		    			
      		    			 Booketails = (String) lv.getItemAtPosition(position);
      		    			 Booketails = Booketails.replace(" ", "");
      		    			 tv3.setText(Booketails);
      		    			 BookDetails();                
      		            }
      		    		        });
      		    	lv.setAdapter(arrAdpt);
      		    	
      				
    			}

    			@Override
    			protected void onPreExecute() {
    				
    			}

    			@Override
    			protected void onProgressUpdate(Void... values) {
    			}
    		}
     
     

     public void BookDetails()
     {
    	 AsyncCalladdgetBookDetails task = new AsyncCalladdgetBookDetails();
		  task.execute();
     }
     
     private class AsyncCalladdgetBookDetails extends AsyncTask<String, Void, Void> {
		 
      	
    	 TextView tv3 =(TextView)findViewById(R.id.textView2sebook);
 		 public String Successfully3 ;
 			@Override
 			protected Void doInBackground(String... params) {
 				GetBook bookde = new GetBook();
 				Booketails = Booketails.replace(" ", "");
 			   Successfully3 = bookde.Getdebook(Booketails);
 				return null;
  			}

  			@Override
  			protected void onPostExecute(Void result) {
  				
  				Successfully3 = Successfully3.replace("anyType{", "");
 				Successfully3 = Successfully3.replace("string=", "");
 				Successfully3 = Successfully3.replace("}", "");
 				
 				//tv3.setText(TextList)  ;
  		    	tv3.setText(Successfully3);
  				
  			}

  			@Override
  			protected void onPreExecute() {
  				
  			}

  			@Override
  			protected void onProgressUpdate(Void... values) {
  			}
  		}
   

     
     private class AsyncCallGetallpublisher extends AsyncTask<String, Void, Void> {
    	  Spinner spinner2 = (Spinner) findViewById(R.id.spinner2);
    	 TextView tv3 =(TextView)findViewById(R.id.textViewaddbook);
  		 public String Successfully3 ;
    			@Override
    			protected Void doInBackground(String... params) {
    				GetAllPublisher publisher = new GetAllPublisher();
    	  			   Successfully3 = publisher.GetAllpublishers();
    				return null;
    			}

    			@Override
    			protected void onPostExecute(Void result) {
    				list.clear();
    				Successfully3 = Successfully3.replace("anyType{", "");
      				Successfully3 = Successfully3.replace("string=", "");
      				Successfully3 = Successfully3.replace("}", "");     		    	
      				String[] ArrItems = Successfully3.split(";");
      				
      				//tv3.setText(Successfully3);
      				
      		    	for(int i=0;i<ArrItems.length-1; i++)
      		    	{
      		    		String[] ArrItem = ArrItems[i].split("@");
      		    		list.add(ArrItem[0]);
      		    		
      		    	}
      		    	
      		    	
      		    	ArrayAdapter<String> arrAdpt2 = new ArrayAdapter<String>(
      		    			MainActivity.this, 
      		                android.R.layout.simple_spinner_item,
      		              list);
      		    	arrAdpt2.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
      		    	spinner2.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener() {

						@Override
						public void onItemSelected(AdapterView<?> arg0,
								View arg1, int position, long arg3) {
							
							 valuesp2 =  (String) spinner2.getItemAtPosition(position);
							 Getallpublisher();
			    			 //tv3.setText(valuesp2);
							
						}

						@Override
						public void onNothingSelected(AdapterView<?> arg0) {
							
							
						}
					} );
      		    	spinner2.setAdapter(arrAdpt2);
    			}

    			@Override
    			protected void onPreExecute() {
    				
    			}

    			@Override
    			protected void onProgressUpdate(Void... values) {
    			}
    			
    			
    		}
     public void Getallpublisher()
     {
    	 AsyncCalladdgetidpublisher tsk = new AsyncCalladdgetidpublisher();
    	 tsk.execute();
    	 
     }
     
     private class AsyncCalladdgetidpublisher extends AsyncTask<String, Void, Void> {
		 
       	
    	 
 		 public String Successfully3 ;
 			@Override
 			protected Void doInBackground(String... params) {
 				GetIdpublisher id = new GetIdpublisher();
 				valuesp2 = valuesp2.replace(" ", "");
 			   Successfully3 = id.GetIdpublishers(valuesp2);
 				return null;
  			}

  			@Override
  			protected void onPostExecute(Void result) {
  				
  				Successfully3 = Successfully3.replace("anyType{", "");
 				Successfully3 = Successfully3.replace("string=", "");
 				Successfully3 = Successfully3.replace("}", "");

 				Idpublisher = Successfully3 ;
  				
  			}

  			@Override
  			protected void onPreExecute() {
  				
  			}

  			@Override
  			protected void onProgressUpdate(Void... values) {
  			}
  		}

     private class AsyncCallGetallauthor extends AsyncTask<String, Void, Void> {
   	  Spinner spinner1 = (Spinner) findViewById(R.id.spinner1);
   	 TextView tv3 =(TextView)findViewById(R.id.textViewaddbook);
 		 public String Successfully3 ;
   			@Override
   			protected Void doInBackground(String... params) {
   				GetAllAuthor author = new GetAllAuthor();
   	  			   Successfully3 = author.GetAllauthors();
   				return null;
   			}

   			@Override
   			protected void onPostExecute(Void result) {
   				ValueList.clear();
   				Successfully3 = Successfully3.replace("anyType{", "");
     				Successfully3 = Successfully3.replace("string=", "");
     				Successfully3 = Successfully3.replace("}", "");     		    	
     				String[] ArrItems = Successfully3.split(";");
     				
     				
     				
     		    	for(int i=0;i<ArrItems.length-1; i++)
     		    	{
     		    		String[] ArrItem = ArrItems[i].split("@");
     		    		ValueList.add(ArrItem[0]);
     		    		
     		    	}
     		    	
     		    	
     		    	ArrayAdapter<String> arrAdpt1 = new ArrayAdapter<String>(
     		    			MainActivity.this, 
     		                android.R.layout.simple_spinner_item,
     		               ValueList);
     		    	arrAdpt1.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
     		    	spinner1.setOnItemSelectedListener(new android.widget.AdapterView.OnItemSelectedListener() {

						@Override
						public void onItemSelected(AdapterView<?> arg0,
								View arg1, int position, long arg3) {
							
							valuesp1 =  (String) spinner1.getItemAtPosition(position);
							Getallauthor();
			    			 
							
						}

						@Override
						public void onNothingSelected(AdapterView<?> arg0) {
							
							
						}
					} );

     		    	
     		    	spinner1.setAdapter(arrAdpt1);
   			}

   			@Override
   			protected void onPreExecute() {
   				
   			}

   			@Override
   			protected void onProgressUpdate(Void... values) {
   			}
   		}
     public void Getallauthor()
     {
    	 AsyncCalladdgetidauthor tsk = new AsyncCalladdgetidauthor();
    	 tsk.execute();
    	 
     }
     
     private class AsyncCalladdgetidauthor extends AsyncTask<String, Void, Void> {
		 
       	
    	 
 		 public String Successfully3 ;
 			@Override
 			protected Void doInBackground(String... params) {
 				GetIdauthor id = new GetIdauthor();
 				valuesp1 = valuesp1.replace(" ", "");
 			   Successfully3 = id.GetIdauthors(valuesp1);
 				return null;
  			}

  			@Override
  			protected void onPostExecute(Void result) {
  				
  				Successfully3 = Successfully3.replace("anyType{", "");
 				Successfully3 = Successfully3.replace("string=", "");
 				Successfully3 = Successfully3.replace("}", "");

 				Idauthor = Successfully3 ;
  				
  			}

  			@Override
  			protected void onPreExecute() {
  				
  			}

  			@Override
  			protected void onProgressUpdate(Void... values) {
  			}
     }

      
     public void searchauthor(View v)
     {
    	 EditText editText1seauthor1_txt = (EditText)findViewById(R.id.editText1seauthor1);
    	 getText1seauthor1 = editText1seauthor1_txt.getText().toString();
 

    	 AsyncCallgetlistauthor task = new AsyncCallgetlistauthor();
 		  task.execute();
     }
     
     
     private class AsyncCallgetlistauthor extends AsyncTask<String, Void, Void> {
		 
    	 
  		 public String Successfully3 ;
    			@Override
    			protected Void doInBackground(String... params) {
    				GetDetailsListAuthor listauthor = new GetDetailsListAuthor();
    	  			   Successfully3 = listauthor.GetDetailsListAuthors(getText1seauthor1);
    				return null;
    			}

    			@Override
    			protected void onPostExecute(Void result) {
    				TextList.clear();
    				Successfully3 = Successfully3.replace("anyType{", "");
      				Successfully3 = Successfully3.replace("string=", "");
      				Successfully3 = Successfully3.replace("}", ""); 
      				String[] ArrItems = Successfully3.split(";");
      		    	
      		    	for(int i=0;i<ArrItems.length-1; i++)
      		    	{
      		    		
      		    		String[] ArrItem = ArrItems[i].split("@");
      		    		TextList.add(ArrItem[0]);
      		    	}
      		    	
      		    	final ListView lv5 = (ListView)findViewById(R.id.listView4);
      		    	ArrayAdapter<String> arrAdpt = new ArrayAdapter<String>(
      		    			MainActivity.this, 
      		                android.R.layout.simple_list_item_1,
      		                TextList );
      		    	lv5.setOnItemClickListener(new android.widget.AdapterView.OnItemClickListener() {
      		    		public void onItemClick(AdapterView<?> parent, View view,int position, long id) 
      		    		{
      		    			
      		    			 Booketails = (String) lv5.getItemAtPosition(position);
      		    			 Booketails = Booketails.replace(" ", "");
      		    			searchauthor2();
      		    			                 
      		            }
      		    		        });
      		    	lv5.setAdapter(arrAdpt);
      		    	
      				
    			}

    			@Override
    			protected void onPreExecute() {
    				
    			}

    			@Override
    			protected void onProgressUpdate(Void... values) {
    			}
    		}
   
  
     public void searchauthor2()
     {
    	 AsyncCalladdgetauthor task = new AsyncCalladdgetauthor();
		  task.execute(); 
     }

     private class AsyncCalladdgetauthor extends AsyncTask<String, Void, Void> {
 		 
      	TextView tv3 =(TextView)findViewById(R.id.textView3seauthor1);
  		 public String Successfully3 ;
  			@Override
  			protected Void doInBackground(String... params) {
  				GetAuthor1 authorlist = new GetAuthor1();
  			   Successfully3 = authorlist.GetAuthorbook(Booketails);
  				
  				return null;
  			}

  			@Override
  			protected void onPostExecute(Void result) {
  				
  				Successfully3 = Successfully3.replace("anyType{", "");
  				Successfully3 = Successfully3.replace("string=", "");
  				Successfully3 = Successfully3.replace("}", "");
  				Successfully3 = Successfully3.replace("@", " ");
  				tv3.setText(Successfully3);
  				
  			}

  			@Override
  			protected void onPreExecute() {
  				
  			}

  			@Override
  			protected void onProgressUpdate(Void... values) {
  			}
  		}
     
     
      public void searpublisher(View v)
      {
     	 EditText getpublisherName_txt = (EditText)findViewById(R.id.editText1sePublisher);
     	 getpublisherName = getpublisherName_txt.getText().toString();
  

     	AsyncCallgetlistpublisher task = new AsyncCallgetlistpublisher();
  		  task.execute();
      }
      
      
      private class AsyncCallgetlistpublisher extends AsyncTask<String, Void, Void> {
 		 
     	 
   		 public String Successfully3 ;
     			@Override
     			protected Void doInBackground(String... params) {
     				GetDetailsListPublisher listpub = new GetDetailsListPublisher();
     	  			   Successfully3 = listpub.GetDetailsListPublishers(getpublisherName);
     				return null;
     			}

     			@Override
     			protected void onPostExecute(Void result) {
     				TextList.clear();
     				Successfully3 = Successfully3.replace("anyType{", "");
       				Successfully3 = Successfully3.replace("string=", "");
       				Successfully3 = Successfully3.replace("}", ""); 
       				String[] ArrItems = Successfully3.split(";");
       		    	
       		    	for(int i=0;i<ArrItems.length-1; i++)
       		    	{
       		    		
       		    		String[] ArrItem = ArrItems[i].split("@");
       		    		TextList.add(ArrItem[0]);
       		    	}
       		    	
       		    	final ListView lv5 = (ListView)findViewById(R.id.listView5);
       		    	ArrayAdapter<String> arrAdpt = new ArrayAdapter<String>(
       		    			MainActivity.this, 
       		                android.R.layout.simple_list_item_1,
       		                TextList );
       		    	lv5.setOnItemClickListener(new android.widget.AdapterView.OnItemClickListener() {
       		    		public void onItemClick(AdapterView<?> parent, View view,int position, long id) 
       		    		{
       		    			
       		    			 Booketails = (String) lv5.getItemAtPosition(position);
       		    			 Booketails = Booketails.replace(" ", "");
       		    			searpublisher2();                 
       		            }
       		    		        });
       		    	lv5.setAdapter(arrAdpt);
       		    	
       				
     			}

     			@Override
     			protected void onPreExecute() {
     				
     			}

     			@Override
     			protected void onProgressUpdate(Void... values) {
     			}
     		}
      
      public void searpublisher2()   
      {
    	  
    	  AsyncCalladdgetpublisher task = new AsyncCalladdgetpublisher();
  		  task.execute(); 
    	  
      }
      
      
      
      private class AsyncCalladdgetpublisher extends AsyncTask<String, Void, Void> {
 		 
         	TextView tv3 =(TextView)findViewById(R.id.textView3sepublisher);
     		 public String Successfully3 ;
     			@Override
     			protected Void doInBackground(String... params) {
     			   GetPublisher publisg = new GetPublisher();
     			   Successfully3 = publisg.GetPublisherbook(Booketails);
     				
     				return null;
     			}

     			@Override
     			protected void onPostExecute(Void result) {
     				
     				Successfully3 = Successfully3.replace("anyType{", "");
     				Successfully3 = Successfully3.replace("string=", "");
     				Successfully3 = Successfully3.replace("}", "");
     				Successfully3 = Successfully3.replace("@", " ");
     				tv3.setText(Successfully3);
     				
     			}

     			@Override
     			protected void onPreExecute() {
     				
     			}

     			@Override
     			protected void onProgressUpdate(Void... values) {
     			}
     		}

      
      public void searchbook(View v)
      {
     	 EditText sebook1Name_txt = (EditText)findViewById(R.id.editText1sebook);
     	 sebookName_txt = sebook1Name_txt.getText().toString();
     	AsyncCallgetlisbook task = new AsyncCallgetlisbook();
 		  task.execute();
      }
      
      private class AsyncCallgetlisbook extends AsyncTask<String, Void, Void> {
  		 
      	 
   		 public String Successfully3 ;
     			@Override
     			protected Void doInBackground(String... params) {
     				GetDetailsListBookByTitle listbook = new GetDetailsListBookByTitle();
     	  			   Successfully3 = listbook.GetDetailsListBookByTitles(sebookName_txt);
     				return null;
     			}

     			@Override
     			protected void onPostExecute(Void result) {
     				TextList.clear();
     				Successfully3 = Successfully3.replace("anyType{", "");
       				Successfully3 = Successfully3.replace("string=", "");
       				Successfully3 = Successfully3.replace("}", ""); 
       				String[] ArrItems = Successfully3.split(";");
       		    	
       		    	
       		    	for(int i=0;i<ArrItems.length-1; i++)
       		    	{
       		    		
       		    		String[] ArrItem = ArrItems[i].split("@");
       		    		TextList.add(ArrItem[0]);
       		    	}
       		    	
       		    	
       		    	final ListView lv5 = (ListView)findViewById(R.id.listView2);
       		    	ArrayAdapter<String> arrAdpt = new ArrayAdapter<String>(
       		    			MainActivity.this, 
       		                android.R.layout.simple_list_item_1,
       		                TextList );
       		    	lv5.setOnItemClickListener(new android.widget.AdapterView.OnItemClickListener() {
       		    		public void onItemClick(AdapterView<?> parent, View view,int position, long id) 
       		    		{
       		    			
       		    			 Booketails = (String) lv5.getItemAtPosition(position);
       		    			 Booketails = Booketails.replace(" ", "");
       		    			searchbook2();                 
       		            }
       		    		        });
       		    	lv5.setAdapter(arrAdpt);
       		    	
       				
     			}

     			@Override
     			protected void onPreExecute() {
     				
     			}

     			@Override
     			protected void onProgressUpdate(Void... values) {
     			}
     		}
      
      public void searchbook2()
      
      {
    	  AsyncCallsebook task = new AsyncCallsebook();
 		  task.execute();
      
      }
      
      
      private class AsyncCallsebook extends AsyncTask<String, Void, Void> {
 		 
       	
   		 public String Successfully3 ;
   			@Override
   			protected Void doInBackground(String... params) {
   			   GetBook getbookde1 = new GetBook();
   			   Successfully3 = getbookde1.Getdebook(Booketails);
   				
   				return null;
   			}

   			@Override
   			protected void onPostExecute(Void result) {
   				list.clear();
   				Successfully3 = Successfully3.replace("anyType{", "");
   				Successfully3 = Successfully3.replace("string=", "");
   				Successfully3 = Successfully3.replace("}", "");
   		    	
   				String[] ArrItems = Successfully3.split("@");
   		    	
   		    	for(int i=0;i<ArrItems.length-1; i++)
   		    	{
   		    		
   		    		String[] ArrItem = ArrItems[i].split("@");
   		    		list.add(ArrItem[0]);
   		    	}
   		    	
   		    	final ListView lv3 = (ListView)findViewById(R.id.listView3);
   		    	ArrayAdapter<String> arrAdpt3 = new ArrayAdapter<String>(
   		    			MainActivity.this, 
   		                android.R.layout.simple_list_item_1,
   		                list );
   		    	lv3.setAdapter(arrAdpt3);
   				
   			}

   			@Override
   			protected void onPreExecute() {
   				
   			}

   			@Override
   			protected void onProgressUpdate(Void... values) {
   			}
   		}
      
      
}


