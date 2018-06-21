package admin.order;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class GraphUtil {
	
	private GraphUtil() {}
	
/*	public static String getJsonData(OrderVO order) {
		String json = "{";
		
		json += "\"count\" : ";
		json += "\"" + order.getOrder_total() + "\",";
		json += "\"date\" : ";
		json += "\"" + order.getOrder_regdate() + "\"}";
		
		return json;
	}*/
	
	public static String getJsonData(Map<Date, Integer> map) {
		
		String json = "[";
		System.out.println(map);
		
		
		Iterator<Date> keys = map.keySet().iterator();
		while ( keys.hasNext() ) {
			
		    Date key = keys.next();
		    
		    json += "{";
		    json += "\"date\" : ";
			json += "\"" + key + "\",";
			json += "\"total\" : ";
			json += map.get(key) + "}";
			json +=",";
		}   
		json = json.substring(0, json.length() - 1);
		json+="]";
		
		return json;
	}
	
	
	/*map  = new HashMap<String, String>();*/
	
	/*for ( String key : map.keySet() ) {
		System.out.println("2");
		json += "\"date\" : ";
		json += "\"" + key + "\",";
		json += "\"total\" : ";
		json += "\"" + map.get(key) + "\"}";
	    
	}*/
	
	/*Iterator<Date> keys = map.keySet().iterator();
	while ( keys.hasNext() ) {
		
	    Date key = keys.next();
	    
	    json += "{";
	    json += "\"date\" : ";
		json += "\"" + key + "\",";
		json += "\"total\" : ";
		json += "\"" + map.get(key) + "\"}";
		json +=",";
	}   
	json = json.substring(0, json.length() - 1);
	
	json+="]";*/
	
	
	/*public static String getJsonData(Order order) {
		String json = "{";
		
		json += "\"count\" : ";
		json += "\"" + order.getCount() + "\",";
		json += "\"date\" : ";
		json += "\"" + order.getDate() + "\"}";
		
		return json;
	}*/
	
/*	public String getJsonData(Order[] orders) {
		String json = "[";
		
		for (Order order : orders) {
			json += getJsonData(order);
			
		}
		
		json += "]";
		return json;
	}*/
}
