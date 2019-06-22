package cn.comesaday.cw.dao;

import java.util.List;

import cn.comesaday.cw.domain.Tree;

public interface TreeDao {

	Tree findById(Integer id);

	void optree(Integer id, String string);

	void del(Tree tree);

	void add(Tree tree, List<String> pictureFileName);

	void mod(Tree tree, List<String> pictureFileName);

	List<Tree> findByPage(int beginCount, int pageSize, Tree tree);

	int getCount(Tree tree);
}
