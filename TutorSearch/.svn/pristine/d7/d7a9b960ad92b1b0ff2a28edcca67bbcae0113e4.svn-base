package tan.code.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

/**
 * 获取实体类的信息
 * 
 * @author Mr_Tank_
 * 
 */
@Component
public class EntityHelper {

	/**
	 * 根据属性名获取属性值
	 * */
	protected Object getFieldValueByName(String fieldName, Object o) {
		try {
			String firstLetter = fieldName.substring(0, 1).toUpperCase();
			String getter = "get" + firstLetter + fieldName.substring(1);
			Method method = o.getClass().getMethod(getter, new Class[] {});
			Object value = method.invoke(o, new Object[] {});
			return value;
		} catch (Exception e) {
			// log.error(e.getMessage(), e);
			return null;
		}
	}

	/**
	 * 类名(obj_name)获取属性类型(f_type)，属性名(f_name)，属性值(f_value)的map组成的list
	 * */
	
	@SuppressWarnings({ "rawtypes", "unused", "unchecked" })
	public List getFiledsInfo(Object o) {

		String obj_name = o.getClass().getSimpleName().toString();
		Field[] fields = o.getClass().getDeclaredFields();
		String[] fieldNames = new String[fields.length];
		List<Map> list = new ArrayList();
		Map<String, Object> infoMap;

		for (int i = 0; i < fields.length; i++) {
			infoMap = new HashMap<String, Object>();

			infoMap.put("obj_name", obj_name);

			if (getFieldValueByName(fields[i].getName(), o) != null) {
				infoMap.put("f_type", fields[i].getType().toString());
				infoMap.put("f_name", fields[i].getName());
				infoMap.put("f_value",
						getFieldValueByName(fields[i].getName(), o));
			}

			list.add(infoMap);
		}
		return list;
	}
}
