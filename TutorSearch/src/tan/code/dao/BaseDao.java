package tan.code.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import tan.code.utils.SQLStringHelper;

/**
 * 通用数据库操作类
 * 
 * @author Mr_Tank_
 * 
 */
public class BaseDao<T> {
	private Class<T> entityClass;
	@Autowired
	private JdbcTemplate jdbcTemplate;
	private SQLStringHelper<T> sqlStringHelper;
	
	//通过反射获取子类确定泛型
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public BaseDao(){
		Type type=getClass().getGenericSuperclass();
		Type[] params=((ParameterizedType)type).getActualTypeArguments();
		entityClass=(Class)params[0];
	}

	/**
	 * 添加数据
	 * @param entity
	 * @return 返回数据库表的自增主鍵
	 */
	public int add(T entity) {
		final String sql = sqlStringHelper.createInsert(entity);
		KeyHolder keyHolder = new GeneratedKeyHolder();
		try {
			// 创建一个主键持有者			
			jdbcTemplate.update(new PreparedStatementCreator() {

				@Override
				public PreparedStatement createPreparedStatement(Connection conn) throws SQLException {
					// TODO Auto-generated method stub
					// return null;
					PreparedStatement ps = conn.prepareStatement(sql);
					return ps;
				}
			}, keyHolder);

			
		} catch (Exception e) {
			// TODO: handle exception
			//return 0;
		}
		return keyHolder.getKey().intValue();// 获取主键
	}

	/**
	 * 根据id删除
	 * 
	 * @param class1类
	 * @param id 实体id
	 *           
	 * 
	 * @return
	 */
	public int delete(int id) {
		return jdbcTemplate.update(sqlStringHelper.createDelete(entityClass, id));
	}

	/**
	 * 根据id 更新实体
	 * 
	 * @param entity
	 * @param id
	 * @return
	 */
	public int update(T entity, int id) {
		return jdbcTemplate.update(sqlStringHelper.createUpdate(entity, id));
	}

	public List<Map<String, Object>> select(T entity) {
		return jdbcTemplate.queryForList(sqlStringHelper.createSelect(entity));
	}

	/**
	 * 获取总数
	 * @param entity
	 * @return 总记录
	 */
	public int getTotal() {
		String sql="select count(*) from t_"+entityClass.getSimpleName().toLowerCase();
		return jdbcTemplate.queryForInt(sql);
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Autowired
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public SQLStringHelper<T> getSqlStringHelper() {
		return sqlStringHelper;
	}

	@Resource
	public void setSqlStringHelper(SQLStringHelper<T> sqlStringHelper) {
		this.sqlStringHelper = sqlStringHelper;
	}

}
