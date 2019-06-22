package cn.comesaday.cw.domain;
import java.util.Date;

public class Express {

	private Integer id;
	private User user;
	private Tree tree;
	private String tnum;
	private Date stime;
	private String state;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTnum() {
		return this.tnum;
	}

	public void setTnum(String tnum) {
		this.tnum = tnum;
	}

	public Date getStime() {
		return this.stime;
	}

	public void setStime(Date stime) {
		this.stime = stime;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Tree getTree() {
		return tree;
	}

	public void setTree(Tree tree) {
		this.tree = tree;
	}

	@Override
	public String toString() {
		return "Express [id=" + id + ", user=" + user + ", tree=" + tree + ", tnum=" + tnum + ", stime=" + stime
				+ ", state=" + state + "]";
	}

}
