package dao.impl;
import java.sql.*;
import java.util.*;
import java.util.Date;
import java.text.*;

import javax.sql.*;

import dao.MessageDao;


import util.BaseDao;

import entity.Message;

import entity.*;
public class MessageDaoImpl implements MessageDao {
	     Connection        conn  = null;   // 数据库连接
	     PreparedStatement pstmt = null;   // 创建PreparedStatement对象
	     ResultSet         rs    = null;   // 创建结果集对象
	   
	    /**
	     * 保存一条留言
	     * @param message
	     * @return
	     */
	
	public int save(Message message){
		int result = 0;
        String sql = "insert into MESSAGE(message,author,postTime) values(?,?,?)";
        try {
            conn   = BaseDao.getConn();              // 获取数据库链接
            pstmt  = conn.prepareStatement(sql);  // 获取PreparedStatement对象
            pstmt.setString(1, message.getMessage());
            pstmt.setString(2, message.getAuthor());
            pstmt.setString(3, new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            result = pstmt.executeUpdate();       // 执行sql
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
        	BaseDao.closeAll(conn, pstmt, rs);
        }
        return result;
		
	}

	public List listByPage(int page){
		 List list = new ArrayList();
	        int rowBegin = 0;                        // 开始行数，表示每页第一条记录在数据库中的行数
	        if( page > 1 ) {
	            rowBegin =5*(page-1);            // 按页数取得开始行数，设每页可以显示5条留言
	        }
	        String sql = "select  *  from MESSAGE order by id limit "+rowBegin+", 5";
	        try {
	            conn  = BaseDao.getConn();              // 获取数据库链接
	            pstmt = conn.prepareStatement(sql);  // 获取PreparedStatement对象
	            rs    = pstmt.executeQuery();        // 执行sql取得查询结果集
	            while(rs.next()) {
	                Message message = new Message();
	                message.setId(rs.getInt("id"));
	                message.setMessage(rs.getString("message"));
	                message.setAuthor(rs.getString("author"));
	                message.setPostTime(rs.getString("postTime"));
	                list.add(message);
	            }
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally{
	        	BaseDao.closeAll(conn, pstmt, rs);
	        }
	        return list;
	}
public int delMessage(int id){
	String sql="delete from MESSAGE where id=?";
	int row=0;
	try {
        conn  = BaseDao.getConn();              // 获取数据库链接
        pstmt = conn.prepareStatement(sql);  // 获取PreparedStatement对象
        pstmt.setInt(1, id);
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
public int getCount(){
	String sql="select count(*) from MESSAGE";
	int count=0;
	try {
        conn  = BaseDao.getConn();              // 获取数据库链接
        pstmt = conn.prepareStatement(sql);  // 获取PreparedStatement对象
        rs    = pstmt.executeQuery();        // 执行sql取得查询结果集
        if(rs.next()) {
            count=rs.getInt(1);
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally{
    	BaseDao.closeAll(conn, pstmt, rs);
    }
    return count;
}
}
