package cn.comesaday.cw.action;

import java.io.File;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.comesaday.cw.domain.Comment;
import cn.comesaday.cw.service.CommentService;
import cn.comesaday.cw.service.OrchardService;
import cn.comesaday.cw.service.SuscService;
import cn.comesaday.cw.utils.FileUpload;
import cn.comesaday.cw.utils.PageBean;

@Controller("commentAction")
@Scope("prototype")
public class CommentAction extends ActionSupport implements ModelDriven<Comment>{

	private static final long serialVersionUID = 1L;
	private Comment comment = new Comment();
	@Override
	public Comment getModel() {
		// TODO Auto-generated method stub
		return comment;
	}
	
	@Autowired 
	private CommentService commentService;
	@Autowired
	private OrchardService orchardService;
	@Autowired
	private SuscService suscService;
	private List<File> picture;
	private List<String> pictureFileName;
	private List<String> pictureContentType;
	private String savePath = "/images/cmt-img";
	
	public List<File> getPicture() {
		return picture;
	}
	public void setPicture(List<File> picture) {
		this.picture = picture;
	}
	
	public List<String> getPictureFileName() {
		return pictureFileName;
	}
	public void setPictureFileName(List<String> pictureFileName) {
		this.pictureFileName = pictureFileName;
	}
	public List<String> getPictureContentType() {
		return pictureContentType;
	}
	public void setPictureContentType(List<String> pictureContentType) {
		this.pictureContentType = pictureContentType;
	}

	private int page = 1;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	public String mgr() {
		if (orchardService.getInfo() != null) {
			int totalCount = commentService.getCounts();
			if (totalCount == 0) {
				addActionMessage("还没有评价信息");
			}
			PageBean<Comment> pageBean = new PageBean<Comment>();
			pageBean.setTotalCount(totalCount);
			pageBean.setCurrentPage(page);
			int beginCount = pageBean.getBeginCount();
			int pageSize = pageBean.getPageSize();
			List<Comment> comments = commentService.findByPage(beginCount,pageSize);
			pageBean.setList(comments);
			
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			
			return "cmt_mgr_info";
		}
		addActionMessage("请先添加果园信息！");
		return "orc_add_info";
	}
	
	public String cmtpage() throws Exception{
		
		return "cmt_cmt_page";
	}
	
	public String comment() throws Exception{
		if(commentService.comment(comment,pictureFileName)) {
			if (picture != null&&picture.size() > 0) {
				FileUpload.upload(picture, pictureFileName, pictureContentType, savePath);
			}
			suscService.dealSusc(comment.getTree().getId(), "cmtover");
		}
		ActionContext.getContext().getValueStack().set("uid", comment.getUser().getId());
		return "cmt_my_cmt";
	}
	
	public String search() throws Exception{
		List<Comment> list = commentService.findByUid(comment.getUser().getId());
		if (list != null&&list.size() > 0) {
			PageBean<Comment> pageBean = new PageBean<Comment>();
			pageBean.setTotalCount(1);
			pageBean.setCurrentPage(1);
			pageBean.setList(list);
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			addActionMessage("查询到该用户的评价信息");
			
			return "cmt_mgr_info";
		}
		addActionMessage("未查询到该用户的评价信息");
		return "cmt_search_info";
	}


}
