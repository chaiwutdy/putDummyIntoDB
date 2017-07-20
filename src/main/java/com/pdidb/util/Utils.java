package com.pdidb.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.pdidb.model.Field;

public class Utils {
	private static final String CONFIG_PATH = "config.properties";
	
	public static String getProperties(String key){
		InputStream inputStream = null;
		String result = "";
		try {
			Properties prop = new Properties();
			inputStream = Utils.class.getClassLoader().getResourceAsStream(CONFIG_PATH);
 
			if (inputStream != null) {
				prop.load(inputStream);
			} else {
				throw new FileNotFoundException("property file '" + CONFIG_PATH + "' not found in the classpath");
			}
 
			return prop.getProperty(key);
		} catch (Exception e) {
			System.out.println("Exception: " + e);
		} finally {
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	public static List<Field> cloneList(List<Field> sourceFields){
	List<Field> cloneFields = new ArrayList<Field>();
		for(Field obj:sourceFields){
			cloneFields.add(obj.clone());
		}
		return cloneFields;
	}
}
