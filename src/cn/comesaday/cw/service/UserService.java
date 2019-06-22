package cn.comesaday.cw.service;

import java.util.List;

import cn.comesaday.cw.domain.User;

public interface UserService {

	int getCount();

	List<User> findByPage(int beginCount, int pageSize);

	User login(User user);

	boolean repwd(Integer id, String newpass);

	User findById(Integer id);

	void reinfo(User user);

	User regcheck(String account);

	boolean reg(User user);

	boolean active(Integer id);

	void openVip(Integer id);
}
