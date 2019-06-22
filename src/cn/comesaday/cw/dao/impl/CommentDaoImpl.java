package cn.comesaday.cw.dao.impl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.comesaday.cw.dao.CommentDao;
import cn.comesaday.cw.domain.Comment;
import cn.comesaday.cw.utils.DateTime;

@Repository("commentDao")
public class CommentDaoImpl extends HibernateDaoSupport implements CommentDao {

	@Autowired
    public void setSessionFactoryOverride(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

	@Override
	public int getCounts() {
		// TODO Auto-generated method stub
		String hql = "select count(*) from Comment";
		int count = 0;
		try {
			@SuppressWarnings({ "unchecked", "deprecation" })
			List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
			count = list.get(0).intValue();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> findByPage(int beginCount, int pageSize) {
		// TODO Auto-generated method stub
		List<Comment> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Comment.class);
			list = (List<Comment>) this.getHibernateTemplate().findByCriteria(criteria, beginCount, pageSize);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (list != null&&list.size() > 0) {
			return list;
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> getComments() {
		// TODO Auto-generated method stub
		List<Comment> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Comment.class);
			list = (List<Comment>) this.getHibernateTemplate().findByCriteria(criteria, 0, 6);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (list != null&&list.size() > 0) {
			return list;
		}
		return null;
	}

	@Override
	public boolean comment(Comment comment,List<String> pictureFileName) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			if (pictureFileName != null&&pictureFileName.size() > 0) {
				comment.setPicture1(pictureFileName.get(0));
				comment.setPicture2(pictureFileName.get(1));
				comment.setPicture3(pictureFileName.get(2));
			}
			comment.setCtime(DateTime.getCurrentTime());
			this.getHibernateTemplate().save(comment);
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Comment> findByUid(Integer uid) {
		// TODO Auto-generated method stub
		String hql = "from Comment c where c.user.id=?0";
		List<Comment> list = null;
		try {
			list = (List<Comment>) this.getHibernateTemplate().find(hql, uid);
		} catch (Exception e) {
			// TODO: handle finally clause
			e.printStackTrace();
		}
		return list;
	}

}
