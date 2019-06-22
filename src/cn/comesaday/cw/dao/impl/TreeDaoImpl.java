package cn.comesaday.cw.dao.impl;

import java.util.List;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.comesaday.cw.dao.TreeDao;
import cn.comesaday.cw.domain.Tree;

@Repository("treeDao")
public class TreeDaoImpl extends HibernateDaoSupport implements TreeDao{

	@Autowired
    public void setSessionFactoryOverride(SessionFactory sessionFactory){
        super.setSessionFactory(sessionFactory);
    }

	@SuppressWarnings("deprecation")
	@Override
	@Transactional(readOnly=true)
	public Tree findById(Integer id) {
		// TODO Auto-generated method stub
		String hql = "from Tree t where t.id=?0";
		Tree tree = null;
		try {
			tree = (Tree) this.getHibernateTemplate().find(hql, id).get(0);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return tree;
	}

	@Override
	public void optree(Integer id , String string) {
		// TODO Auto-generated method stub
		try {
			Tree tree = findById(id);
			tree.setState(string);
			this.getHibernateTemplate().update(tree);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public void del(Tree tree) {
		// TODO Auto-generated method stub
		try {
			Tree tree2 = findById(tree.getId());
			this.getHibernateTemplate().delete(tree2);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public void add(Tree tree, List<String> pictureFileName) {
		// TODO Auto-generated method stub
		try {
			Tree tree2 = new Tree();
			tree2.setCatagory(tree.getCatagory());
			tree2.setPicture1(pictureFileName.get(0));
			tree2.setPicture2(pictureFileName.get(1));
			tree2.setPicture3(pictureFileName.get(2));
			tree2.setPrice(tree.getPrice());
			tree2.setTpoint(tree.getTpoint());
			tree2.setDetail(tree.getDetail());
			tree2.setState("not");
			this.getHibernateTemplate().save(tree2);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public void mod(Tree tree, List<String> pictureFileName) {
		// TODO Auto-generated method stub
		try {
			tree.setPicture1(pictureFileName.get(0));
			tree.setPicture2(pictureFileName.get(1));
			tree.setPicture3(pictureFileName.get(2));
			this.getHibernateTemplate().update(tree);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly=true)
	public List<Tree> findByPage(int beginCount, int pageSize, Tree tree) {
		// TODO Auto-generated method stub
		List<Tree> list = null;
		try {
			DetachedCriteria criteria = DetachedCriteria.forClass(Tree.class);
			if (tree.getCatagory().getId() != null&&tree.getState().equals("all")) {
				criteria.add(Restrictions.eq("catagory.id", tree.getCatagory().getId()));
			}else if (tree.getCatagory().getId() == null&&!tree.getState().equals("all")) {
				criteria.add(Restrictions.eq("state", tree.getState()));
			}else if (tree.getCatagory().getId() != null&&!tree.getState().equals("all")) {
				criteria.add(Restrictions.eq("catagory.id", tree.getCatagory().getId()));
				criteria.add(Restrictions.eq("state", tree.getState()));
			}else if (tree.getCatagory().getId() == null&&tree.getState().equals("all")) {
				
			}
			list = (List<Tree>) this.getHibernateTemplate().findByCriteria(criteria, beginCount, pageSize);
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
	@Transactional(readOnly=true)
	public int getCount(Tree tree) {
		// TODO Auto-generated method stub
		String hql = "";
		if (tree.getCatagory().getId() != null&&tree.getState().equals("all")) {
			hql = "select count(*) from Tree t where t.catagory.id=?0";
		}else if (tree.getCatagory().getId() == null&&!tree.getState().equals("all")) {
			hql = "select count(*) from Tree t where t.state=?0";
		}else if (tree.getCatagory().getId() != null&&!tree.getState().equals("all")) {
			hql = "select count(*) from Tree t where t.catagory.id=?0 and t.state=?1";
		}else if (tree.getCatagory().getId() == null&&tree.getState().equals("all")) {
			hql = "select count(*) from Tree";
		}
		List<Long> list = null;
		int count = 0;
		try {
			if (tree.getCatagory().getId() != null&&tree.getState().equals("all")) {
				list = (List<Long>) this.getHibernateTemplate().find(hql, tree.getCatagory().getId());
			}else if (tree.getCatagory().getId() == null&&!tree.getState().equals("all")) {
				list = (List<Long>) this.getHibernateTemplate().find(hql, tree.getState());
			}else if (tree.getCatagory().getId() != null&&!tree.getState().equals("all")) {
				list = (List<Long>) this.getHibernateTemplate().find(hql, tree.getCatagory().getId(),tree.getState());
			}else if (tree.getCatagory().getId() == null&&tree.getState().equals("all")) {
				list = (List<Long>) this.getHibernateTemplate().find(hql);
			}
			count = list.get(0).intValue();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return count;
	}
}
