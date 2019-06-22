package cn.comesaday.cw.service;

import java.util.List;
import cn.comesaday.cw.domain.Susc;

public interface SuscService {

	int getCount();

	List<Susc> findByPage(int beginCount, int pageSize);

	Susc findById(Integer id);

	void del(Integer id);

	void opsusc(Integer id, String string);

	void order(Susc susc);

	void suscState(Integer id);

	List<Susc> findByUid(Integer uid);

	double getMoney();

	void dealSusc(Integer id, String string);
}
