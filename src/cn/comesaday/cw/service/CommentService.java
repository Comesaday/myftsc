package cn.comesaday.cw.service;

import java.util.List;

import cn.comesaday.cw.domain.Comment;

public interface CommentService {

	int getCounts();

	List<Comment> findByPage(int beginCount, int pageSize);

	List<Comment> getComments();

	boolean comment(Comment comment, List<String> pictureFileName);

	List<Comment> findByUid(Integer id);

}
