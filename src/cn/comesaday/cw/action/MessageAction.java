package cn.comesaday.cw.action;

import java.io.File;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import cn.comesaday.cw.domain.Message;
import cn.comesaday.cw.domain.Tree;
import cn.comesaday.cw.service.MessageService;
import cn.comesaday.cw.service.SuscService;
import cn.comesaday.cw.utils.FileUpload;
import cn.comesaday.cw.utils.PageBean;

@Controller("messageAction")
@Scope("prototype")
public class MessageAction extends ActionSupport implements ModelDriven<Message>{

	private static final long serialVersionUID = 1L;
	private Message message = new Message();
	@Override
	public Message getModel() {
		// TODO Auto-generated method stub
		return message;
	}
	private int page = 1;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	private List<File> picture;
	private List<String> pictureFileName;
	private List<String> pictureContentType;
	private String savePath = "/images/msg-img";
	@Autowired
	private MessageService messageService;
	@Autowired
	private SuscService suscService;
	
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
	
	public String mgr() throws Exception{
		int totalCount = messageService.getCount();
		if (totalCount == 0) {
			PageBean<Tree> pageBean = new PageBean<Tree>(totalCount,null);
			pageBean.setCurrentPage(page);
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			this.addActionMessage("还没有认购消息");
			return "msg_mgr_info";
		}
		PageBean<Message> pageBean = new PageBean<Message>();
		pageBean.setTotalCount(totalCount);
		pageBean.setCurrentPage(page);
		int beginCount = pageBean.getBeginCount();
		int pageSize = pageBean.getPageSize();
		List<Message> list = messageService.findByPage(beginCount,pageSize);
		pageBean.setList(list);
		
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "msg_mgr_info";
	}
	
	public String sendpage() throws Exception{
		
		return "msg_send_page";
	}
	
	public String send() throws Exception{
		if (messageService.send(message,pictureFileName)) {
			FileUpload.upload(picture, pictureFileName, pictureContentType, savePath);
			suscService.suscState(message.getTree().getId());
			this.addActionMessage("发送成功");
			return "msg_op_info";
		}
		this.addActionMessage("发送失败");
		return "msg_op_info";
	}
	
	public String view() throws Exception{
		Message message2 = messageService.findById(message.getId());
		ActionContext.getContext().getValueStack().set("message", message2);
		
		return "msg_view_info";
	}
	
	public String search() throws Exception{
		List<Message> list = messageService.findByUid(message.getUser().getId());
		if (list != null&&list.size() > 0) {
			PageBean<Message> pageBean = new PageBean<Message>();
			pageBean.setTotalCount(1);
			pageBean.setCurrentPage(1);
			pageBean.setList(list);
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			addActionMessage("查询到该用户的认购消息");
			
			return "msg_mgr_info";
		}
		addActionMessage("未查询到该用户的认购消息");
		return "msg_op_success";
	}
}
