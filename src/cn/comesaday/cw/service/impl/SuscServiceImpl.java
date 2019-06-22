package cn.comesaday.cw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.comesaday.cw.dao.SuscDao;
import cn.comesaday.cw.domain.Susc;
import cn.comesaday.cw.service.SuscService;

@Transactional(readOnly = false)
@Service("suscService")
public class SuscServiceImpl implements SuscService{

	@Autowired
	private SuscDao suscDao;

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return suscDao.getCount();
	}

	@Override
	public List<Susc> findByPage(int beginCount, int pageSize) {
		// TODO Auto-generated method stub
		return suscDao.findByPage(beginCount, pageSize);
	}

	@Override
	public Susc findById(Integer id) {
		// TODO Auto-generated method stub
		return suscDao.findById(id);
	}

	@Override
	public void del(Integer id) {
		// TODO Auto-generated method stub
		suscDao.del(id);
	}

	@Override
	public void opsusc(Integer id, String string) {
		// TODO Auto-generated method stub
		suscDao.opsusc(id, string);
	}

	@Override
	public void order(Susc susc) {
		// TODO Auto-generated method stub
		suscDao.order(susc);
	}

	@Override
	public void suscState(Integer id) {
		// TODO Auto-generated method stub
		suscDao.suscState(id);
	}

	@Override
	public List<Susc> findByUid(Integer uid) {
		// TODO Auto-generated method stub
		return suscDao.findByUid(uid);
	}

	@Override
	public double getMoney() {
		// TODO Auto-generated method stub
		return suscDao.getMoney();
	}

	@Override
	public void dealSusc(Integer tid, String string) {
		// TODO Auto-generated method stub
		suscDao.dealSusc(tid, string);
	}
}
