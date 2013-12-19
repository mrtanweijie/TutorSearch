package tan.code.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import tan.code.model.UserInfo;
import tan.code.utils.LuceneHelper;
import tan.code.utils.SQLStringHelper;

@Component
public class UserInfoDao {

	private JdbcTemplate jdbcTemplate;
	private SQLStringHelper<UserInfo> sqlStringHelper;
	private LuceneHelper<UserInfo> luceneHelper = new LuceneHelper<UserInfo>();

	/**
	 * 写入索引
	 * 
	 * @param indexWriterPath
	 * @param userInfo
	 */
	public void addUserInfo(String indexWriterPath, UserInfo userInfo) {
		luceneHelper.add(indexWriterPath, userInfo);
	}

	/**
	 * 混合查询
	 * 
	 * @param indexReadPath
	 *            索引路径
	 * @param searchText
	 *            搜索关键字
	 * @return 搜索结果
	 */
	public List<UserInfo> search(String indexReadPath, String searchText) {
		String fields[] = { "university", "major", "academic", "intriduction", "grade", "other" };
		return luceneHelper.simpleSearchUserInfo(indexReadPath, fields, searchText);
	}

	/**
	 * 根据注册账号完善个人资料
	 * 
	 * @param userInfo
	 *            资料信息
	 * @param u_id
	 *            用户id
	 * @return
	 */
	public int updateUserInfo(UserInfo userInfo, int u_id) {
		return jdbcTemplate.update(sqlStringHelper.createUserInfoUpdate(userInfo, u_id));
	}

	/**
	 * 根据用户登录账号id获取用户信息
	 * 
	 * @param u_id
	 * @return 返回用户信息
	 */
	public UserInfo getUserInfo(int u_id) {
		String sql = "select * from t_userinfo where u_id=?";
		final UserInfo userInfo = new UserInfo();
		jdbcTemplate.query(sql, new Object[] { u_id }, new RowCallbackHandler() {

			@Override
			public void processRow(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				userInfo.setId(rs.getInt("id"));
				userInfo.setRealname(rs.getString("realname"));
				userInfo.setPhone(rs.getString("phone"));
				userInfo.setAge(rs.getInt("age"));
				userInfo.setUniversity(rs.getString("university"));
				userInfo.setMajor(rs.getString("major"));
				userInfo.setAcademic(rs.getString("academic"));
				userInfo.setGrade(rs.getString("grade"));
				userInfo.setSex(rs.getString("sex"));
				userInfo.setIntriduction(rs.getString("intriduction"));
				userInfo.setOther(rs.getString("other"));
			}
		});
		return userInfo;
	}

	/**
	 * 多条件筛选
	 * 
	 * @param university
	 *            大学
	 * @param major
	 *            专业
	 * @param academic
	 *            学历
	 * @param grade
	 *            年级
	 * @return 返回教员列表
	 */
	public List<UserInfo> selectByMulti(String university, String major, String academic, String grade) {
		
		String sql=createSelect(university,major,academic,grade);
		System.out.println("sql"+sql);
		return jdbcTemplate.query(sql, new RowMapper<UserInfo>() {

			@Override
			public UserInfo mapRow(ResultSet rs, int index) throws SQLException {
				// TODO Auto-generated method stub
				UserInfo userInfo = new UserInfo();
				userInfo.setU_id(rs.getInt("u_id"));
				userInfo.setId(rs.getInt("id"));
				userInfo.setRealname(rs.getString("realname"));
				userInfo.setPhone(rs.getString("phone"));
				userInfo.setAge(rs.getInt("age"));
				userInfo.setUniversity(rs.getString("university"));
				userInfo.setMajor(rs.getString("major"));
				userInfo.setAcademic(rs.getString("academic"));
				userInfo.setGrade(rs.getString("grade"));
				userInfo.setSex(rs.getString("sex"));
				userInfo.setIntriduction(rs.getString("intriduction"));
				userInfo.setOther(rs.getString("other"));
				return userInfo;
			}
		});
		// return null;
	}
	
	
	private String createSelect(String university, String major, String academic, String grade) {
		StringBuffer sql=new StringBuffer();
		sql.append("select * from t_userinfo where 1=1");
		if (university!="") {
			sql.append("  and university='"+university+"'");
		}
		if (major!="") {
			sql.append("  and major='"+major+"'");
		}
		if (academic!="") {
			sql.append("  and academic='"+academic+"'");
		}
		if (grade!="") {
			sql.append("  and grade='"+grade+"'");
		}
		sql.append(";");
		//System.out.println(sql.toString());
		return sql.toString();
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Resource
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public SQLStringHelper<UserInfo> getSqlStringHelper() {
		return sqlStringHelper;
	}

	@Resource
	public void setSqlStringHelper(SQLStringHelper<UserInfo> sqlStringHelper) {
		this.sqlStringHelper = sqlStringHelper;
	}

}
