<%--
  Created by IntelliJ IDEA.
  User: 19339
  Date: 2022/5/12
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gbk" language="java" import="java.sql.*,java.lang.*"  %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function yz() //封装一个<body>中做成点击事件的函数
        {
            var nn = document.getElementById("nn"); //通过 id 名 找到 元素并重新 赋值
            if(nn.value=="") //判断条件
            {
                alert("请输入学号"); //输出不满足条件的提示内容
                return false;
            }
            else
            {
                alert("您查询的是："+nn.value)
                return true; //满足条件时将执行表单的 action
            }
        }
    </script>
</head>
<body>
<h1 style="text-align: center;font-family: 宋体" >学生成绩查询系统</h1>
<form action="doselect.jsp" method="post" style="text-align: center">
    学号：<input type="text" name="xh" id="nn">&nbsp &nbsp &nbsp科目：<input type="text" name="km">&nbsp &nbsp<input
        type="submit" onclick="yz()" value="查询">
    <input type="reset" value="重置">
</form>
</body>
</html>
