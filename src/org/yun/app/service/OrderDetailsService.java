/**
*Created by Eclipse
*User:mumu
*Date:2017年10月20日
*Time:上午10:59:10
*/
package org.yun.app.service;

import java.util.ArrayList;
import java.util.List;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.OrderItem;
import org.yun.app.entity.OrderPage;
import org.yun.app.entity.Product;

public class OrderDetailsService {

	private CommonDAOImpl commDao = new CommonDAOImpl();

	public OrderPage getOrderPage(String orderId) {
		OrderPage orderPage = new OrderPage();
		String sql = "SELECT * FROM tb_orderitem WHERE orderId =?";
		Object[] params = {orderId};
		List<Object> tempOrderItems = commDao.findByCondition(OrderItem.class, sql, params);
		List<OrderItem> orderItems = new ArrayList<>();
		List<Product> products = new ArrayList<>();
		if (null == tempOrderItems) {
			return null;
		} else {
			for (int index = 0; index < tempOrderItems.size(); index++) {
				OrderItem temp = (OrderItem) tempOrderItems.get(index);
				Product tempPro = getProductByProductId(temp.getProductId());
				orderItems.add(temp);
				products.add(tempPro);
			}
		}
		orderPage.setOrderItems(orderItems);
		orderPage.setProducts(products);
		return orderPage;
	}

	private Product getProductByProductId(int productId) {
		String sql = "SELECT * FROM tb_product WHERE productID=?";
		List<Object> temProducts = commDao.findByCondition(Product.class, sql, new Object[] { productId });
		if (null == temProducts) {
			return null;
		}
		return (Product) temProducts.get(0);
	}
}
