/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.profileweb;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.sql.*;

@WebServlet("/DeleteProfileServlet")
public class DeleteProfileServlet extends HttpServlet {
    
    private Connection getConnection() throws Exception {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            return DriverManager.getConnection("jdbc:derby://localhost:1527/sample;create=true", "app", "app");
        } catch (Exception e) {
            return DriverManager.getConnection("jdbc:derby:profileDB;create=true", "app", "app");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        
        if (id != null) {
            try {
                Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement("DELETE FROM profile WHERE id = ?");
                pstmt.setInt(1, Integer.parseInt(id));
                pstmt.executeUpdate();
                pstmt.close();
                conn.close();
                
                HttpSession session = request.getSession();
                session.setAttribute("message", "✅ Profile deleted from database!");
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        response.sendRedirect("ProfileServlet");
    }
}