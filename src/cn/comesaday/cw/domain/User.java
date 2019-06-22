package cn.comesaday.cw.domain;

import java.util.HashSet;
import java.util.Set;

public class User {

	private Integer id;
	private String account;
	private String password;
	private String name;
	private String sex;
	private String phone;
	private String address;
	private String email;
	private boolean isvip;
	private boolean state;
	private Set<Express> expresses = new HashSet<Express>();
	private Set<Message> messages = new HashSet<Message>();
	private Set<Comment> comments = new HashSet<Comment>();
	private Set<Susc> suscs = new HashSet<Susc>(0);

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAccount() {
		return this.account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isIsvip() {
		return this.isvip;
	}

	public void setIsvip(boolean isvip) {
		this.isvip = isvip;
	}

	public boolean isState() {
		return this.state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public Set<Express> getExpresses() {
		return this.expresses;
	}

	public void setExpresses(Set<Express> expresses) {
		this.expresses = expresses;
	}

	public Set<Message> getMessages() {
		return this.messages;
	}

	public void setMessages(Set<Message> messages) {
		this.messages = messages;
	}

	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public Set<Susc> getSuscs() {
		return this.suscs;
	}

	public void setSuscs(Set<Susc> suscs) {
		this.suscs = suscs;
	}

}
