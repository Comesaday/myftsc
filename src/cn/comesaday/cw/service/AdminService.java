package cn.comesaday.cw.service;

import cn.comesaday.cw.domain.Admin;

public interface AdminService {

	public Admin login(Admin admin);

	public void modInfo(Admin admin);

	public Admin getAdmin();
}
