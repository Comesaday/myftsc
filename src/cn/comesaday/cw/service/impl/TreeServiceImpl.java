package cn.comesaday.cw.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.comesaday.cw.dao.TreeDao;
import cn.comesaday.cw.domain.Tree;
import cn.comesaday.cw.service.TreeService;

@Transactional(readOnly = false)
@Service("treeService")
public class TreeServiceImpl implements TreeService{

	@Autowired
	private TreeDao treeDao;

	@Override
	public Tree findById(Integer id) {
		// TODO Auto-generated method stub
		return treeDao.findById(id);
	}

	@Override
	public void optree(Integer id , String string) {
		// TODO Auto-generated method stub
		treeDao.optree(id,string);
	}

	@Override
	public void del(Tree tree) {
		// TODO Auto-generated method stub
		treeDao.del(tree);
	}

	@Override
	public void add(Tree tree, List<String> pictureFileName) {
		// TODO Auto-generated method stub
		treeDao.add(tree, pictureFileName);
	}

	@Override
	public void mod(Tree tree, List<String> pictureFileName) {
		// TODO Auto-generated method stub
		treeDao.mod(tree, pictureFileName);
	}

	@Override
	public List<Tree> findByPage(int beginCount, int pageSize, Tree tree) {
		// TODO Auto-generated method stub
		return treeDao.findByPage(beginCount, pageSize, tree);
	}

	@Override
	public int getCount(Tree tree) {
		// TODO Auto-generated method stub
		return treeDao.getCount(tree);
	}
}
