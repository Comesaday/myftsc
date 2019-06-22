package cn.comesaday.cw.dao.impl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import cn.comesaday.cw.dao.OrchardDao;
import cn.comesaday.cw.domain.Orchard;

@Repository("orchardDao")
public class OrchardDaoImpl extends HibernateDaoSupport implements OrchardDao{

	@Autowired
    public void setSessionFactoryOverride(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	@Override
	public Orchard getInfo() {
		// TODO Auto-generated method stub
		String hql = "from Orchard";
		List<Orchard> list = null;
		try {
			list = (List<Orchard>) this.getHibernateTemplate().find(hql);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if (list != null&&list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public boolean delInfo() {
		// TODO Auto-generated method stub
		boolean flag = false;
		String hql = "from Orchard";
		try {
			@SuppressWarnings({ "unchecked", "deprecation" })
			List<Orchard> list = (List<Orchard>) this.getHibernateTemplate().find(hql);
			this.getHibernateTemplate().deleteAll(list);
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean addInfo(Orchard orchard, List<String> pictureFileName) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			orchard.setMovie((String) pictureFileName.get(0));
			orchard.setPicture1((String) pictureFileName.get(1));
			orchard.setPicture2((String) pictureFileName.get(2));
			orchard.setPicture3((String) pictureFileName.get(3));
			orchard.setPicture4((String) pictureFileName.get(4));
			orchard.setPicture5((String) pictureFileName.get(5));
			orchard.setPicture6((String) pictureFileName.get(6));
			this.getHibernateTemplate().save(orchard);
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean modInfo(Orchard orchard, List<String> pictureFileName) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			orchard.setPicture1((String) pictureFileName.get(1));
			orchard.setPicture2((String) pictureFileName.get(2));
			orchard.setPicture3((String) pictureFileName.get(3));
			orchard.setPicture4((String) pictureFileName.get(4));
			orchard.setPicture5((String) pictureFileName.get(5));
			orchard.setPicture6((String) pictureFileName.get(6));
			
			this.getHibernateTemplate().update(orchard);
			flag = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return flag;
	}
}
