package org.yun.app.util;

import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

public class StringUtil {
	public static String replaceDirtyWords(String str, Properties p){
		Set<Object> keyset = p.keySet();
		Iterator<Object> it = keyset.iterator();
		while(it.hasNext()){
			String dirtyKey = (String) it.next();
			if(str.contains(dirtyKey)){
				str = str.replaceAll(dirtyKey, p.getProperty(dirtyKey));
			}
		}
		return str;
	}
}
