package cn.comesaday.cw.action;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.comesaday.cw.domain.Admin;
import cn.comesaday.cw.service.AdminService;

@Controller("adminAction")
@Scope("prototype")
public class AdminAction extends ActionSupport implements ModelDriven<Admin>{

	private static final long serialVersionUID = 1L;
	private Admin admin = new Admin();
	@Override
	public Admin getModel() {
		// TODO Auto-generated method stub
		return admin;
	}

	private String newpass;
	
	public String getNewpass() {
		return newpass;
	}

	public void setNewpass(String newpass) {
		this.newpass = newpass;
	}

	@Autowired
	private AdminService adminService;
	
	public String login() {
		Admin existAdmin = adminService.login(admin);
		if(existAdmin != null) {
			HttpSession session = ServletActionContext.getRequest().getSession();
			session.setAttribute("admin", existAdmin);
			return "admin_log_success";
		}
		return "admin_log_fail";
	}
	
	public String checkPwd() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		if (this.adminService.login(admin) != null) {
			response.getWriter().write("0");
		} else {
			response.getWriter().write("1");
		}
		return null;
	}
	
	public String modInfo() throws Exception {
		admin.setPassword(newpass);
		adminService.modInfo(admin);
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("admin");
		
		return "admin_mod_success";
	}
	
	public String logOff() throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("adminUser");
		return "admin_log_off";
	}
}
