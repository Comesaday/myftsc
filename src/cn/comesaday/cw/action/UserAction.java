package cn.comesaday.cw.action;

import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.comesaday.cw.domain.Admin;
import cn.comesaday.cw.domain.Comment;
import cn.comesaday.cw.domain.Express;
import cn.comesaday.cw.domain.Message;
import cn.comesaday.cw.domain.Orchard;
import cn.comesaday.cw.domain.Susc;
import cn.comesaday.cw.domain.User;
import cn.comesaday.cw.service.AdminService;
import cn.comesaday.cw.service.OrchardService;
import cn.comesaday.cw.service.UserService;
import cn.comesaday.cw.utils.EmailHelper;
import cn.comesaday.cw.utils.PageBean;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User>{

	private static final long serialVersionUID = 1L;
	private User user = new User();
	@Override
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}
	
	@Autowired
	private UserService userService;
	@Autowired
	private OrchardService orchardService;
	@Autowired
	private AdminService adminService;
	
	private int page = 1;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	private String newpass;

	public String getNewpass() {
		return newpass;
	}
	public void setNewpass(String newpass) {
		this.newpass = newpass;
	}
	
	
	public  String mgr() {
		if (orchardService.getInfo() != null) {
			int totalCount = userService.getCount();
			PageBean<User> pageBean = new PageBean<User>();
			pageBean.setTotalCount(totalCount);
			pageBean.setCurrentPage(page);
			int beginCount = pageBean.getBeginCount();
			int pageSize = pageBean.getPageSize();
			List<User> users = userService.findByPage(beginCount,pageSize);
			pageBean.setList(users);
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			
			return "user_mgr_info";
		}
		addActionMessage("请先添加果园信息！");
		return "orc_add_info";
	}
	
	public String loginpage() throws Exception{
		pageInfo();
		return "user_login_page";
	}
	
	public String login() throws Exception {
		User user2 = userService.login(user);
		if (user2 != null) {
			if (user2.isState() == false) {
				addActionMessage("账号未激活，请点击查看邮件激活账号！");
				return "user_op_login";
			}
			ActionContext.getContext().getSession().put("user", user2);
			return "user_login_success";
		} 
		addActionMessage("账号或密码错误，请重新输入！");
		return "user_op_login";
	}
	
	public String exit() throws Exception {
		User user = (User) ActionContext.getContext().getSession().get("user");
		if (user != null) {
			ActionContext.getContext().getSession().remove("user");
			return "user_logout";
		}
		return "user_logout";
	}
	
	public String center() throws Exception {
		User user2 = getUser();
		if (user2 != null) {
			ActionContext.getContext().getValueStack().set("user", user2);
			return "user_my_center";
		}
		addActionMessage("登陆信息已过期！");
		return "user_login_page";
	}
	
	public String myinfo() throws Exception{
		
		User user2 = userService.findById(user.getId());
		ActionContext.getContext().getValueStack().set("user", user2);
		
		return "user_my_info";		
	}
	
	public String mysusc() throws Exception{
		User user2 = userService.findById(user.getId());
		Set<Susc> suscs = user2.getSuscs();
		ActionContext.getContext().getValueStack().set("suscs", suscs);
		return "user_my_suscs";
	}
	
	public String myexp() throws Exception{
		User user2 = userService.findById(user.getId());
		Set<Express> exps = user2.getExpresses();
		ActionContext.getContext().getValueStack().set("exps", exps);
		return "user_my_exps";
	}
	
	public String mycmt() throws Exception{
		User user2 = userService.findById(user.getId());
		Set<Comment> comments = user2.getComments();
		ActionContext.getContext().getValueStack().set("comments", comments);

		return "user_my_cmts";
	}
	
	public String mymsg() throws Exception{
		User user2 = userService.findById(user.getId());
		Set<Message> messages = user2.getMessages();
		
		ActionContext.getContext().getValueStack().set("messages", messages);
		return "user_my_msgs";
	}
	
	public void check() throws Exception{
		User user2 = userService.login(user);
		HttpServletResponse response = ServletActionContext.getResponse();
		if (user2 != null) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("0");
		}
	}
	
	public String repwd() throws Exception {
		if (userService.repwd(user.getId(),newpass)) {
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.removeAttribute("user");
			return "user_repwd_success";
		}
		return "user_my_center";
	}
	
	public String reinfopage() throws Exception{
		User user2 = userService.findById(user.getId());
		ActionContext.getContext().getValueStack().set("user", user2);
		return "user_info_page";
	}
	
	public String reinfo() throws Exception{
		userService.reinfo(user);
		ActionContext.getContext().getSession().put("user", user);
		return "user_update_success";
	}
	
	public String regpage() throws Exception{
		pageInfo();
		return "user_reg_page";
	}
	
	public void regcheck() throws Exception{
		User user2 = userService.regcheck(user.getAccount());
		HttpServletResponse response = ServletActionContext.getResponse();
		if(user2 != null) {
			response.getWriter().write("1");
		}else {
			response.getWriter().write("0");
		}
	}
	
	public String reg() throws Exception{
		if(userService.reg(user)) {
			EmailHelper.active(user.getEmail(), user.getId());
			addActionMessage("注册成功，请您去邮箱激活！");
			return "user_login_page";
		}
		addActionMessage("注册失败，请重新尝试！");
		return "user_reg_page";
	}
	
	public String active() throws Exception{
		if(userService.active(user.getId())) {
			addActionMessage("激活成功，请登录！");
			return "user_op_login";
		}
		addActionMessage("激活失败，请再次激活！");
		return "user_op_login";
	}
	
	public String modUserPage() {
		User user1 = userService.findById(user.getId());
		ActionContext.getContext().getValueStack().set("user", user1);
		return "user_mod_page";
	}
	
	public String modUser() {
		User user1 = userService.findById(user.getId());
		user1.setPassword(user.getPassword());
		userService.reg(user1);
		ActionContext.getContext().getValueStack().set("user", user1);
		addActionMessage("修改成功！");
		return "user_mod_success";
	}
	
	public void pageInfo() {
		Orchard orchard = orchardService.getInfo();
		Admin admin = adminService.getAdmin();
		
		ActionContext.getContext().getValueStack().set("admin", admin);
		ActionContext.getContext().getValueStack().set("orchard", orchard);
	}
	
	public User getUser() {
		User user2 = (User) ActionContext.getContext().getSession().get("user");
		return user2;
	}
	
	public String vippage() {
		
		return "user_vip_page";
	}
	
	public String vip() throws Exception{
		User user2 = userService.findById(user.getId());
		if (user2.isIsvip() == true) {
			addActionMessage("您已开通VIP！");
			ActionContext.getContext().getSession().remove("user");
			ActionContext.getContext().getSession().put("user", user2);
		}else {
			userService.openVip(user.getId());
			addActionMessage("VIP权限开通成功！");
		}
		return "user_open_vip";
	}
}
