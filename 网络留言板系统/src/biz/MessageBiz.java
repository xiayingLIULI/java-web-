package biz;

import java.util.List;

import entity.Message;

public interface MessageBiz {
	public boolean addMessage(Message message);
	public List turnPage(int page);
	public int getTotalPages(int pageSize);
	public boolean delMessage(int id);
}
