package cn.comesaday.cw.service;

import java.util.List;
import cn.comesaday.cw.domain.Express;
import cn.comesaday.cw.domain.Susc;

public interface ExpressService {

	int getCounts();

	List<Express> findByPage(int beginCount, int pageSize);

	Express findById(Integer id);

	void addexp(Express express);

	void del(Integer id);

	void opexp(Integer id, String string);

	void express(Susc susc1);

	List<Express> findByUid(Integer uid);

}
