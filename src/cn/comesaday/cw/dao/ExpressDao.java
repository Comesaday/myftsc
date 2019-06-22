package cn.comesaday.cw.dao;

import java.util.List;
import cn.comesaday.cw.domain.Express;
import cn.comesaday.cw.domain.Susc;

public interface ExpressDao {

	int getCounts();

	List<Express> findByPage(int beginCount, int pageSize);

	Express findById(Integer id);

	void addexp(Express express);

	void del(Integer id);

	void opexp(Integer id, String string);

	void createExp(Susc susc);

	List<Express> findByUid(Integer uid);

}
