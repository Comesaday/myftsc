package cn.comesaday.cw.action;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.comesaday.cw.domain.Express;
import cn.comesaday.cw.service.ExpressService;
import cn.comesaday.cw.service.OrchardService;
import cn.comesaday.cw.service.SuscService;
import cn.comesaday.cw.service.TreeService;
import cn.comesaday.cw.utils.PageBean;

@Controller("expressAction")
@Scope("prototype")
public class ExpressAction extends ActionSupport implements ModelDriven<Express>{

	private static final long serialVersionUID = 1L;
	private Express express = new Express();
	@Override
	public Express getModel() {
		// TODO Auto-generated method stub
		return express;
	}
	
	@Autowired
	private ExpressService expressService;
	@Autowired
	private OrchardService orchardService;
	@Autowired
	private TreeService treeService;
	@Autowired
	private SuscService suscService;

	private int page = 1;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public String mgr() {
		if (orchardService.getInfo() != null) {
			int totalCount = expressService.getCounts();
			if (totalCount == 0) {
				addActionMessage("还没有快递信息");
			}
			PageBean<Express> pageBean = new PageBean<Express>();
			pageBean.setTotalCount(totalCount);
			pageBean.setCurrentPage(page);
			int beginCount = pageBean.getBeginCount();
			int pageSize = pageBean.getPageSize();
			List<Express> expresses = expressService.findByPage(beginCount,pageSize);
			pageBean.setList(expresses);
			
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			
			return "exp_mgr_info";
		}
		addActionMessage("请先添加果园信息！");
		return "orc_add_info";
	}
	
	public String sendexppage() throws Exception{
		Express express2 = expressService.findById(express.getId());
		
		ActionContext.getContext().getValueStack().set("express", express2);
		return "exp_send_page";
	}
	
	public String addexp() throws Exception{
		expressService.addexp(express);
		treeService.optree(express.getTree().getId(), "not");
		suscService.dealSusc(express.getTree().getId(),"send");
		return "exp_op_success";
	}
	
	public String del() throws Exception{
		expressService.del(express.getId());
		
		return "exp_op_success";
	}
	
	public void collect() throws Exception{
		expressService.opexp(express.getId(),"over");
		Express express2 = expressService.findById(express.getId());
		treeService.optree(express2.getTree().getId(), "not");
		suscService.dealSusc(express2.getTree().getId(),"over");
	}
	
	public String search() throws Exception{
		List<Express> list = expressService.findByUid(express.getUser().getId());
		if (list != null&&list.size() > 0) {
			PageBean<Express> pageBean = new PageBean<Express>();
			pageBean.setTotalCount(1);
			pageBean.setCurrentPage(1);
			pageBean.setList(list);
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			addActionMessage("查询到该用户的快递信息");
			
			return "exp_mgr_info";
		}
		addActionMessage("未查询到该用户的快递信息");
		return "exp_op_success";
	}
}
