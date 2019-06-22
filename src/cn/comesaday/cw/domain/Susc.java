package cn.comesaday.cw.domain;

import java.util.Date;

public class Susc {

	private Integer id;
	private Tree tree;
	private User user;
	private Date stime;
	private double desposit;
	private double other;
	private boolean message;
	private String state;

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Tree getTree() {
		return this.tree;
	}

	public void setTree(Tree tree) {
		this.tree = tree;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getStime() {
		return this.stime;
	}

	public void setStime(Date stime) {
		this.stime = stime;
	}

	public double getDesposit() {
		return this.desposit;
	}

	public void setDesposit(double desposit) {
		this.desposit = desposit;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public double getOther() {
		return other;
	}

	public void setOther(double other) {
		this.other = other;
	}

	public boolean isMessage() {
		return message;
	}

	public void setMessage(boolean message) {
		this.message = message;
	}

}
