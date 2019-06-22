package cn.comesaday.cw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.comesaday.cw.dao.CommentDao;
import cn.comesaday.cw.domain.Comment;
import cn.comesaday.cw.service.CommentService;

@Transactional(readOnly = false)
@Service("commentService")
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDao commentDao;

	@Override
	public int getCounts() {
		// TODO Auto-generated method stub
		return commentDao.getCounts();
	}

	@Override
	public List<Comment> findByPage(int beginCount, int pageSize) {
		// TODO Auto-generated method stub
		return commentDao.findByPage(beginCount, pageSize);
	}

	@Override
	public List<Comment> getComments() {
		// TODO Auto-generated method stub
		return commentDao.getComments();
	}

	@Override
	public boolean comment(Comment comment,List<String> pictureFileName) {
		// TODO Auto-generated method stub
		return commentDao.comment(comment,pictureFileName);
	}

	@Override
	public List<Comment> findByUid(Integer uid) {
		// TODO Auto-generated method stub
		return commentDao.findByUid(uid);
	}
}
