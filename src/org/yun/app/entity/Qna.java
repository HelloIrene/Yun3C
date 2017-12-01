/**
* Created by Eclipse.
* User: zyy
* Date: 2017年10月16日
* Time: 下午6:33:28
*/
package org.yun.app.entity;

import java.io.Serializable;

public class Qna implements Serializable{

	/**
	 * 问答的JavaBean
	 */
	private static final long serialVersionUID = 7802439650848267373L;
	
	private Integer questionID;//留言(问题)的编号
	private String question;//留言内容(即问题)
	private Integer questioner;//登录的用户编号(提问者)
	private String answer;//回答内容
	private Integer responder;//回答者
	private String userName;//用户名
	private String userEmail;//邮箱地址
	private String userTel;//联系方式
	public Integer getQuestionID() {
		return questionID;
	}
	public void setQuestionID(Integer questionID) {
		this.questionID = questionID;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public Integer getQuestioner() {
		return questioner;
	}
	public void setQuestioner(Integer questioner) {
		this.questioner = questioner;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Integer getResponder() {
		return responder;
	}
	public void setResponder(Integer responder) {
		this.responder = responder;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	
	
}
