package cn.comesaday.cw.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Catagory {

	private Integer id;
	private String name;
	private Date atime;
	private Set<Tree> trees = new HashSet<Tree>();

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getAtime() {
		return this.atime;
	}

	public void setAtime(Date atime) {
		this.atime = atime;
	}

	public Set<Tree> getTrees() {
		return this.trees;
	}

	public void setTrees(Set<Tree> trees) {
		this.trees = trees;
	}

	@Override
	public String toString() {
		return "Catagory [id=" + id + ", name=" + name + ", atime=" + atime + ", trees=" + trees + "]";
	}
	
}
