<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Wicked Profile Display</title>
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
            overflow-x: hidden;  
            overflow-y: auto;    
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

        .profile {
            position: relative;
            z-index: 1;
            background: rgba(20, 20, 25, 0.95);
            max-width: 600px;
            margin: auto;
            padding: 40px;
            border-radius: 20px;
            border: 1px solid #2df18c;
            box-shadow: 0 0 35px rgba(45,241,140,0.25), 0 0 60px rgba(228,109,255,0.15);
            animation: pulseGlow 4s ease-in-out infinite;
        }
        @keyframes pulseGlow {
            0%, 100% { box-shadow: 0 0 25px rgba(45,241,140,0.25), 0 0 60px rgba(228,109,255,0.15); }
            50% { box-shadow: 0 0 40px rgba(45,241,140,0.45), 0 0 90px rgba(228,109,255,0.35); }
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
        p {
            font-size: 16px;
            line-height: 1.7;
            color: #f0f0f0;
        }
        span {
            font-weight: 600;
            color: #aefac3;
            letter-spacing: 0.5px;
        }
        .back-btn {
            display: block;
            text-align: center;
            margin-top: 30px;
        }
        .back-btn a {
            color: #2df18c;
            text-decoration: none;
            padding: 10px 24px;
            border: 1px solid #2df18c;
            border-radius: 10px;
            transition: all 0.3s ease;
        }
        .back-btn a:hover {
            background: linear-gradient(135deg, #e46dff, #2df18c);
            box-shadow: 0 0 40px rgba(228,109,255,0.6);
            color: #0a0d0b;
        }
    </style>
</head>
<body>
    <div class="profile">
        <h2>My Profile</h2>
        <p><span>Name:</span> ${name}</p>
        <p><span>Student ID:</span> ${studentId}</p>
        <p><span>Program:</span> ${program}</p>
        <p><span>Email:</span> ${email}</p>
        <p><span>Hobbies:</span> ${hobbies}</p>
        <p><span>About Me:</span> ${intro}</p>

        <div class="back-btn">
            <a href="profile.html">← Back</a>
        </div>
    </div>
</body>
</html>
