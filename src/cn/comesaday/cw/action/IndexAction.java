package cn.comesaday.cw.action;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cn.comesaday.cw.domain.Admin;
import cn.comesaday.cw.domain.Comment;
import cn.comesaday.cw.domain.Orchard;
import cn.comesaday.cw.service.AdminService;
import cn.comesaday.cw.service.CommentService;
import cn.comesaday.cw.service.OrchardService;

@Controller("indexAction")
@Scope("prototype")
public class IndexAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	@Autowired
	private OrchardService orchardService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private CommentService commentService;
	
	public String intro() {
		List<Comment> comments = commentService.getComments();
		ActionContext.getContext().getValueStack().set("comments", comments);
		pageInfo();
		return "index_intro_info";
	}
	
	public String orchard() {
		pageInfo();
		return "index_pic_info";
	}
	
	public String about() throws Exception{
		// TODO Auto-generated method stub
		pageInfo();
		return "index_about_info";
	}
	
	
	public void pageInfo() {
		Orchard orchard = orchardService.getInfo();
		Admin admin = adminService.getAdmin();
		
		ActionContext.getContext().getValueStack().set("admin", admin);
		ActionContext.getContext().getValueStack().set("orchard", orchard);
	}
	
	public String know() {
		pageInfo();
		return "index_susc_know";
	}
}
