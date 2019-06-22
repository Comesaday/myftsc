package cn.comesaday.cw.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import cn.comesaday.cw.dao.OrchardDao;
import cn.comesaday.cw.domain.Orchard;
import cn.comesaday.cw.service.OrchardService;

@Transactional(readOnly = false)
@Service("orchardService")
public class OrchardServiceImpl implements OrchardService{

	@Autowired
	private OrchardDao orchardDao;
	@Override
	public Orchard getInfo() {
		// TODO Auto-generated method stub
		return orchardDao.getInfo();
	}
	@Override
	public boolean delInfo() {
		// TODO Auto-generated method stub
		return orchardDao.delInfo();
	}
	@Override
	public boolean addInfo(Orchard orchard, List<String> pictureFileName) {
		// TODO Auto-generated method stub
		return orchardDao.addInfo(orchard,pictureFileName);
	}
	@Override
	public boolean modInfo(Orchard orchard, List<String> pictureFileName) {
		// TODO Auto-generated method stub
		return orchardDao.modInfo(orchard,pictureFileName);
	}
}
