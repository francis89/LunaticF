package spring.model.sharebbs_l;

import org.springframework.web.multipart.MultipartFile;

public class Sharebbs_lDTO {
	private int shareno;              
	private int shviewcnt;            
	private String shtitle;              
	private String shcontent;            
	private String shcategory;           
	private String shdate;          
	private String id;
	
	
	public int getShareno() {
		return shareno;
	}
	public void setShareno(int shareno) {
		this.shareno = shareno;
	}
	public String getShtitle() {
		return shtitle;
	}
	public void setShtitle(String shtitle) {
		this.shtitle = shtitle;
	}
	public String getShcontent() {
		return shcontent;
	}
	public void setShcontent(String shcontent) {
		this.shcontent = shcontent;
	}
	public String getShcategory() {
		return shcategory;
	}
	public void setShcategory(String shcategory) {
		this.shcategory = shcategory;
	}
	public String getShdate() {
		return shdate;
	}
	public void setShdate(String shdate) {
		this.shdate = shdate;
	}
	public int getShviewcnt() {
		return shviewcnt;
	}
	public void setShviewcnt(int shviewcnt) {
		this.shviewcnt = shviewcnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
                        
}