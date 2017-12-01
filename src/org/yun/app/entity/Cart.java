package org.yun.app.entity;

public class Cart {

	private int cartId;//购物车编码
	private int userId;//用户ID
	public Cart() {
		super();
	}
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
}
