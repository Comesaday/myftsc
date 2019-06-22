package cn.comesaday.cw.dao.impl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import cn.comesaday.cw.dao.ExpressDao;
import cn.comesaday.cw.domain.Express;
import cn.comesaday.cw.domain.Susc;
import cn.comesaday.cw.utils.DateTime;

@Repository("expressDao")
public class ExpressDaoImpl extends HibernateDaoSupport implements ExpressDao{

	@Autowired
    public void setSessionFactoryOverride(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

	@SuppressWarnings("deprecation")
	@Override
	public int getCounts() {
		// TODO Auto-generated method stub
		String hql = "select count(*) from Express";
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
	public List<Express> findByPage(int beginCount, int pageSize) {
		// TODO Auto-generated method stub
		List<Express> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Express.class);
			list = (List<Express>) this.getHibernateTemplate().findByCriteria(criteria, beginCount, pageSize);
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
	public void createExp(Susc susc) {
		// TODO Auto-generated method stub
		try {
			Express express = new Express();
			express.setUser(susc.getUser());
			express.setTree(susc.getTree());
			express.setState("wait");
			this.getHibernateTemplate().save(express);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public Express findById(Integer id) {
		// TODO Auto-generated method stub
		String hql = "from Express e where e.id=?0";
		List<Express> list = null;
		try {
			list = (List<Express>) this.getHibernateTemplate().find(hql, id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Express express = null;
		if (list != null&&list.size() > 0) {
			express = list.get(0);
		}
		return express;
	}

	@Override
	public void addexp(Express express) {
		// TODO Auto-generated method stub
		try {
			Express express2 = findById(express.getId());
			express2.setTnum(express.getTnum());
			express2.setState("doing");
			express2.setStime(DateTime.getCurrentTime());
			this.getHibernateTemplate().update(express2);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public void del(Integer id) {
		// TODO Auto-generated method stub
		try {
			Express express = findById(id);
			this.getHibernateTemplate().delete(express);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public void opexp(Integer id, String string) {
		// TODO Auto-generated method stub
		try {
			Express express = findById(id);
			express.setState(string);
			this.getHibernateTemplate().update(express);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Express> findByUid(Integer uid) {
		// TODO Auto-generated method stub
		String hql = "from Express e where e.user.id=?0";
		List<Express> list = null;
		try {
			list = (List<Express>) this.getHibernateTemplate().find(hql, uid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
}
