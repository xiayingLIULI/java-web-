package dao;
import entity.AdminUser;
public interface AdminUserDao {
	public AdminUser findUser(String uName);
	public int updateUser(AdminUser user);
}
