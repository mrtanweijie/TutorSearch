package tan.code.utils;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Component;

/**
 * 简单的SQL语句拼装类 ;要求数据库表名及列命和实体保持一致;
 * 
 * @author Mr_Tank_
 * 
 * @param <T>
 */
@Component
public class SQLStringHelper<T> {

	private EntityHelper entityHelper;

	/**
	 * 根据传入的实体生成Insert SQL語句
	 * 
	 * @param entity
	 * @return 拼接好的sql语句
	 */
	@SuppressWarnings("unchecked")
	public String createInsert(T entity) {
		String sql = "insert into ";
		String column = ""; // 列
		String c_values = ""; // 列值
		List<Map<String, Object>> list = entityHelper.getFiledsInfo(entity);
		sql += "t_" + list.get(0).get("obj_name").toString().toLowerCase()
				+ " ";
		for (int i = 0; i < list.size(); i++) {

			// 約定id在數據庫自動生成-20130807

			// if (String.valueOf(list.get(i).get("f_name")).equals("id")) {
			// //i++;
			// } else
			if (list.get(i).get("f_value") != null&&!String.valueOf(list.get(i).get("f_name")).equals("id")) {
				column += list.get(i).get("f_name") + ",";
				c_values += "'" + list.get(i).get("f_value") + "',";
			}

		}
		sql += "(" + column.substring(0, column.length() - 1) + ") values ("
				+ c_values.substring(0, c_values.length() - 1) + ");";

		return sql;

	}

	/**
	 * 拼裝Delete SQL語句
	 * 
	 * @param entity
	 * @param id
	 *            实体id
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public String createDelete(Class class1, int id) {
		String sql = "delete from t_";
		// List<Map<String, Object>> list = entityHelper.getFiledsInfo(entity);
		sql += class1.getSimpleName().toLowerCase() + " where id=" + id + ";";
		return sql;
	}

	/**
	 * 查找
	 * 
	 * @param entity
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String createSelect(T entity) {
		String sql = "select * from t_";
		String column = ""; // 列
		List<Map<String, Object>> list = entityHelper.getFiledsInfo(entity);
		sql += list.get(0).get("obj_name").toString().toLowerCase() + " where ";
		for (int i = 0; i < list.size(); i++) {

			// 約定id在數據庫自動生成-20130807

			// id計數不能從0開始
			// 如果知道id直接根据id生成sql语句就可以了
			if (String.valueOf(list.get(i).get("f_name")).equals("id")
					&& !String.valueOf(list.get(i).get("f_value")).equals("0")) {
				sql += "id=" + list.get(i).get("f_value");
				return sql;
			} else if (list.get(i).get("f_value") != null) {

				column += list.get(i).get("f_name") + " like %"
						+ list.get(i).get("f_value") + "% or ";
			}
		}
		return sql += column.substring(0, column.length() - 4) + ";";

	}
	
	/**
	 * 根据实体id生成sql语句
	 * @param entity
	 * @param id
	 * @return
	 */
	public String  createSelectByEntityId(Class class1,int id) {
		String sql = "select * from t_";
		sql+=class1.getSimpleName().toLowerCase()+" where id="+id;
		return sql;
	}

	/**
	 * 根据id更新实体数据
	 * 
	 * @param entity
	 * @param id
	 *            实体id
	 * @return 拼装好的 Update SQL语句
	 */
	@SuppressWarnings("unchecked")
	public String createUpdate(T entity, int id) {
		String sql = "update t_";
		String column = ""; // 列
		List<Map<String, Object>> list = entityHelper.getFiledsInfo(entity);
		sql += list.get(0).get("obj_name").toString().toLowerCase() + " set ";
		for (int i = 0; i < list.size(); i++) {

			// id不能修改
			// if (String.valueOf(list.get(i).get("f_name")).equals("id")) {
			// i++;
			// } else
			if (list.get(i).get("f_value") != null) {
				column += list.get(i).get("f_name") + "='"
						+ list.get(i).get("f_value") + "',";
			}

		}
		return sql += column.substring(0, column.length() - 1) + " where id='"
				+ id + "'";

	}
	
	

	/**
	 * 因为是根据外键更新，所以要另外生成
	 * 生成userinfo update sql语句
	 * @param entity
	 * @param u_id 用户注册账号id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public String createUserInfoUpdate(T entity, int u_id) {
		String sql = "update t_";
		String column = ""; // 列
		List<Map<String, Object>> list = entityHelper.getFiledsInfo(entity);
		sql += list.get(0).get("obj_name").toString().toLowerCase() + " set ";
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).get("f_value") != null&&list.get(i).get("f_name")!="id") {
				column += list.get(i).get("f_name") + "='"
						+ list.get(i).get("f_value") + "',";
			}

		}
		return sql += column.substring(0, column.length() - 1) + " where u_id='"
				+ u_id + "'";

	}
	

	public EntityHelper getEntityHelper() {
		return entityHelper;
	}

	@Resource
	public void setEntityHelper(EntityHelper entityHelper) {
		this.entityHelper = entityHelper;
	}

}
