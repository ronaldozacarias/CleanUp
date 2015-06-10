package br.com.cleanUp.util;

import java.io.IOException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
 
public class Util {
    /**
     * Null check Method
     * 
     * @param txt
     * @return
     */
    public static boolean isNotNull(String txt) {
        // System.out.println("Inside isNotNull");
        return txt != null && txt.trim().length() >= 0 ? true : false;
    }
 
    /**
     * Method to construct JSON
     * 
     * @param tag
     * @param status
     * @return
     */
    public static String constructJSON(String tag, boolean status) {
        JSONObject obj = new JSONObject();
        try {
            obj.put("tag", tag);
            obj.put("status", new Boolean(status));
        } catch (JSONException e) {
            // TODO Auto-generated catch block
        }
        return obj.toString();
    }
 
    
    public static String constructJSON(String tag, boolean status, Object o) {
        JSONObject obj = new JSONObject();
        
        ObjectMapper obj2 = new ObjectMapper();
      
        try {
        	
        	 String usuario = obj2.defaultPrettyPrintingWriter().writeValueAsString(o);
            obj.put("tag", tag);
            obj.put("status", new Boolean(status));
            obj.put("objeto", usuario);
        } catch (JSONException e) {
            // TODO Auto-generated catch block
        } catch (org.codehaus.jackson.JsonGenerationException e) {
        // TODO Auto-generated catch block
        } catch (org.codehaus.jackson.map.JsonMappingException e) {
            // TODO Auto-generated catch block
        } catch (IOException e) {
        	//
        }
        return obj.toString();
    	}
    
    /**
     * Method to construct JSON with Error Msg
     * 
     * @param tag
     * @param status
     * @param err_msg
     * @return
     */
    public static String constructJSON(String tag, boolean status,String err_msg) {
        JSONObject obj = new JSONObject();
        try {
            obj.put("tag", tag);
            obj.put("status", new Boolean(status));
            obj.put("error_msg", err_msg);
        } catch (JSONException e) {
            // TODO Auto-generated catch block
        }
        return obj.toString();
    }
 
}