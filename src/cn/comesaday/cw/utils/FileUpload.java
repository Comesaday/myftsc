package cn.comesaday.cw.utils;

import java.io.File;
import java.util.List;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

public class FileUpload {
	public static void upload(List<File> picture, List<String> pictureFileName, List<String> pictureContentType,
			String savePath) {
		try {
			String realPath = ServletActionContext.getServletContext().getRealPath(savePath);
			File dir = new File(realPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}
			for (int i = 0; i < picture.size(); i++) {
				FileUtils.copyFile((File) picture.get(i), new File(dir, (String) pictureFileName.get(i)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
