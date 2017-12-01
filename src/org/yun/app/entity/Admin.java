package org.yun.app.entity;

public class Admin {
	
	public int AdminID; 
	public String loginname;
	public String loginpwd;
	
	public int getAdminID() {
		return AdminID;
	}
	public void setAdminID(int AdminID) {
		this.AdminID = AdminID;
	}
	public String getLoginname() {
		return loginname;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public String getLoginpwd() {
		return loginpwd;
	}
	public void setLoginpwd(String loginpwd) {
		this.loginpwd = loginpwd;
	}
}
