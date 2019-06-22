package cn.comesaday.cw.service;

import java.util.List;

import cn.comesaday.cw.domain.Tree;

public interface TreeService {

	Tree findById(Integer id);

	void optree(Integer integer, String string);

	void del(Tree tree);

	void add(Tree tree, List<String> pictureFileName);

	void mod(Tree tree, List<String> pictureFileName);

	List<Tree> findByPage(int beginCount, int pageSize, Tree tree);

	int getCount(Tree tree);
}
