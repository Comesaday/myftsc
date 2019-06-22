package cn.comesaday.cw.domain;

import java.util.Date;

public class Comment {

	private Integer id;
	private User user;
	private Tree tree;
	private String picture1;
	private String picture2;
	private String picture3;
	private String comment;
	private Date ctime;

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

	public String getComment() {
		return this.comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getCtime() {
		return this.ctime;
	}

	public void setCtime(Date ctime) {
		this.ctime = ctime;
	}

	public Tree getTree() {
		return tree;
	}

	public void setTree(Tree tree) {
		this.tree = tree;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", user=" + user + ", tree=" + tree + ", picture1=" + picture1 + ", picture2="
				+ picture2 + ", picture3=" + picture3 + ", comment=" + comment + ", ctime=" + ctime + "]";
	}

}
