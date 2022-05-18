<%@ page contentType="text/html;charset=gbk" language="java" import="java.sql.*" %>
<html style="text-align: center">
<head>
    <title>Title</title>
</head>
<body>
<% request.setCharacterEncoding("GBK");
    String number=request.getParameter("xh");
    String subject=request.getParameter("km");
    Connection con=null;
    PreparedStatement pstm=null;
    ResultSet rs=null;
    if(number.equals(""))response.sendRedirect("index.jsp");//学号在输入框中未输入。
    else{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cj","root","1234");
            String sql="select * from result where number=?";//动态 SQL 语句
            if(!(subject.equals(""))) sql=sql+" and subject=?";
            pstm=con.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);//生成 pstm 对象
            pstm.setInt(1,Integer.parseInt(number));//为？设置具体值
            if(!(subject.equals(""))) pstm.setString(2,subject);
            rs=pstm.executeQuery();//执行查询
            if(rs.next()!=false){//查询到数据
%>
<h1 style="font-family: 宋体">学生成绩单</h1>
<a href="index.jsp">重新查询</a><br>
<table border="0" style="text-align: center;margin: auto">
    <tr><td>学号</td><td>科目</td><td>成绩</td>
    </tr>
    <%
        rs.beforeFirst();
        while(rs.next()){
    %>
    <tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getInt(3) %></td
    ></tr>
    <%
        }%>
</table>
<%}
else response.sendRedirect("noresult.jsp");//没查询到数据，到 noresult 页面
}catch(ClassNotFoundException | SQLException e)
{e.printStackTrace();
} finally{
    if(rs!=null)rs.close();
    if(pstm!=null)pstm.close();
    if(con!=null) con.close();
}
}
%>
</body>
</html>





<%--<% request.setCharacterEncoding("GBK");--%>
<%--    String number=request.getParameter("xh");--%>
<%--    String subject=request.getParameter("km");--%>
<%--    Connection con=null;--%>
<%--    PreparedStatement pstm=null;--%>
<%--    ResultSet rs=null;--%>
<%--    if(number.equals(""))response.sendRedirect("index.jsp");//学号在输入框中未输入。--%>
<%--    else{--%>
<%--        try{--%>
<%--            Class.forName("com.mysql.jdbc.Driver");--%>
<%--            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cj","root","123");--%>
<%--            String sql="select * from result where number=?";//动态 SQL 语句--%>
<%--            if(!(subject.equals(""))) sql=sql+" and subject=?";--%>
<%--            pstm=con.prepareStatement(sql);//生成 pstm 对象--%>
<%--            pstm.setInt(1,Integer.parseInt(number));//为？设置具体值--%>
<%--            if(!(subject.equals(""))) pstm.setString(2,subject);--%>
<%--            rs=pstm.executeQuery();//执行查询--%>
<%--            if(rs.next()!=false){//查询到数据--%>
<%--%>--%>
<%--<h1>学生成绩单</h1>--%>
<%--<a href="index.jsp">重新查询</a><br>--%>
<%--<table border="0">--%>
<%--    <tr><td>学号</td><td>科目</td><td>成绩</td>--%>
<%--    </tr>--%>
<%--    <%--%>
<%--        while(rs.next()){--%>
<%--    %>--%>
<%--    <tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getInt(3) %></td--%>
<%--    ></tr>--%>
<%--    <%--%>
<%--        }%>--%>
<%--</table>--%>
<%--<%}--%>
<%--else response.sendRedirect("noresult.jsp");//没查询到数据，到 noresult 页面--%>
<%--}catch(ClassNotFoundException | SQLException e)--%>
<%--{e.printStackTrace();--%>
<%--} finally{--%>
<%--    if(rs!=null)rs.close();--%>
<%--    if(pstm!=null)pstm.close();--%>
<%--    if(con!=null) con.close();--%>
<%--}--%>
<%--}--%>
<%--%>--%>
