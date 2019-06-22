package cn.comesaday.cw.action;

import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.comesaday.cw.domain.Catagory;
import cn.comesaday.cw.domain.Tree;
import cn.comesaday.cw.service.CatagoryService;

@Controller("catagoryAction")
@Scope("prototype")
public class CatagoryAction extends ActionSupport implements ModelDriven<Catagory>{

	private static final long serialVersionUID = 1L;
	private Catagory catagory = new Catagory();
	
	@Override
	public Catagory getModel() {
		// TODO Auto-generated method stub
		return catagory;
	}

	@Autowired
	private CatagoryService catagoryService;
	private int page = 1;
	public void setPage(int page) {
		this.page = page;
	}
	public int getPage() {
		return page;
	}
	
	public String del() throws Exception{
		Catagory catagory1 = catagoryService.findById(catagory.getId());
		Set<Tree> trees = catagory1.getTrees();
		if (trees != null&&trees.size() > 0) {
			this.addActionMessage("删除失败：存在该类别的果树！");
			return "cat_op_success";
		}else {
			this.addActionMessage("删除成功！");
			catagoryService.del(catagory1);
			return "cat_op_success";
		}
	}
	
	public void check() throws Exception {
		HttpServletResponse response = ServletActionContext.getResponse();
		if (catagoryService.findByName(catagory.getName())) {
			response.getWriter().write("0");
		} else {
			response.getWriter().write("1");
		}
	}	
	
	public String addpage() throws Exception{
		List<Catagory> catagories = catagoryService.getAll();
		ActionContext.getContext().getValueStack().set("catagories", catagories);
		
		return "cat_add_page";
	}	
	
	public String add() throws Exception{
		if (catagoryService.addCat(catagory)) {
			this.addActionMessage("添加成功！");
			return "cat_op_success";
		}
		this.addActionMessage("添加失败！");
		return "ftsc_op_fail";
	}
}
