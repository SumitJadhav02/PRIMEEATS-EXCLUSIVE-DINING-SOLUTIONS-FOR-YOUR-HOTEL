package com.shashi.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
    private static Connection conn;

    private DBUtil() {
        // Private constructor to prevent instantiation
    }

    public static Connection provideConnection() {
        try {
            if (conn == null || conn.isClosed()) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopping-cart", "root", "0212");
                    System.err.println("connection succesfull>>>>>>");
                } catch (ClassNotFoundException | SQLException e) {
                    e.printStackTrace();
                }
            }
            else
            {
            	System.err.println("connection NOT succesfull><><><><><><>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return conn;
    }

    public static void closeConnection(Connection con) {
        try {
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Add similar methods for closing PreparedStatement and ResultSet

    // ...

    public static void closeConnection(ResultSet rs) {
        try {
            if (rs != null && !rs.isClosed()) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void closeConnection(PreparedStatement ps) {
        try {
            if (ps != null && !ps.isClosed()) {
                ps.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
