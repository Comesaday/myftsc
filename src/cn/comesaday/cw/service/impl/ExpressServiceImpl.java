package cn.comesaday.cw.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.comesaday.cw.dao.ExpressDao;
import cn.comesaday.cw.domain.Express;
import cn.comesaday.cw.domain.Susc;
import cn.comesaday.cw.service.ExpressService;

@Transactional(readOnly = false)
@Service("expressService")
public class ExpressServiceImpl implements ExpressService{

	@Autowired
	private ExpressDao expressDao;

	@Override
	public int getCounts() {
		// TODO Auto-generated method stub
		return expressDao.getCounts();
	}

	@Override
	public List<Express> findByPage(int beginCount, int pageSize) {
		// TODO Auto-generated method stub
		return expressDao.findByPage(beginCount, pageSize);
	}

	@Override
	public void express(Susc susc) {
		// TODO Auto-generated method stub
		expressDao.createExp(susc);
	}

	@Override
	public Express findById(Integer id) {
		// TODO Auto-generated method stub
		return expressDao.findById(id);
	}

	@Override
	public void addexp(Express express) {
		// TODO Auto-generated method stub
		expressDao.addexp(express);
	}

	@Override
	public void del(Integer id) {
		// TODO Auto-generated method stub
		expressDao.del(id);
	}

	@Override
	public void opexp(Integer id, String string) {
		// TODO Auto-generated method stub
		expressDao.opexp(id, string);
	}

	@Override
	public List<Express> findByUid(Integer uid) {
		// TODO Auto-generated method stub
		return expressDao.findByUid(uid);
	}
}
