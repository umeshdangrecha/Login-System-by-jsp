/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import dto.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author umesh
 */
public class MyDb {

    private static Connection connection = null;
    static{
       try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/umesh","umesh","umesh");
                System.out.println("Connection");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            } 
    }
    

//    public static boolean openConnection(){
//        if(connection==null){
//            try {
//                Class.forName("com.mysql.jdbc.Driver");
//                connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/umesh","umesh","umesh");
//                System.out.println("Connection");
//            } catch (ClassNotFoundException | SQLException e) {
//                e.printStackTrace();
//                return false;
//            }
//        }
//        return true;
//    }
//    public static void closeConnection(){
//        if(connection!=null){
//            try {
//                connection.close();
//            } catch (SQLException throwables) {
//                throwables.printStackTrace();
//            }
//        }
//        
//    }

    public static boolean registerUser(User user){
        String query = "insert into LoginSystem (First_Name, Last_Name,Username,Password,City,State,Zip) values (" +
                "'"+user.getFirstName()+"',"+"'"+user.getLastName()+"',"+"'"+user.getUsername()+"',"+"'"+user.getPassword()+"',"+
                "'"+user.getCity()+"',"+"'"+user.getState()+"',"+"'"+user.getZip()+"'"+
                ")";
        try {
            if(connection!=null){
                Statement st = connection.createStatement();
                st.execute(query);
                return true;
            }
        } catch (SQLException throwables) {
            System.out.println(throwables.getMessage());
            throwables.printStackTrace();
        }
        return false;
    }
    public static int loginUser(String username,String password){
        String query = "select Password,Sr_No from loginsystem where username = '"+username+"'";
        try {
            if(connection!=null){
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(query);
                if(rs.next())
                    if(rs.getString(1).equals(password)){
                        return rs.getInt(2);
                    }
            }
        } catch (SQLException throwables) {
            System.out.println(throwables.getMessage());
            throwables.printStackTrace();
        }
        return -1;
    }
    
    public static User getUser(int id){
         String query = "select First_Name, Last_Name,Username,City,State,Zip from loginsystem where Sr_No = "+id ;
        User user = null;
        try {
            if(connection!=null){
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(query);
                if(rs.next()){
                    user = new User();
                    user.setFirstName(rs.getString(1));
                    user.setLastName(rs.getString(2));
                    user.setUsername(rs.getString(3));
                    user.setCity(rs.getString(4));
                    user.setState(rs.getString(5));
                    user.setZip(rs.getString(6));
                }
            }
        } catch (SQLException throwables) {
            System.out.println(throwables.getMessage());
            throwables.printStackTrace();
        }
        return user;
    }
    public static List<User> getAllUsers(){
        String query = "select First_Name, Last_Name,Username,City,State,Zip from loginsystem";
        User user = null;
        List<User> list = new ArrayList<>();
        try {
            if(connection!=null){
                Statement st = connection.createStatement();
                ResultSet rs = st.executeQuery(query);
                while(rs.next()){
                    user = new User();
                    user.setFirstName(rs.getString(1));
                    user.setLastName(rs.getString(2));
                    user.setUsername(rs.getString(3));
                    user.setCity(rs.getString(4));
                    user.setState(rs.getString(5));
                    user.setZip(rs.getString(6));
                    list.add(user);
                }
            }
        } catch (SQLException throwables) {
            System.out.println(throwables.getMessage());
            throwables.printStackTrace();
        }
        return list;
    }
    
        
     public static boolean updateUser(User user,int id){
       String query = "update LoginSystem set First_Name='"+user.getFirstName()+"', Last_Name='"+user.getLastName()+
                "', Username='"+user.getUsername()+"', Password='"+user.getPassword()+
                "', City='"+user.getCity()+"', State='"+user.getState()+"',  Zip='"+user.getZip()+"' where Sr_No = "+id;
         System.out.println(id);
        try {
            if(connection!=null){
                Statement st = connection.createStatement();
                st.execute(query);
                return true;
            }
        } catch (SQLException throwables) {
            System.out.println(throwables.getMessage());
            throwables.printStackTrace();
        }
        return false;
    }
    
}
