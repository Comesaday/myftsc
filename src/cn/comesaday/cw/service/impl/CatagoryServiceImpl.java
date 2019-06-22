package cn.comesaday.cw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.comesaday.cw.dao.CatagoryDao;
import cn.comesaday.cw.domain.Catagory;
import cn.comesaday.cw.service.CatagoryService;

@Transactional(readOnly = false)
@Service("catagoryService")
public class CatagoryServiceImpl implements CatagoryService{

	@Autowired
	private CatagoryDao catagoryDao;

	@Override
	public int getCounts() {
		// TODO Auto-generated method stub
		return catagoryDao.getCounts();
	}

	@Override
	public List<Catagory> findByPage(int beginCount, int pageSize) {
		// TODO Auto-generated method stub
		return catagoryDao.findByPage(beginCount,pageSize);
	}

	@Override
	public void del(Catagory catagory) {
		// TODO Auto-generated method stub
		catagoryDao.del(catagory);
	}

	@Override
	public List<Catagory> getAll() {
		// TODO Auto-generated method stub
		return catagoryDao.getAll();
	}

	@Override
	public boolean findByName(String name) {
		// TODO Auto-generated method stub
		return catagoryDao.findByName(name);
	}

	@Override
	public boolean addCat(Catagory catagory) {
		// TODO Auto-generated method stub
		return catagoryDao.addCat(catagory);
	}

	@Override
	public Catagory findById(Integer id) {
		// TODO Auto-generated method stub
		return catagoryDao.findById(id);
	}

	@Override
	public List<Catagory> findByPage(int i, int j, String name) {
		// TODO Auto-generated method stub
		return catagoryDao.findByPage(i, j, name);
	}

	@Override
	public int getCounts(String name) {
		// TODO Auto-generated method stub
		return catagoryDao.getCounts(name);
	}

	@Override
	public List<Integer> findSuscCatagories() {
		// TODO Auto-generated method stub
		return catagoryDao.findSuscCatagories();
	}
}
