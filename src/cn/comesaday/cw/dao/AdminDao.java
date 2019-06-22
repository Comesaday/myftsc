package cn.comesaday.cw.dao;

import cn.comesaday.cw.domain.Admin;

public interface AdminDao{

	
	public Admin login(Admin admin);

	public void modInfo(Admin admin);

	public Admin getAdmin();

}
