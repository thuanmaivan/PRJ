package dao;

import java.util.*;
import model.*;

public class StatisticDAO extends MyDAO {

    public int userCount() {
        xSql = "select count(ID) as UserValue from Users";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if(rs.next()) {
                return rs.getInt("UserValue");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public int TotalIncome() {
        xSql = "select sum(TotalAmount) as AvgValue from Orders";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if(rs.next()) {
                return rs.getInt("AvgValue");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    
    public HashMap<String, Integer> IncomeByMonth() {
        HashMap<String, Integer> arr = new HashMap();
        xSql = "select sum(TotalAmount) as total, FORMAT(OrderDate, 'MMM') as date from Orders GROUP BY FORMAT(OrderDate, 'MMM') ORDER BY FORMAT(OrderDate, 'MMM')";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            while(rs.next()) {
                arr.put(rs.getString("date"), rs.getInt("total"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arr;
    }
    
    
    public int AvgIncome() {
        xSql = "select avg(TotalAmount) as AvgValue from Orders";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if(rs.next()) {
                return rs.getInt("AvgValue");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    public String MinIncome() {
        xSql = "SELECT TOP(1) sum(TotalAmount) as Total, FORMAT(OrderDate, 'MM-yyyy') as Date FROM Orders GROUP BY FORMAT(OrderDate, 'MM-yyyy') ORDER BY Total ASC";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if(rs.next()) {
                return   rs.getString("Date")  + " (" +rs.getInt("Total")+"VND)";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
    
    public String MaxIncome() {
        xSql = "SELECT TOP(1) sum(TotalAmount) as Total, FORMAT(OrderDate, 'MM-yyyy') as Date FROM Orders GROUP BY FORMAT(OrderDate, 'MM-yyyy') ORDER BY Total DESC";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if(rs.next()) {
                return   rs.getString("Date")  + " (" +rs.getInt("Total")+"VND)";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
    
    public int productCount() {
        xSql = "select count(ID) as ProductValue from Products";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();
            if(rs.next()) {
                return rs.getInt("ProductValue");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
}
