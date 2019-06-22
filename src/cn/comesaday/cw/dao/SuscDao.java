package cn.comesaday.cw.dao;

import java.util.List;
import cn.comesaday.cw.domain.Susc;

public interface SuscDao {

	int getCount();

	List<Susc> findByPage(int beginCount, int pageSize);

	void opsusc(Integer id, String string);

	Susc findById(Integer id);

	void del(Integer id);

	void order(Susc susc);

	void suscState(Integer id);

	List<Susc> findByUid(Integer id);

	double getMoney();

	void dealSusc(Integer tid, String string);
}
