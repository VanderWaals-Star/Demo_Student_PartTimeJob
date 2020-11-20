package main;

import database.Database;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class main {
    public static void main(String[] args) throws SQLException {
        Statement statement = Database.getStatement();
        ResultSet resultSet = statement.executeQuery("select * from region_information");
        while (resultSet.next()){
            System.out.println(resultSet.getString("Areaname"));
        }
    }
}
