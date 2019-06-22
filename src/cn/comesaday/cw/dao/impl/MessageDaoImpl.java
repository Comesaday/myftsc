package cn.comesaday.cw.dao.impl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import cn.comesaday.cw.dao.MessageDao;
import cn.comesaday.cw.domain.Message;
import cn.comesaday.cw.utils.DateTime;

@Repository("messageDao")
public class MessageDaoImpl extends HibernateDaoSupport implements MessageDao{

	@Autowired
    public void setSessionFactoryOverride(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

	@Override
	public boolean send(Message message, List<String> pictureFileName) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			message.setMovie(pictureFileName.get(0));
			message.setPicture1(pictureFileName.get(1));
			message.setPicture2(pictureFileName.get(2));
			message.setPicture3(pictureFileName.get(3));
			message.setStime(DateTime.getCurrentTime());
			this.getHibernateTemplate().save(message);
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public Message findById(Integer id) {
		// TODO Auto-generated method stub
		String hql = "from Message m where m.id=?0";
		List<Message> list = null;
		try {
			list = (List<Message>) this.getHibernateTemplate().find(hql, id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Message message = null;
		if (list != null&&list.size() > 0) {
			message = list.get(0);
		}
		return message;
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		String hql = "select count(*) from Message";
		int totalCount = 0;
		try {
			List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
			totalCount = list.get(0).intValue();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return totalCount;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Message> findByPage(int beginCount, int pageSize) {
		// TODO Auto-generated method stub
		List<Message> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Message.class);
			list = (List<Message>) this.getHibernateTemplate().findByCriteria(criteria, beginCount, pageSize);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return  list;
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Message> findByUid(Integer uid) {
		// TODO Auto-generated method stub
		String hql = "from Message m where m.user.id=?0";
		List<Message> list = null;
		try {
			list = (List<Message>) this.getHibernateTemplate().find(hql, uid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
}
