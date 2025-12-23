<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.profileweb.ProfileBean" %>
<%
    List<ProfileBean> profiles = (List<ProfileBean>) request.getAttribute("profiles");
    String message = (String) session.getAttribute("message");
    if (message != null) {
        session.removeAttribute("message");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Student Profiles</title>
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

        .container {
            position: relative;
            z-index: 1;
            max-width: 900px;
            margin: auto;
            background: rgba(20, 20, 25, 0.9);
            padding: 30px;
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
            margin-bottom: 30px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th {
            background: linear-gradient(135deg, #2df18c, #38ffb3);
            color: #0a0d0b;
            padding: 15px;
            text-align: left;
            font-weight: 600;
        }

        td {
            padding: 12px 15px;
            border-bottom: 1px solid rgba(56,255,179,0.2);
        }

        tr:hover {
            background: rgba(56,255,179,0.1);
        }

        .delete-btn {
            background: #ff4757;
            color: white;
            border: none;
            padding: 8px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 600;
            font-size: 14px;
            transition: all 0.3s;
        }

        .delete-btn:hover {
            background: #ff2e43;
            transform: scale(1.05);
            box-shadow: 0 0 10px rgba(255,71,87,0.5);
        }

        .nav-back {
            margin-bottom: 20px;
        }

        .back-btn {
            padding: 10px 20px;
            background: linear-gradient(135deg, #a46dff, #2df1c8);
            color: #0a0d0b;
            text-decoration: none;
            border-radius: 10px;
            font-weight: 600;
            transition: all 0.3s;
            display: inline-block;
        }

        .back-btn:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(164,109,255,0.5);
        }

        .empty-msg {
            text-align: center;
            padding: 40px;
            color: #aefac3;
            font-size: 18px;
        }
        
        .message-box {
            background: rgba(45, 241, 140, 0.1);
            color: #2df18c;
            padding: 15px;
            border-radius: 10px;
            border: 1px solid #2df18c;
            margin-bottom: 20px;
            text-align: center;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="profile.html" class="back-btn">← Back to Form</a>
        
        <h2>📋 All Student Profiles</h2>
        
        <% if (message != null) { %>
            <div class="message-box">
                <%= message %>
            </div>
        <% } %>
        
        <% if (profiles != null && !profiles.isEmpty()) { %>
        
        <table>
            <thead>
                <tr>
                    
                    <th>Name</th>
                    <th>Student ID</th>
                    <th>Program</th>
                    <th>Email</th>
                    <th>Hobbies</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% for (ProfileBean profile : profiles) { %>
                <tr>
                    
                    <td><%= profile.getName() %></td>
                    <td><%= profile.getStudentId() %></td>
                    <td><%= profile.getProgram() %></td>
                    <td><%= profile.getEmail() %></td>
                    <td><%= profile.getHobbies() %></td>
                    <td>
                        <button type="button" class="delete-btn" 
                                onclick="if(confirm('Delete <%= profile.getName() %> (ID: <%= profile.getStudentId() %>)?')) {
                                    window.location='ProfileServlet?deleteId=<%= profile.getId() %>'
                                }">
                            🗑️ Delete
                        </button>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        
        <div style="margin-top: 25px; padding: 15px; background: rgba(56,255,179,0.1); border-radius: 10px; text-align: center;">
            <p>📊 <strong>Total Profiles:</strong> <%= profiles.size() %></p>
        </div>
        
        <% } 
    else { %>
        
        <div class="empty-msg">
            📭 No profiles found. <a href="profile.html" style="color:#38ffb3;">Create the first profile!</a>
        </div>
        
        <% } %>
    </div>
</body>
</html>