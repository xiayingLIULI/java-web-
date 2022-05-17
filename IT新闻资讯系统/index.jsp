<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.*,java.text.*" %>
<%@ page import="entity.news" %>
<%@ page import="java.sql.Date" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function checkdel() //封装一个<body>中做成点击事件的函数
        { var allCheckBoxs=document.getElementsByName("newsid");
            var flag=false;
            for(i=0;i<allCheckBoxs.length;i++){
                if(allCheckBoxs[i].type=="checkbox"){
                    if(allCheckBoxs[i].checked){
                        flag=true;
                        break;
                    }
                }
            }
            if(!flag){
                alert("请选择要删除的记录！");
                return false;
            }
            else{
                if(confirm("确定要删除吗？")) frm.submit();
            }
        }
    </script>
</head>
<body>
<%
    Connection con=null;
    Statement stmt=null;
    ResultSet rs=null;
    ArrayList<news> nlist=new ArrayList<news>();
    try {
        Class.forName("com.mysql.jdbc.Driver");//1.加载驱动类
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/news", "root", "1234");//2.获取连接
        stmt = con.createStatement();
        rs = stmt.executeQuery("select * from news");//3.执行查询，获得结束集
        while (rs.next()) { //对查询结果的处理
            news n = new news();
            n.setId(rs.getInt("id"));
            n.setTitle(rs.getString(2));
            n.setContent(rs.getString(3));
            n.setBegintime(rs.getTimestamp(4));
            n.setUsername(rs.getString(5));
            nlist.add(n);
        }
    }catch (Exception e){
        e.printStackTrace();
    }
    if(rs!=null){
        rs.close();
    }
    if(stmt!=null){
        stmt.close();
    }
    if(con!=null){
        con.close();
    }
%>
<h1 style="text-align: center;font-family: 宋体" >IT新闻资讯</h1>
<form action="del.jsp" name="frm">
<table border="1" style="text-align: center;margin: auto">
    <tr><td>序号</td><td>删除/批量</td><td>新闻标题</td><td>新闻内容</td><td>作者</td><td>发布时间</td></tr>
    <%
        for(int i=0;i<nlist.size();i++){
            news mess=new news();
            mess=nlist.get(i);
            Date time = new Date(mess.getBegintime().getTime());
            SimpleDateFormat formatime = new SimpleDateFormat("yyyy-MM-dd");
            String t = formatime.format(time);
    %>
    <tr> <td><%=mess.getId() %></td>
        <td><input type="checkbox" name="newsid" value="<%=mess.getId() %>"></td>
        <td><%=mess.getTitle() %></td>
        <td><%=mess.getContent() %></td>
        <td><%=mess.getUsername() %></td>
        <td><%=t %></td>
    </tr>
    <%
        }
    %>
    <td colspan="6" ><input type="button" value="删除" onclick="checkdel()"></td>
</table></form>
</body>
</html>
