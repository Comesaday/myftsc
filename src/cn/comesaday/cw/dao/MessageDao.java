package cn.comesaday.cw.dao;

import java.util.List;

import cn.comesaday.cw.domain.Message;

public interface MessageDao {

	boolean send(Message message, List<String> pictureFileName);

	Message findById(Integer id);

	int getCount();

	List<Message> findByPage(int beginCount, int pageSize);

	List<Message> findByUid(Integer uid);

}
