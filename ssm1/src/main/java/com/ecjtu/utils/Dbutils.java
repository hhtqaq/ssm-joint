package com.ecjtu.utils;


import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Connection;
import java.sql.SQLException;

public class Dbutils {
    private static ComboPooledDataSource dataSources;

    public ComboPooledDataSource getDataSources() {
        return dataSources;
    }

    public void setDataSources(ComboPooledDataSource dataSources) {
        this.dataSources = dataSources;
    }
    public static Connection getConnection() {
        Connection connection = null;
        try {
            connection =dataSources.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
    public static void main(String[] args) {
        ApplicationContext applicationContext=new ClassPathXmlApplicationContext("applicationContext.xml");
        Dbutils dbutils = (Dbutils) applicationContext.getBean("dbutils");
        System.out.println(dbutils.getConnection());
    }
}
