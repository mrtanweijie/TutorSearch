package tan.code.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import tan.code.dao.UserDao;
import tan.code.dao.UserInfoDao;
import tan.code.model.User;
import tan.code.model.UserInfo;

@Component
public class UserService {
	private UserDao userDao;
	private UserInfoDao userInfoDao;
	String path=System.getenv("MOPAAS_FILESYSTEM4321_LOCAL_PATH");
	String name=System.getenv("MOPAAS_FILESYSTEM4321_NAME");
	String fullPath=path+"/"+name;
	private String indexPath = fullPath;
	/**
	 * 添加用户
	 * @param user
	 */
	public void add(User user) {
		int u_id = userDao.add(user);
		System.out.println("user id=" + u_id);
		// 插入外键
		userDao.insertUserInfo(u_id);
		// return userDao.add(user);
	}

	/**
	 * 完善个人信息
	 * @param userInfo
	 */
	public void add_userinfo(UserInfo userInfo,int u_id) {
		userInfoDao.updateUserInfo(userInfo, u_id);
	}
	
	/**
	 * 成为教员。写入索引
	 * @param userInfo
	 * @param u_id
	 */
	public void add_myinfo(UserInfo userInfo) {
		userInfoDao.addUserInfo(indexPath, userInfo);
	}

	public void delete(int id) {
		userDao.delete(id);
	}

	public void update(User user, int id) {
		userDao.update(user, id);
	}

	public User getuser(int id) {
		return userDao.getUser(id);
	}

	
	public UserInfo getuserinfo(int u_id) {
		return userInfoDao.getUserInfo(u_id);
	}
	
	/**
	 * 
	 * @param name
	 * @return
	 */
	public boolean checkName(String name) {
		return userDao.checkName(name);
	}

	public boolean checkEmail(String email) {
		return userDao.checkEmail(email);
	}

	public List<User> checkUser(String name, String pwd) {
		// List<User> users=userDao.checkUser(name, pwd);
		return userDao.checkUser(name, pwd);
	}

	public List<User> getuserlist(int from, int total) {
		return userDao.listUsers(from, total);
	}
	
	public int getUserNum() {
		return userDao.getTotal();
	}
	public long getTotalPage(int userNum,int pageSize) {
		return userDao.getTotalPage(userNum,pageSize);
	}

	
	
	//搜索教员信息
	public List<UserInfo> search(String searchText){
		return userInfoDao.search(indexPath, searchText);
	}
	
	public List<UserInfo> selectByMulti(String university, String major, String academic, String grade) {
		return userInfoDao.selectByMulti(university, major, academic, grade);
	}
	
	public UserDao getUserDao() {
		return userDao;
	}

	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserInfoDao getUserInfoDao() {
		return userInfoDao;
	}

	@Resource
	public void setUserInfoDao(UserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

}
