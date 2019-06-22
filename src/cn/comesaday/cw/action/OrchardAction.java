package cn.comesaday.cw.action;

import java.io.File;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.comesaday.cw.domain.Orchard;
import cn.comesaday.cw.service.OrchardService;
import cn.comesaday.cw.utils.FileUpload;

@Controller("orchardAction")
@Scope("prototype")
public class OrchardAction extends ActionSupport implements ModelDriven<Orchard>{

	private static final long serialVersionUID = 1L;
	private Orchard orchard = new Orchard();
	@Override
	public Orchard getModel() {
		// TODO Auto-generated method stub
		return orchard;
	}
	
	@Autowired
	private OrchardService orchardService;
	
	private List<File> picture;
	private List<String> pictureFileName;
	private List<String> pictureContentType;
	private String savePath = "/images/orc-img";
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


	public String mgr() throws Exception {
		orchard = orchardService.getInfo();
		if (orchard != null) {
			ActionContext.getContext().getValueStack().set("gorchard", orchard);
			return "orc_mgr_info";
		}
		return "orc_add_info";
	}

	public String addInfo() throws Exception {
		upload();
		boolean flag = orchardService.addInfo(orchard, pictureFileName);
		if (flag) {
			orchard = orchardService.getInfo();
			ActionContext.getContext().getValueStack().set("gorchard", orchard);
			return "orc_mgr_info";
		}
		addActionMessage("添加果园信息失败，请重新添加！");
		return "orc_add_info";
	}
	
	public String delInfo() throws Exception {
		if (orchardService.delInfo()) {
			return "orc_add_info";
		}
		addActionMessage("删除失败，请重新删除！");
		return "orc_mgr_info";
	}

	public String modInfoPage() throws Exception {
		orchard = orchardService.getInfo();
		ActionContext.getContext().getValueStack().set("gorchard", orchard);
		return "orc_mod_page";
	}
	
	public String modInfo() throws Exception {
	boolean flag = orchardService.modInfo(orchard, pictureFileName);
		if (flag == true) {
			upload();
			orchard = this.orchardService.getInfo();
			ActionContext.getContext().getValueStack().set("gorchard", orchard);
			addActionMessage("修改成功！");
			return "orc_mgr_info";
		}
		addActionMessage("修改失败，请重新修改！");
		return "orc_mgr_info";
	}
	
	private void upload() {
		// TODO Auto-generated method stub
		FileUpload.upload(picture, pictureFileName, pictureContentType, savePath);
	}
}
