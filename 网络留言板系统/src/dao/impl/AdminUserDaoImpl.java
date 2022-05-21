package dao.impl;
import java.sql.*;
import javax.sql.*;

import dao.AdminUserDao;
import util.BaseDao;
import entity.*;
public class AdminUserDaoImpl implements AdminUserDao {
	  Connection        conn  = null;   // 数据库连接
	     PreparedStatement pstmt = null;   // 创建PreparedStatement对象
	     ResultSet         rs    = null;   // 创建结果集对象
	public AdminUser findUser(String uName){
		String sql="select * from adminusers where uname=?";
		AdminUser user=new AdminUser();
		try {
	        conn  = BaseDao.getConn();              // 获取数据库链接
	        pstmt = conn.prepareStatement(sql);  // 获取PreparedStatement对象
	        pstmt.setString(1, uName);
	        rs=pstmt.executeQuery();
	      while(rs.next()){
	    	 user.setId(rs.getInt(1));
	    	 user.setUname(rs.getString(2));
	    	 user.setPwd(rs.getString(3));
	      }
		} catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally{
	        BaseDao.closeAll(conn, pstmt, rs);
	    }
	    return user;
	}
	 public int updateUser(AdminUser user){
	        String   sql  = "update adminusers set pwd=? where uname=?";
	        int row=0;
	    	try {
	            conn  = BaseDao.getConn();              // 获取数据库链接
	            pstmt = conn.prepareStatement(sql);  // 获取PreparedStatement对象
	            pstmt.setString(1, user.getPwd());
	            pstmt.setString(2, user.getUname());
	            row=pstmt.executeUpdate();
	    	} catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally{
	        	BaseDao.closeAll(conn, pstmt, rs);
	        }
	        return row;
}
}