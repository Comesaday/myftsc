package cn.comesaday.cw.service;

import java.util.List;
import cn.comesaday.cw.domain.Orchard;

public interface OrchardService {

	public Orchard getInfo();

	public boolean delInfo();

	public boolean addInfo(Orchard orchard, List<String> pictureFileName);

	public boolean modInfo(Orchard orchard, List<String> pictureFileName);
}
