package cn.comesaday.cw.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.comesaday.cw.dao.UserDao;
import cn.comesaday.cw.domain.User;
import cn.comesaday.cw.service.UserService;

@Transactional(readOnly = false)
@Service("userService")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return userDao.getCount();
	}

	@Override
	public List<User> findByPage(int beginCount, int pageSize) {
		// TODO Auto-generated method stub
		return userDao.findByPage(beginCount,pageSize);
	}

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return userDao.login(user);
	}

	@Override
	public boolean repwd(Integer id, String newpass) {
		// TODO Auto-generated method stub
		return userDao.repwd(id, newpass);
	}

	@Override
	public User findById(Integer id) {
		// TODO Auto-generated method stub
		return userDao.findById(id);
	}

	@Override
	public void reinfo(User user) {
		// TODO Auto-generated method stub
		userDao.reinfo(user);
	}

	@Override
	public User regcheck(String account) {
		// TODO Auto-generated method stub
		return userDao.findByAccount(account);
	}

	@Override
	public boolean reg(User user) {
		// TODO Auto-generated method stub
		return userDao.reg(user);
	}

	@Override
	public boolean active(Integer id) {
		// TODO Auto-generated method stub
		return userDao.active(id);
	}

	@Override
	public void openVip(Integer id) {
		// TODO Auto-generated method stub
		userDao.openVip(id);
	}
}
