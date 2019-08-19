package s;
import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
public class SendSms {
	public static void main(String[] args)
    {
    //Your user name
    String username = "BVRITH";
    //Your authentication key
    String authkey = "258f8ca44bXX";
    //Multiple mobiles numbers separated by comma (max 200)
    String mobiles = "+919989803310";
    //Sender ID,While using route4 sender id should be 6 characters long.
    String senderId = "BVRITH";
    //Your message to send, Add URL encoding here.
    String message = "Test message2";
    //define route
    String accusage="1";

    //Prepare Url
    URLConnection myURLConnection=null;
    URL myURL=null;
    BufferedReader reader=null;

    //encoding message
    String encoded_message=URLEncoder.encode(message);

    //Send SMS API
    String mainUrl="http://www.webprossms.webprosindia.com/submitsms.jsp?";

    //Prepare parameter string
    StringBuilder sbPostData= new StringBuilder(mainUrl);
    sbPostData.append("user="+username);
    sbPostData.append("&key="+authkey);
    sbPostData.append("&mobile="+mobiles);
    sbPostData.append("&message="+encoded_message);
    sbPostData.append("&accusage="+accusage);
    sbPostData.append("&senderid="+senderId);

    //final string
    mainUrl = sbPostData.toString();
    try
    {
    //prepare connection
    myURL = new URL(mainUrl);
    myURLConnection = myURL.openConnection();
    myURLConnection.connect();
    reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
    //reading response
    String response;
    while ((response = reader.readLine()) != null)
    //print response
    System.out.println(response);
   
    //finally close connection
    reader.close(); 
    System.out.println("success");
    }
    catch (Exception e)
    {
    e.printStackTrace();
    }
    }
}
