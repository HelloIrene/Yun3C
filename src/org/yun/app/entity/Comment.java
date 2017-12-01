/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月16日
* Time: 下午3:05:08
*/

package org.yun.app.entity;

import java.io.Serializable;
import java.sql.Timestamp;

public class Comment implements Serializable{

	/**
	 * 评论的javaBean
	 */
	private static final long serialVersionUID = 420404799889732255L;
	private Integer commentID;
	private Integer productID;
	private String commentTitle;
	private String content;
	private int star;
	private Integer userID;
	private String userName;
	private Timestamp addTime;
	
	public String getCommentTitle() {
		return commentTitle;
	}
	public void setCommentTitle(String commentTitle) {
		this.commentTitle = commentTitle;
	}
	public Integer getCommentID() {
		return commentID;
	}
	public void setCommentID(Integer commentID) {
		this.commentID = commentID;
	}
	public Integer getProductID() {
		return productID;
	}
	public void setProductID(Integer productID) {
		this.productID = productID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Timestamp getAddTime() {
		return addTime;
	}
	public void setAddTime(Timestamp addTime) {
		this.addTime = addTime;
	}

}
