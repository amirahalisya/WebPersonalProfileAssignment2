<%-- 
    Document   : profile.jsp
    Created on : 24-Dec-2025, 04:50:47
    Author     : amirah
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.profileweb.ProfileBean" %>
<%
    ProfileBean profile = (ProfileBean) request.getAttribute("profile");
    String message = (String) session.getAttribute("message");
    if (message != null) {
        session.removeAttribute("message");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Saved</title>
    <style>
        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #08080b, #101e14, #2e0633);
            background-size: 300% 300%;
            animation: gradientShift 15s ease infinite;
            color: #f0f0f0;
            margin: 0;
            padding: 40px;
            position: relative;
        }

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: radial-gradient(circle, rgba(255,255,255,0.15) 1px, transparent 1px);
            background-size: 80px 80px;
            animation: sparkleMove 40s linear infinite;
            z-index: 0;
            opacity: 0.2;
        }
        @keyframes sparkleMove {
            from { background-position: 0 0; }
            to { background-position: 1000px 1000px; }
        }

        .profile-container {
            position: relative;
            z-index: 1;
            background: rgba(20, 20, 25, 0.95);
            max-width: 600px;
            margin: auto;
            padding: 40px;
            border-radius: 20px;
            border: 1px solid #2df18c;
            box-shadow: 0 0 35px rgba(45,241,140,0.25), 0 0 60px rgba(228,109,255,0.15);
        }

        h2 {
            text-align: center;
            color: #e46dff;
            font-weight: 600;
            border-bottom: 2px solid #2df18c;
            padding-bottom: 10px;
            text-shadow: 0 0 15px rgba(228,109,255,0.7);
            letter-spacing: 2px;
        }
        
        .success-message {
            text-align: center;
            color: #2df18c;
            background: rgba(45, 241, 140, 0.1);
            padding: 15px;
            border-radius: 10px;
            border: 1px solid #2df18c;
            margin: 20px 0;
            font-weight: 600;
        }
        
        .profile-details {
            margin: 25px 0;
        }
        
        .detail-item {
            padding: 12px 0;
            border-bottom: 1px solid rgba(45,241,140,0.2);
            display: flex;
        }
        
        .detail-label {
            font-weight: 600;
            color: #aefac3;
            min-width: 140px;
        }
        
        .detail-value {
            flex: 1;
            color: #f0f0f0;
        }
        
        .action-buttons {
            display: flex;
            gap: 15px;
            justify-content: center;
            margin-top: 30px;
        }
        
        .btn {
            padding: 12px 25px;
            background: linear-gradient(135deg, #e46dff, #2df18c);
            color: #0a0d0b;
            text-decoration: none;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(228,109,255,0.5);
        }
        
        .back-btn {
            background: linear-gradient(135deg, #a46dff, #2df1c8);
        }
        
        .error-message {
            text-align: center;
            color: #ff4757;
            padding: 30px;
            background: rgba(255,71,87,0.1);
            border-radius: 10px;
            border: 1px solid #ff4757;
            margin: 20px 0;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <h2>Profile Details</h2>
        
        <% if (message != null) { %>
            <div class="success-message">
                <%= message %>
            </div>
        <% } %>
        
        <% if (profile != null) { %>
        
        <div class="profile-details">
          
            
            <div class="detail-item">
                <div class="detail-label">Name:</div>
                <div class="detail-value"><%= profile.getName() %></div>
            </div>
            
            <div class="detail-item">
                <div class="detail-label">Student ID:</div>
                <div class="detail-value"><%= profile.getStudentId() %></div>
            </div>
            
            <div class="detail-item">
                <div class="detail-label">Program:</div>
                <div class="detail-value"><%= profile.getProgram() %></div>
            </div>
            
            <div class="detail-item">
                <div class="detail-label">Email:</div>
                <div class="detail-value"><%= profile.getEmail() %></div>
            </div>
            
            <div class="detail-item">
                <div class="detail-label">Hobbies:</div>
                <div class="detail-value"><%= profile.getHobbies() %></div>
            </div>
            
            <div class="detail-item">
                <div class="detail-label">Introduction:</div>
                <div class="detail-value"><%= profile.getIntro() %></div>
            </div>
        </div>
        
        <div class="action-buttons">
            <a href="profile.html" class="btn back-btn">← Back to Form</a>
            <a href="ProfileServlet" class="btn">View All Profiles</a>
        </div>
        
        <% } else { %>
        
        <div class="error-message">
            <h3>⚠️ No Profile Data Found</h3>
            <p>Please submit a profile first using the form.</p>
            <div class="action-buttons">
                <a href="profile.html" class="btn back-btn">← Back to Form</a>
            </div>
        </div>
        
        <% } %>
    </div>
</body>
</html>