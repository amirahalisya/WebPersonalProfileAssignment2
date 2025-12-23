package com.profileweb;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.util.*;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    
   
    private static List<ProfileBean> profiles = new ArrayList<>();
    private static int nextId = 1;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String name = request.getParameter("name");
        String studentId = request.getParameter("studentId");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String intro = request.getParameter("intro");
        
       
        ProfileBean profile = new ProfileBean(name, studentId, program, email, hobbies, intro);
        profile.setId(nextId++);
        profiles.add(profile);
        
       
        HttpSession session = request.getSession();
        session.setAttribute("message", "✅ Profile saved successfully!");
        
        
        request.setAttribute("profile", profile);
        request.getRequestDispatcher("profile.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String deleteId = request.getParameter("deleteId");
        if (deleteId != null) {
            
            int id = Integer.parseInt(deleteId);
            Iterator<ProfileBean> iterator = profiles.iterator();
            while (iterator.hasNext()) {
                ProfileBean profile = iterator.next();
                if (profile.getId() == id) {
                    iterator.remove();
                    
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("message", "✅ Profile deleted successfully!");
                    break;
                }
            }
        }
        
        request.setAttribute("profiles", profiles);
        request.getRequestDispatcher("viewProfiles.jsp").forward(request, response);
    }
}