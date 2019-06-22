package cn.comesaday.cw.domain;

import java.util.Date;

public class Message {

	private Integer id;
	private User user;
	private Tree tree;
	private String movie;
	private String picture1;
	private String picture2;
	private String picture3;
	private String content;
	private Date stime;

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

	public String getMovie() {
		return this.movie;
	}

	public void setMovie(String movie) {
		this.movie = movie;
	}

	public String getPicture1() {
		return this.picture1;
	}

	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}

	public String getPicture2() {
		return this.picture2;
	}

	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}

	public String getPicture3() {
		return this.picture3;
	}

	public void setPicture3(String picture3) {
		this.picture3 = picture3;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Tree getTree() {
		return tree;
	}

	public void setTree(Tree tree) {
		this.tree = tree;
	}

	public Date getStime() {
		return stime;
	}

	public void setStime(Date stime) {
		this.stime = stime;
	}

}
