/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.MyDb;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CheckUser;

/**
 *
 * @author umesh
 */
public class LoginChecker extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
           
        int id = CheckUser.checkLogin(username, password);
        if(id!=-1){
            HttpSession session = req.getSession();
            session.setAttribute("username", username);
            session.setAttribute("id", id);
            
            resp.sendRedirect("index.jsp");
        }
        else{
           resp.sendRedirect("login.html"); 
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("login.html");
    }
    
    
}
