package biz.impl;

import dao.AdminUserDao;
import dao.impl.AdminUserDaoImpl;
import entity.AdminUser;
import biz.AdminUserBiz;
public class AdminUserBizImpl implements AdminUserBiz {
	public boolean login(AdminUser user) {
		boolean valid=false;
		AdminUserDao aud=new AdminUserDaoImpl();
		AdminUser u=aud.findUser(user.getUname());
		if(u.getPwd().equals(user.getPwd())) valid=true;
		return valid;
	}
}
