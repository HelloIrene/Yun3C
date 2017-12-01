/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月23日
* Time: 下午9:58:10
*/

package org.yun.app.entity;

import java.io.Serializable;
import java.math.BigDecimal;

public class IndexPic implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = -4839943935627132648L;
	private Integer tujianID;
	private Integer productID;
	private String word;
	private String fu_word;
	private BigDecimal price;
	private String imagPath;
	
	private String productName;
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getTujianID() {
		return tujianID;
	}
	public void setTujianID(Integer tujianID) {
		this.tujianID = tujianID;
	}
	public Integer getProductID() {
		return productID;
	}
	public void setProductID(Integer productID) {
		this.productID = productID;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getFu_word() {
		return fu_word;
	}
	public void setFu_word(String fu_word) {
		this.fu_word = fu_word;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public String getImagPath() {
		return imagPath;
	}
	public void setImagPath(String imagPath) {
		this.imagPath = imagPath;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
