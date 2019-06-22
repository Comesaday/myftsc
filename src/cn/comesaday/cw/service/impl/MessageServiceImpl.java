package cn.comesaday.cw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.comesaday.cw.dao.MessageDao;
import cn.comesaday.cw.domain.Message;
import cn.comesaday.cw.service.MessageService;

@Transactional(readOnly = false)
@Service("messageService")
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDao messageDao;

	@Override
	public boolean send(Message message, List<String> pictureFileName) {
		// TODO Auto-generated method stub
		return messageDao.send(message, pictureFileName);
	}

	@Override
	public Message findById(Integer id) {
		// TODO Auto-generated method stub
		return messageDao.findById(id);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return messageDao.getCount();
	}

	@Override
	public List<Message> findByPage(int beginCount, int pageSize) {
		// TODO Auto-generated method stub
		return messageDao.findByPage(beginCount, pageSize);
	}

	@Override
	public List<Message> findByUid(Integer uid) {
		// TODO Auto-generated method stub
		return messageDao.findByUid(uid);
	}

}
