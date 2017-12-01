package org.yun.app.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DataSourceUtil {
	private static DataSourceUtil instance;

	private DataSourceUtil() {

	}

	public static DataSourceUtil getInstance() {
		if (instance == null) {
			instance = new DataSourceUtil();
		}
		return instance;
	}

	public Connection getConnection() {
		Connection conn = null;
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/jdbc/druid");
			conn = ds.getConnection();
		} catch (NamingException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	}

	public static void close(ResultSet rs, Statement stmt, Connection conn) {
		closeRes(rs);
		closeRes(stmt);
		closeRes(conn);
	}

	private static void closeRes(AutoCloseable ac) {
		if (ac != null) {
			try {
				ac.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ac = null;
		}
	}
}
