package util;
import java.sql.*;
public class BaseDao {
	    public final static String driver = "com.mysql.jdbc.Driver";                     // 数据库驱动
	    public final static String url    = "jdbc:mysql://localhost:3306/messageboard";   // url
	    public final static String dbName = "root";                                                               // 数据库用户名
	    public final static String dbPass = "1234";                                                               // 数据库密码
	    
	   static private Connection        conn  = null;   // 数据库连接
	   static private PreparedStatement pstmt = null;   // 创建PreparedStatement对象
	   static private ResultSet         rs    = null;   // 创建结果集对象
	    /**
	     * 得到数据库连接
	     * @throws ClassNotFoundException
	     * @throws SQLException
	     * @return 数据库连接
	     */
	    public static Connection getConn() throws ClassNotFoundException, SQLException{
	        Class.forName(driver);                                     //注册驱动
	        return DriverManager .getConnection(url,dbName,dbPass);   //获得数据库连接并返回
	    }
	    
	    /**
	     * 释放资源
	     * @param conn 数据库连接
	     * @param pstmt PreparedStatement对象
	     * @param rs 结果集
	     */
	    public static void closeAll( Connection conn, PreparedStatement pstmt, ResultSet rs ) {
	        /*  如果rs不空，关闭rs  */
	        if(rs != null){
	            try { rs.close();} catch (SQLException e) {e.printStackTrace();}
	        }
	        /*  如果pstmt不空，关闭pstmt  */
	        if(pstmt != null){
	            try { pstmt.close();} catch (SQLException e) {e.printStackTrace();}
	        }
	        /*  如果conn不空，关闭conn  */
	        if(conn != null){
	            try { conn.close();} catch (SQLException e) {e.printStackTrace();}
	        }
	    }
	    public static int executeSQL(String sql,String[] param) {
	        Connection        conn  = null;
	        PreparedStatement pstmt = null;
	        int               num   = 0;
	        
	        /*  处理SQL,执行SQL  */
	        try {
	            conn = getConn();                              // 得到数据库连接
	            pstmt = conn.prepareStatement(sql);    // 得到PreparedStatement对象
	            if( param != null ) {
	                for( int i = 0; i < param.length; i++ ) {
	                    pstmt.setString(i+1, param[i]);         // 为预编译sql设置参数
	                }
	            }
	            num = pstmt.executeUpdate();                    // 执行SQL语句
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();                            // 处理ClassNotFoundException异常
	        } catch (SQLException e) {
	            e.printStackTrace();                            // 处理SQLException异常
	        } finally {
	            closeAll(conn,pstmt,null);                     // 释放资源
	        }
	        return num;
	    }
}
