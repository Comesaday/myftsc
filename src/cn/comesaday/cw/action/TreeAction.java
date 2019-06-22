package cn.comesaday.cw.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.comesaday.cw.domain.Admin;
import cn.comesaday.cw.domain.Catagory;
import cn.comesaday.cw.domain.Orchard;
import cn.comesaday.cw.domain.Tree;
import cn.comesaday.cw.service.AdminService;
import cn.comesaday.cw.service.CatagoryService;
import cn.comesaday.cw.service.OrchardService;
import cn.comesaday.cw.service.TreeService;
import cn.comesaday.cw.utils.FileUpload;
import cn.comesaday.cw.utils.PageBean;

@Controller("treeAction")
@Scope("prototype")
public class TreeAction extends ActionSupport implements ModelDriven<Tree>{

	private static final long serialVersionUID = 1L;
	private Tree tree = new Tree();
	@Override
	public Tree getModel() {
		// TODO Auto-generated method stub
		return tree;
	}
	@Autowired
	private TreeService treeService;
	@Autowired
	private CatagoryService catagoryService;
	@Autowired
	private OrchardService orchardService;
	@Autowired
	private AdminService adminService;
	private int page = 1;
	public void setPage(int page) {
		this.page = page;
	}

	public int getPage() {
		return page;
	}
	private String flag;
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getFlag() {
		return flag;
	}
	private List<File> picture;
	private List<String> pictureFileName;
	private List<String> pictureContentType;
	private String savePath = "/images/tree-img";
	public void setPicture(List<File> picture) {
		this.picture = picture;
	}
	public void setPictureFileName(List<String> pictureFileName) {
		this.pictureFileName = pictureFileName;
	}
	public void setPictureContentType(List<String> pictureContentType) {
		this.pictureContentType = pictureContentType;
	}
	
	
	public String mgr() {
		if (page == 1) {
			if (orchardService.getInfo() != null) {
				int totalCount = treeService.getCount(tree);
				if (totalCount == 0) {
					ActionContext.getContext().getValueStack().set("state1", "all");
					ActionContext.getContext().getValueStack().set("cid", null);
					addActionMessage("还没有果树信息");
					
					return "tree_op_over";
				}
				treelist(totalCount);
				ActionContext.getContext().getValueStack().set("state", tree.getState());
				ActionContext.getContext().getValueStack().set("cid", tree.getCatagory().getId());
				
				return "tree_mgr_info";
			}
			addActionMessage("请先添加果园信息！");
			
			return "orc_add_info";
		}else {
			int totalCount = treeService.getCount(tree);
			treelist(totalCount);
			
			return "tree_mgr_info";
		}
	}
	
	public String list() throws Exception{
		int totalCount = treeService.getCount(tree);
		pageInfo();
		//没有可认购的果树或未查询到某个类别的果树
		if (totalCount == 0) {
			PageBean<Tree> pageBean = new PageBean<Tree>();
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			pageBean.setTotalPage(1);
			pageBean.setCurrentPage(1);
			//没有可认购的果树
			if (tree.getCatagory().getId() == null) {
				cagInfo();
				return "tree_susc_info";
			}else {
				//未查询到某个类别的果树！
				ActionContext.getContext().getValueStack().set("cid", null);
				if (tree.getCatagory().getId() != 0) {
					addActionMessage("未查询到！");
				}
				return "tree_list_info";
			}
		}else {
			//显示所有可认购的果树或者查询到的果树
			if (tree.getCatagory().getId() != null) {
				if (tree.getCatagory().getId() == 0) {
					//未选择查询条件
					clearMessages();
					ActionContext.getContext().getValueStack().set("cid", null);
					return "tree_list_info";
				}else {
					//显示查询到的果树
					treelist(totalCount);
					return "tree_susc_info";
				}
			}else {
				//显示所有可认购的果树
				treelist(totalCount);
				return "tree_susc_info";
			}
		}
	}
	
	public String view() throws Exception{
		
		Tree thisTree = treeService.findById(tree.getId());
		pageInfo();
		ActionContext.getContext().getValueStack().set("tree",thisTree);
		
		return "tree_view_this";
	}
	
	public String addpage() throws Exception{
		cagInfo();
		return "tree_add_page";
	}
	
	public String add() throws Exception{
		treeService.add(tree,pictureFileName);
		FileUpload.upload(picture, pictureFileName, pictureContentType, savePath);

		ActionContext.getContext().getValueStack().set("cid", null);
		ActionContext.getContext().getValueStack().set("state1", "all");
		addActionMessage("添加成功！");
		return "tree_op_over";
	}
	
	public String susc() {
		String op = "can";
		addActionMessage("对外认购成功！");
		
		paraInfo();
		treeService.optree(tree.getId(),op);
		return "tree_op_over";
	}
	
	public String del() {
		addActionMessage("删除成功！");
		treeService.del(tree);
		
		paraInfo();
		return "tree_op_over";
	}
	
	public String modpage() {
		Tree tree1 = treeService.findById(tree.getId());
		cagInfo();
		ActionContext.getContext().getValueStack().set("tree", tree1);
		return "tree_mod_page";
	}
	
	public String mod() throws Exception{
		treeService.mod(tree,pictureFileName);

		ActionContext.getContext().getValueStack().set("cid", null);
		ActionContext.getContext().getValueStack().set("state1", "all");
		addActionMessage("修改成功！");
		return "tree_op_over";
	}
	
	private void treelist(int totalCount) {
		// TODO Auto-generated method stub
		PageBean<Tree> pageBean = new PageBean<Tree>();
		pageBean.setTotalCount(totalCount);
		pageBean.setCurrentPage(page);
		int beginCount = pageBean.getBeginCount();
		int pageSize = pageBean.getPageSize();
		List<Tree> trees = treeService.findByPage(beginCount,pageSize,tree);
		pageBean.setList(trees);
		paraInfo();
		cagInfo();
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
	}
	
	public void pageInfo() {
		Orchard orchard = orchardService.getInfo();
		Admin admin = adminService.getAdmin();
		
		ActionContext.getContext().getValueStack().set("orchard", orchard);
		ActionContext.getContext().getValueStack().set("admin", admin);
	}
	
	public void paraInfo() {
		ActionContext.getContext().getValueStack().set("cid", tree.getCatagory().getId());
		ActionContext.getContext().getValueStack().set("state1", tree.getState());
	}
	
	public void cagInfo() {
		List<Integer> catnum = catagoryService.findSuscCatagories();
		List<Catagory> catagories = new ArrayList<Catagory>();
		for (int i = 0; i < catnum.size(); i++) {
			Integer id = catnum.get(i);
			Catagory catagory = catagoryService.findById(id);
			catagories.add(catagory);
		}
		ActionContext.getContext().getValueStack().set("catagories", catagories);
	}
}
