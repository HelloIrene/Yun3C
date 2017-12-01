/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月20日
* Time: 上午9:55:24
*/

package org.yun.app.entity;

import java.io.Serializable;

public class ProDetails implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3713800315611168709L;
	
	private Integer productID;
	private String productDetails;
	private String productCanshu;
	public Integer getProductID() {
		return productID;
	}
	public void setProductID(Integer productID) {
		this.productID = productID;
	}
	public String getProductDetails() {
		return productDetails;
	}
	public void setProductDetails(String productDetails) {
		this.productDetails = productDetails;
	}
	public String getProductCanshu() {
		return productCanshu;
	}
	public void setProductCanshu(String productCanshu) {
		this.productCanshu = productCanshu;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
