/**
*Created by Eclipse
*User:mumu
*Date:2017年10月17日
*Time:下午6:56:13
*/
package org.yun.app.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class CreateOrderNo {

	private static CreateOrderNo instance;
	private int initNum = 1;// 每一个小时清零一次从000001开始

	private Date flagDate;// 每小时对比的时间
	private static SimpleDateFormat yMdH = new SimpleDateFormat("yyyyMMddHH");

	/**
	 * 取得CreateOrderNo的单例实现
	 * 
	 * @return
	 */
	public static CreateOrderNo getInstance() {
		if (instance == null) {
			synchronized (CreateOrderNo.class) {
				if (instance == null) {
					instance = new CreateOrderNo();
				}
			}
		}
		return instance;
	}

	public CreateOrderNo() {

	}

	/**
	 * 检验时间是否改变，即一小时改变一次
	 */
	private void checkChangeDay() {
		if (flagDate == null || !(yMdH.format(new Date()).equals(yMdH.format(flagDate)))) {
			flagDate = new Date();
			initNum = 1;
		}
	}

	public String createOrderNo() {
		return getYMdH() + getSerialNumber();
	}

	private String getSerialNumber() {
		checkChangeDay();
		StringBuffer stringBuffer = new StringBuffer();
		String tempNum = "" + initNum;
		int numPlaces = tempNum.toString().length();
		// 数字位数小于需要补全的总位数，需要补全0
		if (numPlaces < 6) {
			for (int i = 0; i < 6 - numPlaces; i++) {
				stringBuffer.append("0");
			}
			stringBuffer.append(tempNum);
		} else {
			stringBuffer.append(tempNum);
		}
		initNum++;
		return stringBuffer.toString();
	}

	private String getYMdH() {
		long time = new Date().getTime();
		Date date = new Date(time);
		return yMdH.format(date);
	}

	/**
	 * 当服务器宕机后或则其他因素导致程序重启，如果在
	 * 一个小时内（整时内，11:30发生意外，12:00内）重新运行程序
	 * 需在后台手工设置订单流水号的起始值
	 * @param initNum
	 */
	public void setInitNum(int initNum) {
		this.initNum = initNum;
	}
}
