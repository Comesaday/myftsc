package cn.comesaday.cw.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.comesaday.cw.dao.AdminDao;
import cn.comesaday.cw.domain.Admin;
import cn.comesaday.cw.service.AdminService;

@Transactional(readOnly = false)
@Service("adminService")
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDao adminDao;
	
	@Override
	public Admin login(Admin admin) {
		// TODO Auto-generated method stub
		return adminDao.login(admin);
	}

	@Override
	public void  modInfo(Admin admin) {
		// TODO Auto-generated method stub
		adminDao.modInfo(admin);
	}

	@Override
	public Admin getAdmin() {
		// TODO Auto-generated method stub
		return adminDao.getAdmin();
	}

}
