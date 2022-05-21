package biz.impl;

import java.util.List;

import dao.impl.MessageDaoImpl;

import entity.Message;
import biz.MessageBiz;

public class MessageBizImpl implements MessageBiz {

	public boolean addMessage(Message message) {
	int row=	new MessageDaoImpl().save(message);
	if(row>0) return true;
	else	return false;
	}

	public boolean delMessage(int id) {
		int row=	new MessageDaoImpl().delMessage(id);
		if(row>0) return true;
		else	return false;
	}

	public List turnPage(int page) {
		List mlist=new MessageDaoImpl().listByPage(page);
		return mlist;
	}
	public int getTotalPages(int pageSize){
		int totalpages=0;
		int totalcount=new MessageDaoImpl().getCount();
		totalpages=(totalcount%pageSize==0)?(totalcount/pageSize):(totalcount/pageSize+1);
		return totalpages;
	}
}
