
package bustracking.model;

import java.net.*;

public class MessageSender {

        public static void sendMessage(String recipient,String Message) {
                try {
                        
                        String username = "apitbpdemo";
                        String password = "del12345@12";
                       
                        System.out.print(username);
                        System.out.println(password);
                        System.out.println(recipient);
                        System.out.println(Message);
                        Message=Message.replace(" ", "%20");
                        String requestUrl  = "http://203.212.70.200/smpp/sendsms?username="+username+"&password="+password+"&to="+recipient+"&from=track&text="+Message+"";

                        URL url = new URL(requestUrl);
                   
                        
                        HttpURLConnection uc = (HttpURLConnection)url.openConnection();

                        System.out.println(uc.getResponseMessage());

                        uc.disconnect();

                } catch(Exception ex) {
                        System.out.println(ex.getMessage());

                }
        }

}