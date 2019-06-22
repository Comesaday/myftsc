package cn.comesaday.cw.action;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.comesaday.cw.domain.Susc;
import cn.comesaday.cw.service.ExpressService;
import cn.comesaday.cw.service.OrchardService;
import cn.comesaday.cw.service.SuscService;
import cn.comesaday.cw.service.TreeService;
import cn.comesaday.cw.utils.PageBean;

@Controller("suscAction")
@Scope("prototype")
public class SuscAction extends ActionSupport implements ModelDriven<Susc>{

	private static final long serialVersionUID = 1L;
	private Susc susc = new Susc();
	@Override
	public Susc getModel() {
		// TODO Auto-generated method stub
		return susc;
	}
	@Autowired
	private OrchardService orchardService;
	@Autowired
	private SuscService suscService;
	@Autowired
	private ExpressService expressService;
	@Autowired
	private TreeService treeService;
	private int page = 1;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	public String mgr() {
		if (orchardService.getInfo() != null) {
			int totalCount = suscService.getCount();
			if (totalCount == 0) {
				addActionMessage("还没有认购信息");
			}
			PageBean<Susc> pageBean = new PageBean<Susc>();
			pageBean.setTotalCount(totalCount);
			pageBean.setCurrentPage(page);
			int beginCount = pageBean.getBeginCount();
			int pageSize = pageBean.getPageSize();
			List<Susc> trees = suscService.findByPage(beginCount,pageSize);
			pageBean.setList(trees);
			
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			
			return "susc_mgr_info";
		}
		addActionMessage("请先添加果园信息！");
		return "orc_add_info";
	}
	
	public String order() throws Exception{
		suscService.order(susc);
		treeService.optree(susc.getTree().getId(), "wait");
		return "susc_my_center";
	}
	
	public String pay() throws Exception{
		Susc susc2 = suscService.findById(susc.getId());
		suscService.opsusc(susc2.getId(), "doing");
		treeService.optree(susc2.getTree().getId(), "doing");
		
		ActionContext.getContext().getValueStack().set("uid", susc2.getUser().getId());
		return "susc_my_susc";
	}
	
	public String cancel() throws Exception{
		Susc susc2 = suscService.findById(susc.getId());
		suscService.opsusc(susc2.getId(), "cancel");
		treeService.optree(susc2.getTree().getId(), "can");
		
		ActionContext.getContext().getValueStack().set("uid", susc2.getUser().getId());
		return "susc_my_susc";
	}
	
	public String del() throws Exception{
		Susc susc2 = suscService.findById(susc.getId());
		suscService.del(susc2.getId());
		
		ActionContext.getContext().getValueStack().set("uid", susc2.getUser().getId());
		return "susc_my_susc";
	}
	
	public String pick() throws Exception{
		Susc susc1 = suscService.findById(susc.getId());
		suscService.opsusc(susc1.getId(), "pick");
		expressService.express(susc1);
		
		return "susc_op_success";
	}
	
	public String search() throws Exception{
		List<Susc> list = suscService.findByUid(susc.getUser().getId());
		if (list != null&&list.size() > 0) {
			PageBean<Susc> pageBean = new PageBean<Susc>();
			pageBean.setTotalCount(1);
			pageBean.setCurrentPage(1);
			pageBean.setList(list);
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			addActionMessage("查询到该用户的认购信息");
			
			return "susc_mgr_info";
		}
		addActionMessage("未查询到该用户的认购信息");
		return "susc_op_success";
	}
}
