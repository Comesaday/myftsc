package cn.comesaday.cw.domain;

import java.util.HashSet;
import java.util.Set;

public class Tree {

	private Integer id;
	private Catagory catagory;
	private String picture1;
	private String picture2;
	private String picture3;
	private double price;
	private String tpoint;
	private String detail;
	private String state;
	private Set<Susc> suscs = new HashSet<Susc>();
	private Set<Express> expresses = new HashSet<Express>();
	private Set<Comment> comments = new HashSet<Comment>();
	private Set<Message> messages = new HashSet<Message>();

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Catagory getCatagory() {
		return this.catagory;
	}

	public void setCatagory(Catagory catagory) {
		this.catagory = catagory;
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

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getTpoint() {
		return this.tpoint;
	}

	public void setTpoint(String tpoint) {
		this.tpoint = tpoint;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Set<Susc> getSuscs() {
		return this.suscs;
	}

	public void setSuscs(Set<Susc> suscs) {
		this.suscs = suscs;
	}

	public Set<Express> getExpresses() {
		return expresses;
	}

	public void setExpresses(Set<Express> expresses) {
		this.expresses = expresses;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public Set<Message> getMessages() {
		return messages;
	}

	public void setMessages(Set<Message> messages) {
		this.messages = messages;
	}

}
