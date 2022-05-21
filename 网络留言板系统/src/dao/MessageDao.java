package dao;

import java.util.List;

import entity.Message;

public interface MessageDao {
	public int save(Message message);
	public List listByPage(int page);
	public int delMessage(int id);
	public int getCount();
}
