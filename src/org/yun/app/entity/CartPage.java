/**
*Created by Eclipse
*User:mumu
*Date:2017年10月15日
*Time:下午4:31:49
*/
package org.yun.app.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class CartPage implements Serializable{

	private static final long serialVersionUID = -5201104732034719974L;
	private int productId;
	private int cartId;//
	private String imagePath;//图片路径
	private String productName;//商品名字
	private String specificationsModel;//商品规格
	private BigDecimal price;//单价
	private int productNum;//商品数量
	private Date addTime;//添加时间
	public CartPage() {
		super();
	}
	
	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getSpecificationsModel() {
		return specificationsModel;
	}
	public void setSpecificationsModel(String specificationsModel) {
		this.specificationsModel = specificationsModel;
	}
	
	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Date getAddTime() {
		return addTime;
	}
	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
}
