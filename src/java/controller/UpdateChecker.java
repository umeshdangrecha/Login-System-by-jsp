/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import db.MyDb;
import dto.User;
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
public class UpdateChecker extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fname = req.getParameter("fname");
        String lname = req.getParameter("lname");
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String city = req.getParameter("city");
        String state = req.getParameter("state");
        String zip = req.getParameter("zip");
        System.out.println(fname);
        User user = new User(fname, lname, username, password, city, state, zip);
        HttpSession session = req.getSession();
        
        PrintWriter out = resp.getWriter();
        if(CheckUser.checkUser(user,confirmPassword)){
            MyDb.updateUser(user,(int)session.getAttribute("id"));
            out.write("Success");
        }
        else{
            out.write("Failed");
        }
        
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.sendRedirect("update.jsp");
    }

}
