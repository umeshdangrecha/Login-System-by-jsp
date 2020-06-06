/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import db.MyDb;
import dto.User;
/**
 *
 * @author umesh
 */
public class CheckUser {
    
    public static boolean checkUser(User user ,String confirmPassword){
        String fname = user.getFirstName();
        String lname = user.getLastName();
        String username = user.getUsername();
        String password = user.getPassword();
        String city = user.getCity();
        String state = user.getState();
        String zip = user.getZip();
        if(fname.equals("")||fname==null||lname.equals("")||lname==null||username.equals("")||username==null||city.equals("")
                ||city==null||state.equals("")||state==null||zip.equals("")||zip==null||password.equals("")||password==null
                ||confirmPassword.equals("")||confirmPassword==null||!confirmPassword.equals(password)){
            return false;
        }
        return true;
    }
    public static int checkLogin(String username,String password){
        if(username!=null&&!username.trim().equals("")){
          return MyDb.loginUser(username, password);
        }
        return -1;
    }
    
}
