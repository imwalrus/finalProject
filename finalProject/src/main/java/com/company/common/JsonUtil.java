package com.company.common;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class JsonUtil {
	public String toJson(Map<String, Object> map) {
		StringBuilder result = new StringBuilder();
		// to do
		result.append("{");
		Iterator<String> keys = map.keySet().iterator();
		while (keys.hasNext()) {
			String key = keys.next();
			String value = (String) map.get(key);
			if (result.length() > 1) {
				result.append(", ");					
			}
			result.append(key + " : " + value);
		}
		result.append("}");
		return result.toString();
	}
	
	public String toJson(List<Map<String, Object>> map) {
		String result1 = "";
		// to do
		
		return result1;
	}	
	
	public String toObjectJson(Object vo) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		String result1 = "";
		// to do
		Field[] fields = vo.getClass().getDeclaredFields();
		for (Field field : fields) {
			String fieldName = field.getName();
			String method = "get" + field.getName().substring(0, 1).toUpperCase();
			Method m = vo.getClass().getDeclaredMethod(method, null);
			String value = (String) m.invoke(vo, null);
			System.out.println(fieldName + " : " + value);
		}
		return result1;
	}
	
	public String toObjectJson(List<Object> vo) {
		String result1 = "";
		// to do
		
		return result1;
	}
}
