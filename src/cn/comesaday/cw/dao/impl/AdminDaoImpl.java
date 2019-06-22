package cn.comesaday.cw.dao.impl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import cn.comesaday.cw.dao.AdminDao;
import cn.comesaday.cw.domain.Admin;

@Repository("adminDao")
public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao{

	@Autowired
    public void setSessionFactoryOverride(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		String hql = "from Admin a where a.account=?0 and a.password=?1";
		List<Admin> admins = null;
		try {
			admins = (List<Admin>) this.getHibernateTemplate().find(hql, admin.getAccount(),admin.getPassword());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		Admin a = null;
		if (admins != null&&admins.size() > 0) {
			a = admins.get(0);
			return a;
		}
		return null;
	}

	@Override
	public void modInfo(Admin admin) {
		// TODO Auto-generated method stub
		try {
			this.getHibernateTemplate().update(admin);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public Admin getAdmin() {
		// TODO Auto-generated method stub
		List<Admin> list = null;
		String hql = "from Admin";
		try {
			list = (List<Admin>) this.getHibernateTemplate().find(hql);
		} catch (Exception e) {
			// TODO: handle exception
		}
		Admin admin = null;
		if (list != null&&list.size() > 0) {
			admin = list.get(0);
		}
		return admin;
	}

}
