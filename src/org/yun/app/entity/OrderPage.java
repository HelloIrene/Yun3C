/**
*Created by Eclipse
*User:mumu
*Date:2017年10月17日
*Time:上午11:33:58
*/
package org.yun.app.entity;

import java.io.Serializable;
import java.util.List;

public class OrderPage implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8637716116655375444L;
	private int userId;
	private String receiver;
	private String user_address;
	private String user_phone;
	private Order order;
	private List<OrderItem> orderItems;
	private List<Product> products;
	public OrderPage() {
		super();
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	public List<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
}
