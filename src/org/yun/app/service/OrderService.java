/**
*Created by Eclipse
*User:mumu
*Date:2017骞�10鏈�19鏃�
*Time:涓嬪崍8:53:18
*/
package org.yun.app.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.yun.app.dao.CommonDAOImpl;
import org.yun.app.entity.Order;

public class OrderService {
	/**
	 * 鏌ユ壘鎵�鏈夌殑璁㈠崟
	 * @return
	 */
	public List<Order> getAllOrder(){
		String sql = "SELECT * FROM tb_order ORDER BY userid";
		
		return getOrders(sql,null);
	}
	/**
	 * 鏌ユ壘鏌愪釜鐢ㄦ埛鐨勬墍鏈夎鍗�
	 */
	public List<Order> findOrdersByUserId(int userId){
		String sql = "SELECT * FROM tb_order WHERE userId=?";
		Object[] params = {userId};
		return getOrders(sql, params);
	}
	/**
	 * 鏌ユ壘鏌愪釜鏃堕棿鐨勬墍鏈夎鍗�
	 * @param date 鏌愪釜鏃堕棿鐐�
	 * @return
	 */
	public List<Order> findOrderByTime(Date date){
		String sql ="SELECT * FROM tb_order WHERE to_days(orderTime) = to_days(now())";
		SimpleDateFormat yMd = new SimpleDateFormat("yyyy-MM-dd");	
		Object[] params = {yMd.format(date)};
		return getOrders(sql, null);
	}
	/**
	 * 鏌ユ壘鏌愪釜鏃堕棿娈垫墍鏈夌殑璁㈠崟
	 * @param startTime 璧峰鏃堕棿
	 * @param endTime   缁撴潫鏃堕棿
	 * @return
	 */
	public List<Order> findOrderBetweenTime(Date startTime,Date endTime){
		String sql ="SELECT * FROM tb_order WHERE DATE_FORMAT(orderTime,'yyyy-MM-dd') in(?,?)";
		SimpleDateFormat yMd = new SimpleDateFormat("yyyy-MM-dd");	
		Object[] params = {yMd.format(startTime),yMd.format(endTime)};
		return getOrders(sql, params);
	}
	/**
	 * 寰楀埌order璁㈠崟锛屽鐞嗘暟鎹紝灏嗗叾鍏ㄩ儴杞寲涓簅rder
	 * @param sql
	 * @param params
	 * @return
	 */
	private List<Order> getOrders(String sql,Object[] params) {
		List<Object> tempOrders =  new CommonDAOImpl().findByCondition(Order.class, sql, params);
		if(null!=tempOrders){
			List<Order> orders = new ArrayList<>();
			for(int index=0;index<tempOrders.size();index++){
				Order tempOrder = (Order) tempOrders.get(index);
				orders.add(tempOrder);
			}
			return orders;
		}else{
			return null;
		}
	}
}
