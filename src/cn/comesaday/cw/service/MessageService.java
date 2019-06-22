package cn.comesaday.cw.service;

import java.util.List;

import cn.comesaday.cw.domain.Message;

public interface MessageService {

	boolean send(Message message, List<String> pictureFileName);

	Message findById(Integer id);

	int getCount();

	List<Message> findByPage(int beginCount, int pageSize);

	List<Message> findByUid(Integer uid);

}
