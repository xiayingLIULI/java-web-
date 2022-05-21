<%@ page language="java" import="java.util.*,entity.*,dao.*,dao.impl.*,biz.*,biz.impl.*" pageEncoding="GBK"%>
<%
	request.setCharacterEncoding("GBK");
	MessageBiz mbiz = new MessageBizImpl();
	int pageSize = 5;
	int totalpages = new MessageBizImpl().getTotalPages(pageSize);
	List mlist = new ArrayList();
	String p = request.getParameter("page");
	int np = 1;
	if (p != null && !p.equals(""))
		np = Integer.parseInt(p);
	if (np > totalpages)
		np = totalpages;
	else if (np < 1)
		np = 1;
	mlist = mbiz.turnPage(np);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>访客留言板</title>
	
  <script type="text/javascript">
	function check(){
		var author  = document.forms[0].uname.value;
		var message = document.forms[0].message.value;
		var errorMsg= "";
		if(author==""|| author=="请输入您的名字") {
			errorMsg += "作者不能为空";
		}
		if(message=="") {
			errorMsg += "\n内容不能为空";
		}
		if(message.length>500) {
			errorMsg += "\n内容长度不能大于500";
		}
		if(author.length>20) {
			errorMsg += "\n作者名长度不能大于20";
		}
		if(errorMsg!=""){
			alert(errorMsg);
			return false;
		}
	}
	
	
	
	
	</script>
  <style type="text/css">
<!--
.all {
	font-family: "宋体";
	font-size: 12px;
	font-style: normal;
	color: #000000;
	border: 1px solid #3399FF;
}
.f {
	
	font-family: "宋体";
	font-size: 12px;
	font-style: normal;
	color: #000000;
}
.a1 {
	
	background-color: #3399FF;
	text-align: left;
}
-->
  </style>
</head>

	<body>
		<div align="center">
			<h3>
				访客留言板
			</h3>
		</div>
		<div>
			<%
				for (int i = 0; i < mlist.size(); i++) {
					Message message = (Message) mlist.get(i);
			%>
			<div class="all">
				<div class="a1">
					作者：<%=message.getAuthor()%></div>
				<div align="right"><%=5 * (np - 1) + i + 1%>#
				</div>
				<div><%=message.getMessage()%></div>
				<div align="right">
					发表时间：<%=message.getPostTime()%></div>
			</div>
			<p>
				<%
					}
				%>
			
		</div>
		<div>
			<div align="right" style="font-size: 12px;">
				<a href="index.jsp?page=<%=np - 1%>">上一页</a>&nbsp;&nbsp;&nbsp;
				<a href="index.jsp?page=<%=np + 1%>">下一页</a>
			</div>
		</div>
		<form method="post" action="dopost.jsp" onSubmit="return check()">
			<div class="f">
				<p>
					用户名
					<input class="all" type="text" name="uname" />
				</p>
				<p>
					留言信息
					<label>
						<textarea class="all" name="message" rows="5" cols="55"></textarea>
					</label>
				</p>
				<p>
					<input type="submit" name="submitb" value="提交" />
				</p>
			</div>
		</form>
	</body>

</html>

