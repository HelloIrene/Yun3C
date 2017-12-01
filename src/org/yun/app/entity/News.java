/**
* Created by Eclipse.
* User: zyy
* Date: 2017年10月18日
* Time: 下午3:27:19
*/


package org.yun.app.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class News implements Serializable{

	private static final long serialVersionUID = 2556461134751172133L;
	/**
	 * 新闻的JavaBean
	 */
	
	private Integer newID;
	private String title;
	private String content;
	private Timestamp addTime;
	private String editor;
	private String pic;
	private String lead;
	public Integer getNewID() {
		return newID;
	}
	public void setNewID(Integer newID) {
		this.newID = newID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getAddTime() {
		return addTime;
	}
	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public String getLead() {
		return lead;
	}
	public void setLead(String lead) {
		this.lead = lead;
	}
	
	
}
