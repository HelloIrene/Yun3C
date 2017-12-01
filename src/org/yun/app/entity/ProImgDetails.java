/**
* Created by Eclipse.
* User: Ross
* Date: 2017年10月20日
* Time: 上午9:45:53
*/

package org.yun.app.entity;

import java.io.Serializable;

public class ProImgDetails implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -9200312694270417339L;
	private Integer imgID;
	private Integer productID;
	private String imgPath;
	public Integer getImgID() {
		return imgID;
	}
	public void setImgID(Integer imgID) {
		this.imgID = imgID;
	}
	public Integer getProductID() {
		return productID;
	}
	public void setProductID(Integer productID) {
		this.productID = productID;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
