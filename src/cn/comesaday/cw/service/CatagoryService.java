package cn.comesaday.cw.service;

import java.util.List;

import cn.comesaday.cw.domain.Catagory;

public interface CatagoryService {

	int getCounts();

	List<Catagory> findByPage(int beginCount, int pageSize);

	void del(Catagory catagory1);

	List<Catagory> getAll();

	boolean findByName(String name);

	boolean addCat(Catagory catagory);

	Catagory findById(Integer id);

	List<Catagory> findByPage(int i, int j, String name);

	int getCounts(String name);

	List<Integer> findSuscCatagories();
}
