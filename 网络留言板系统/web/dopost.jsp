<%@ page language="java" import="java.util.*,entity.*,dao.*,biz.*,biz.impl.*,dao.impl.*" pageEncoding="GBK"%>
<%
request.setCharacterEncoding("GBK");
String author=(String)request.getParameter("uname");
String messagestr=(String)request.getParameter("message");
Message message=new Message();
message.setAuthor(author);
message.setMessage(messagestr);
MessageBiz mBiz=new MessageBizImpl();
if(mBiz.addMessage(message))
	response.sendRedirect("index.jsp");
	else {
	out.print("Ìá½»Ê§°Ü");
	}

%>

