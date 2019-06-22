package cn.comesaday.cw.dao.impl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import cn.comesaday.cw.dao.UserDao;
import cn.comesaday.cw.domain.User;

@Repository("userDao")
public class UserDaoImpl extends HibernateDaoSupport implements UserDao{

	@Autowired
    public void setSessionFactoryOverride(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

	@SuppressWarnings("deprecation")
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		String hql = "select count(*) from User";
		int count = 0;
		try {
			@SuppressWarnings("unchecked")
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
	public List<User> findByPage(int beginCount, int pageSize) {
		// TODO Auto-generated method stub
		List<User> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
			list = (List<User>) this.getHibernateTemplate().findByCriteria(criteria, beginCount, pageSize);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (list != null&&list.size() > 0) {
			return list;
		}
		return null;
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		String hql = "from User u where u.account=?0 and u.password=?1";
		List<User> list = null;
		try {
			list = (List<User>) this.getHibernateTemplate().find(hql, user.getAccount() , user.getPassword());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		User user2 = null;
		if (list != null&&list.size() > 0) {
			user2 = list.get(0);
		}
		return user2;
	}
	
	@SuppressWarnings("deprecation")
	public User findById(Integer id) {
		String hql = "from User u where u.id=?0";
		User user = null;
		try {
			user = (User) this.getHibernateTemplate().find(hql, id).get(0);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean repwd(Integer id, String newpass) {
		// TODO Auto-generated method stub
		boolean flag =false;
		try {
			User user = findById(id);
			user.setPassword(newpass);
			this.getHibernateTemplate().update(user);
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public void reinfo(User user) {
		// TODO Auto-generated method stub
		try {
			this.getHibernateTemplate().update(user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public User findByAccount(String account) {
		// TODO Auto-generated method stub
		String hql = "from User u where u.account=?0";
		List<User> list = null;
		try {
			list = (List<User>) this.getHibernateTemplate().find(hql, account);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		User user = null;
		if (list != null&&list.size() > 0) {
			user = list.get(0);
		}
		return user;
	}

	@Override
	public boolean reg(User user) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			user.setState(false);
			user.setIsvip(false);
			this.getHibernateTemplate().save(user);
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return flag;
	}

	@Override
	public boolean active(Integer id) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			User user = findById(id);
			user.setState(true);
			this.getHibernateTemplate().update(user);
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public void openVip(Integer id) {
		// TODO Auto-generated method stub
		User user = findById(id);
		user.setIsvip(true);
		this.getHibernateTemplate().update(user);
	}
}
