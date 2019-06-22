package cn.comesaday.cw.dao.impl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import cn.comesaday.cw.dao.SuscDao;
import cn.comesaday.cw.domain.Susc;
import cn.comesaday.cw.utils.DateTime;


@Repository("suscDao")
public class SuscDaoImpl extends HibernateDaoSupport implements SuscDao{

	@Autowired
    public void setSessionFactoryOverride(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

	@SuppressWarnings("deprecation")
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		String hql = "select count(*) from Susc";
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
	public List<Susc> findByPage(int beginCount, int pageSize) {
		// TODO Auto-generated method stub
		List<Susc> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Susc.class);
			list = (List<Susc>) this.getHibernateTemplate().findByCriteria(criteria, beginCount, pageSize);
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
	public void opsusc(Integer id, String string) {
		// TODO Auto-generated method stub
		try {
			Susc susc = findById(id);
			susc.setState(string);
			this.getHibernateTemplate().update(susc);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public Susc findById(Integer id) {
		// TODO Auto-generated method stub
		String hql = "from Susc s where s.id=?0";
		List<Susc> list = null;
		try {
			list = (List<Susc>) this.getHibernateTemplate().find(hql, id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Susc susc = null;
		if (list != null&&list.size() > 0) {
			susc = list.get(0);
		}
		return susc;
	}
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public Susc findByTid(Integer tid) {
		// TODO Auto-generated method stub
		String hql = "from Susc s where s.tree.id=?0";
		List<Susc> list = null;
		try {
			list = (List<Susc>) this.getHibernateTemplate().find(hql, tid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Susc susc = null;
		if (list != null&&list.size() > 0) {
			susc = list.get(0);
		}
		return susc;
	}

	@Override
	public void del(Integer id) {
		// TODO Auto-generated method stub
		try {
			Susc susc = findById(id);
			this.getHibernateTemplate().delete(susc);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public void order(Susc susc) {
		// TODO Auto-generated method stub
		try {
			double desposit = 100;
			susc.setOther(susc.getDesposit()-desposit);
			susc.setDesposit(100);
			susc.setMessage(false);
			susc.setState("wait");
			susc.setStime(DateTime.getCurrentTime());
			this.getHibernateTemplate().save(susc);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public void suscState(Integer tid) {
		// TODO Auto-generated method stub
		String hql = "from Susc s where s.tree.id=?0";
		try {
			@SuppressWarnings("deprecation")
			Susc susc = (Susc) this.getHibernateTemplate().find(hql,tid).get(0);
			susc.setMessage(true);
			this.getHibernateTemplate().update(susc);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Susc> findByUid(Integer uid) {
		// TODO Auto-generated method stub
		String hql = "from Susc s where s.user.id=?0";
		List<Susc> list = null;
		try {
			list = (List<Susc>) this.getHibernateTemplate().find(hql, uid);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public double getMoney() {
		// TODO Auto-generated method stub
		String hql = "select sum(desposit) from Susc s where s.state ='doing'";
		String hql2 = "select sum(other) from Susc s where s.state ='doing'";
		List<Double> list = null;
		double desposit = 0;
		double other = 0;
		try {
			list = (List<Double>) this.getHibernateTemplate().find(hql);
			desposit = list.get(0).doubleValue();
			list = (List<Double>) this.getHibernateTemplate().find(hql2);
			other = list.get(0).doubleValue();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return desposit+other;
	}

	@Override
	public void dealSusc(Integer tid, String string) {
		// TODO Auto-generated method stub
		try {
			Susc susc = findByTid(tid);
			susc.setState(string);
			this.getHibernateTemplate().update(susc);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
