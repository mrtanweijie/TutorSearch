package tan.code.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import tan.code.model.User;

@Component
public class UserDao extends BaseDao<User> {
	private JdbcTemplate jdbcTemplate;

	/**
	 * 添加新用戶的時候在信息表也插入外键
	 * 
	 * @param u_id
	 */
	public void insertUserInfo(int u_id) {
		String sql = "insert into t_userinfo(u_id) values(" + u_id + ")";
		jdbcTemplate.execute(sql);
	}

	/**
	 * 根據id獲取用戶信息
	 * 
	 * @param id
	 * @return
	 */
	public User getUser(final int id) {
		String sql = "select * from t_user where id=?";
		final User user = new User();
		jdbcTemplate.query(sql, new Object[] { id }, new RowCallbackHandler() {

			@Override
			public void processRow(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				user.setId(id);
				user.setIdentity(rs.getInt("identity"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));

			}
		});
		return user;
	}

	/**
	 * 验证用户名是否存在
	 * 
	 * @param name
	 * @return true表示用户不存在
	 */
	public boolean checkName(String name) {
		String sql = "select count(*) from t_user where name=?";
		int result = jdbcTemplate.queryForInt(sql, new Object[] { name });
		return result < 1 ? true : false;
	}

	/**
	 * 验证邮箱是否存在
	 * 
	 * @param email
	 * @return
	 */
	public boolean checkEmail(String email) {
		String sql = "select count(*) from t_user where email=?";
		int result = jdbcTemplate.queryForInt(sql, new Object[] { email });
		return result < 1 ? true : false;
	}

	/**
	 * 登录验证用户名和密码
	 * 
	 * @param name
	 * @param pwd
	 * @return
	 */
	public List<User> checkUser(String name, String pwd) {
		// String sql = "select count(*) from t_user where name=? and password=?";
		// int result=jdbcTemplate.queryForInt(sql, new Object[]{name,pwd});
		// return result==1?true:false;

		String sql = "select * from t_user where name=? and password=?";
		return jdbcTemplate.query(sql, new Object[] { name, pwd }, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int index) throws SQLException {
				// TODO Auto-generated method stub
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setIdentity(rs.getInt("identity"));
				return user;
			}
		});
	}


	/**
	 * 分页获取用户列表
	 * @param fromid 开始位置
	 * @param total 总数
	 * @return
	 */
	public List<User> listUsers(final int from, final int total) {
		//String sql = "select * from t_user where id between ? and ?";
		String sql="select * from t_user limit ?,?";
		return jdbcTemplate.query(sql, new Object[] { from, total }, new RowMapper<User>() {

			@Override
			public User mapRow(ResultSet rs, int index) throws SQLException {
				// TODO Auto-generated method stub
				User user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setIdentity(rs.getInt("identity"));
				return user;
			}
		});

	}

	/**
	 * 获取用户总数
	 * @return 用户总数 
	 */
	public int getUserNum() {
		String sql = "select count(*) from t_user";
		return jdbcTemplate.queryForInt(sql);
	}
	
	/**
	 * 获取总页数
	 * @param pageSize 每页条数
	 * @return 总页数
	 */
	public long getTotalPage(int userNum, int pageSize) {
		// int totalCount = getUserNum();
		if (userNum % pageSize == 0) {
			return userNum / pageSize;
		} else {
			return userNum / pageSize + 1;
		}
	}
	
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Resource
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

}
