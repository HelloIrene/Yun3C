/**
* Created by Eclipse.
* User: zyy
* Date: 2017��10��16��
* Time: ����6:33:28
*/
package org.yun.app.entity;

import java.io.Serializable;

public class Qna implements Serializable{

	/**
	 * �ʴ��JavaBean
	 */
	private static final long serialVersionUID = 7802439650848267373L;
	
	private Integer questionID;//����(����)�ı��
	private String question;//��������(������)
	private Integer questioner;//��¼���û����(������)
	private String answer;//�ش�����
	private Integer responder;//�ش���
	private String userName;//�û���
	private String userEmail;//�����ַ
	private String userTel;//��ϵ��ʽ
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
