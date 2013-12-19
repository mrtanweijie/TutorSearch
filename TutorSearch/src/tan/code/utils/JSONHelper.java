package tan.code.utils;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.google.gson.JsonObject;

public class JSONHelper<T> {
	private EntityHelper entityHelper;
	private JsonObject  jsonObject;
	
	/**
	 * 创建根据实体json
	 * @param entity
	 * @return JsonObject
	 */
	@SuppressWarnings("unchecked")
	public JsonObject createJSON(T entity) {
		//项目发布改为Spring管理-20131013-twj
		entityHelper=new EntityHelper();
		List<Map<String, Object>> list = entityHelper.getFiledsInfo(entity);
		
		jsonObject=new JsonObject();
		
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).get("f_value") != null) {
				jsonObject.addProperty(list.get(i).get("f_name").toString(), list.get(i).get("f_value").toString());
			}
		}
		System.out.println(jsonObject);
		return jsonObject;
	}

	
	public EntityHelper getEntityHelper() {
		return entityHelper;
	}

	@Resource
	public void setEntityHelper(EntityHelper entityHelper) {
		this.entityHelper = entityHelper;
	}
}
