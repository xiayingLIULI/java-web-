<%--
  Created by IntelliJ IDEA.
  User: 19339
  Date: 2022/5/16
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.lang.*,java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Connection con = null;
    Statement stmt = null;
    int row=0;
    String id[] =request.getParameterValues("newsid");
    try{
        Class.forName("com.mysql.jdbc.Driver");//1.加载驱动
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/news", "root", "1234");//2.连接数据库
        for(int i=0;i<id.length;i++){
            String sql = "delete from news where id="+id[i];
            stmt = con.createStatement();
            //3. 执行SQL语句获得查询结果 查询使用executeQuery方法，增删改使用executeUpdate方法
            row = stmt.executeUpdate(sql);
//            out.println(id[i]);
        }
        if(row>0){//更新成功
            response.sendRedirect("index.jsp");
        }
        else{
            out.print("删除失败");
        }

    }catch(Exception e){ //处理可能的异常
        e.printStackTrace();
    }
    //以下代码是释放资源

    if(stmt!=null){
        stmt.close();
    }
    if(con!=null){
        con.close();
    }
//    for(int i=0;i<id.length;i++){
//        out.println(id[i]);
//    }
%>

</body>
</html>
