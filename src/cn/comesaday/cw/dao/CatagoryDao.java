package cn.comesaday.cw.dao;

import java.util.List;

import cn.comesaday.cw.domain.Catagory;

public interface CatagoryDao {

	int getCounts();

	List<Catagory> findByPage(int beginCount, int pageSize);

	void del(Catagory catagory);

	List<Catagory> getAll();

	boolean findByName(String name);

	boolean addCat(Catagory catagory);

	Catagory findById(Integer id);

	List<Catagory> findByPage(int i, int j, String name);

	int getCounts(String name);

	List<Integer> findSuscCatagories();

}
