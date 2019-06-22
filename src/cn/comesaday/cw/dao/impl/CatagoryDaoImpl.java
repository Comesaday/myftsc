package cn.comesaday.cw.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.comesaday.cw.dao.CatagoryDao;
import cn.comesaday.cw.domain.Catagory;
import cn.comesaday.cw.utils.DateTime;

@Repository("catagoryDao")
public class CatagoryDaoImpl extends HibernateDaoSupport implements CatagoryDao {

	@Autowired
    public void setSessionFactoryOverride(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

	@SuppressWarnings("deprecation")
	@Override
	public int getCounts() {
		// TODO Auto-generated method stub
		String hql = "select count(*) from Catagory";
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

	@SuppressWarnings({"unchecked" })
	@Override
	public List<Catagory> findByPage(int beginCount, int pageSize) {
		// TODO Auto-generated method stub
		List<Catagory> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Catagory.class);
			list = (List<Catagory>) this.getHibernateTemplate().findByCriteria(criteria, beginCount, pageSize);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (list != null&&list.size() > 0) {
			return list;
		}
		return null;
	}

	@SuppressWarnings("deprecation")
	public Catagory findById(int id) {
		String hql = "from Catagory c where c.id=?0";
		Catagory catagory = null;
		try {
			catagory = (Catagory) this.getHibernateTemplate().find(hql, id).get(0);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (catagory != null) {
			return catagory;
		}
		return null;
	}
	
	@Override
	public void del(Catagory catagory) {
		// TODO Auto-generated method stub
		try {
			this.getHibernateTemplate().delete(catagory);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public List<Catagory> getAll() {
		// TODO Auto-generated method stub
		String hql = "from Catagory";
		List<Catagory> list = null;
		try {
			list = (List<Catagory>) this.getHibernateTemplate().find(hql);
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
	public boolean findByName(String name) {
		// TODO Auto-generated method stub
		String hql = "from Catagory c where c.name=?0";
		boolean flag = false;
		List<Catagory> list = null;
		try {
			list = (List<Catagory>) this.getHibernateTemplate().find(hql,name);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (list != null&&list.size() > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public boolean addCat(Catagory catagory) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			catagory.setAtime(DateTime.getCurrentTime());
			this.getHibernateTemplate().save(catagory);
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@SuppressWarnings({ "deprecation", "unchecked" })
	@Override
	public Catagory findById(Integer id) {
		// TODO Auto-generated method stub
		String hql = "from Catagory c where c.id=?0";
		List<Catagory> list = null;
		try {
			list = (List<Catagory>) this.getHibernateTemplate().find(hql, id);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Catagory catagory = null;
		if (list != null&&list.size() > 0) {
			catagory = list.get(0);
		}
		return catagory;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Catagory> findByPage(int i, int j, String name) {
		// TODO Auto-generated method stub
		List<Catagory> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Catagory.class);
			criteria.add(Restrictions.eq("name", name));
			list = (List<Catagory>) this.getHibernateTemplate().findByCriteria(criteria, i, j);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (list != null&&list.size() > 0) {
			return list;
		}
		return null;
	}

	@SuppressWarnings("deprecation")
	@Override
	public int getCounts(String name) {
		// TODO Auto-generated method stub
		String hql = "select count(*) from Catagory c where c.name=?0";
		int count = 0;
		try {
			@SuppressWarnings("unchecked")
			List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,name);
			count = list.get(0).intValue();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return count;
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public List<Integer> findSuscCatagories() {
		// TODO Auto-generated method stub
		String hql = "select distinct t.catagory.id from Tree t where t.state ='can'";
		List<Integer> list = null;
		try {
			list = (List<Integer>) this.getHibernateTemplate().find(hql);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
}
