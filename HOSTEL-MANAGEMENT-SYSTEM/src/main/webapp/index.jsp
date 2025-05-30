<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hostel Management System - Dashboard</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            position: relative;
            overflow-x: hidden;
            
            /* Alvas Engineering College Official Campus Background */
            background: 
                linear-gradient(135deg, rgba(102, 126, 234, 0.9) 0%, rgba(118, 75, 162, 0.85) 100%),
                url('https://www.aiet.org.in/wp-content/uploads/2019/08/banner-1024x443.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        /* Animated background elements */
        body::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.05) 1px, transparent 1px);
            background-size: 80px 80px;
            animation: drift 30s ease-in-out infinite;
            pointer-events: none;
            z-index: 0;
        }

        body::after {
            content: '';
            position: absolute;
            top: 15%;
            left: -5%;
            width: 400px;
            height: 400px;
            background: radial-gradient(circle, rgba(255,255,255,0.06) 30%, transparent 70%);
            border-radius: 50%;
            animation: float 20s ease-in-out infinite;
            pointer-events: none;
            z-index: 0;
        }

        /* Additional floating elements for more depth */
        .floating-element {
            position: absolute;
            pointer-events: none;
            z-index: 0;
        }

        .floating-element:nth-child(1) {
            top: 10%;
            right: 15%;
            width: 200px;
            height: 200px;
            background: radial-gradient(circle, rgba(255,255,255,0.04) 40%, transparent 70%);
            border-radius: 50%;
            animation: float 25s ease-in-out infinite reverse;
        }

        .floating-element:nth-child(2) {
            bottom: 20%;
            left: 10%;
            width: 150px;
            height: 150px;
            background: radial-gradient(circle, rgba(255,255,255,0.03) 50%, transparent 80%);
            border-radius: 50%;
            animation: drift 35s ease-in-out infinite;
        }

        @keyframes drift {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-40px) rotate(180deg); }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) translateX(0px) scale(1); }
            33% { transform: translateY(-30px) translateX(30px) scale(1.05); }
            66% { transform: translateY(30px) translateX(-30px) scale(0.95); }
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(25px);
            -webkit-backdrop-filter: blur(25px);
            border-radius: 32px;
            padding: 48px;
            max-width: 520px;
            width: 100%;
            text-align: center;
            position: relative;
            z-index: 10;
            box-shadow: 
                0 40px 80px rgba(0, 0, 0, 0.15),
                0 0 0 1px rgba(255, 255, 255, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.4);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 6px;
            background: linear-gradient(90deg, #667eea, #764ba2, #f093fb, #f5576c, #4facfe, #00f2fe);
            background-size: 400% 100%;
            border-radius: 32px 32px 0 0;
            animation: gradientShift 10s ease infinite;
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .header {
            margin-bottom: 48px;
        }

        h1 {
            font-size: 2.8rem;
            font-weight: 800;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 12px;
            letter-spacing: -1px;
            line-height: 1.1;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .subtitle {
            color: #64748b;
            font-size: 1.1rem;
            font-weight: 400;
            margin-bottom: 8px;
        }

        .welcome-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.12), rgba(118, 75, 162, 0.12));
            color: #667eea;
            padding: 10px 18px;
            border-radius: 50px;
            font-size: 0.9rem;
            font-weight: 500;
            border: 1px solid rgba(102, 126, 234, 0.25);
            margin-top: 16px;
            backdrop-filter: blur(10px);
        }

        .nav-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 16px;
            margin-top: 32px;
        }

        .nav-item {
            display: flex;
            align-items: center;
            padding: 20px 24px;
            border-radius: 18px;
            text-decoration: none;
            background: linear-gradient(135deg, rgba(248, 250, 252, 0.95), rgba(241, 245, 249, 0.95));
            backdrop-filter: blur(10px);
            color: #1e293b;
            font-weight: 600;
            font-size: 1.05rem;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(226, 232, 240, 0.8);
            group: true;
        }

        .nav-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #667eea, #764ba2);
            transition: left 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            z-index: -1;
        }

        .nav-item:hover::before {
            left: 0;
        }

        .nav-item:hover {
            color: white;
            transform: translateY(-6px) scale(1.02);
            box-shadow: 0 25px 50px rgba(102, 126, 234, 0.3);
            border-color: transparent;
        }

        .nav-item:active {
            transform: translateY(-3px) scale(1.01);
        }

        .nav-icon {
            font-size: 1.4rem;
            margin-right: 16px;
            width: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .nav-item:hover .nav-icon {
            transform: scale(1.15) rotate(8deg);
        }

        .nav-text {
            flex: 1;
            text-align: left;
        }

        .nav-arrow {
            font-size: 1rem;
            opacity: 0.6;
            transition: all 0.3s ease;
        }

        .nav-item:hover .nav-arrow {
            transform: translateX(6px);
            opacity: 1;
        }

        /* Individual item colors with enhanced shadows */
        .nav-item:nth-child(1):hover {
            box-shadow: 0 25px 50px rgba(16, 185, 129, 0.35);
        }
        
        .nav-item:nth-child(1)::before {
            background: linear-gradient(135deg, #10b981, #059669);
        }

        .nav-item:nth-child(2):hover {
            box-shadow: 0 25px 50px rgba(59, 130, 246, 0.35);
        }
        
        .nav-item:nth-child(2)::before {
            background: linear-gradient(135deg, #3b82f6, #2563eb);
        }

        .nav-item:nth-child(3):hover {
            box-shadow: 0 25px 50px rgba(239, 68, 68, 0.35);
        }
        
        .nav-item:nth-child(3)::before {
            background: linear-gradient(135deg, #ef4444, #dc2626);
        }

        .nav-item:nth-child(4):hover {
            box-shadow: 0 25px 50px rgba(168, 85, 247, 0.35);
        }
        
        .nav-item:nth-child(4)::before {
            background: linear-gradient(135deg, #a855f7, #9333ea);
        }

        .nav-item:nth-child(5):hover {
            box-shadow: 0 25px 50px rgba(245, 158, 11, 0.35);
        }
        
        .nav-item:nth-child(5)::before {
            background: linear-gradient(135deg, #f59e0b, #d97706);
        }

        .stats-row {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px;
            margin-top: 32px;
            margin-bottom: 16px;
        }

        .stat-card {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.08), rgba(118, 75, 162, 0.08));
            backdrop-filter: blur(10px);
            border: 1px solid rgba(102, 126, 234, 0.2);
            border-radius: 14px;
            padding: 18px;
            text-align: center;
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.15);
        }

        .stat-number {
            font-size: 1.5rem;
            font-weight: 700;
            color: #667eea;
            margin-bottom: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .stat-label {
            font-size: 0.8rem;
            color: #64748b;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            body {
                background-attachment: scroll;
            }
            
            .container {
                padding: 32px 24px;
                margin: 10px;
                max-width: 100%;
                border-radius: 24px;
            }

            h1 {
                font-size: 2.2rem;
            }

            .nav-item {
                padding: 18px 20px;
                font-size: 1rem;
            }

            .nav-icon {
                font-size: 1.2rem;
                margin-right: 12px;
            }

            .stats-row {
                grid-template-columns: 1fr;
                gap: 12px;
            }
        }

        @media (max-width: 480px) {
            h1 {
                font-size: 1.9rem;
            }
            
            .subtitle {
                font-size: 1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Additional floating elements -->
    <div class="floating-element"></div>
    <div class="floating-element"></div>

    <div class="container">
        <div class="header">
            <h1>
                <i class="fas fa-building-columns"></i>
                Hostel Management
            </h1>
            <p class="subtitle">Streamlined student accommodation management</p>
            <div class="welcome-badge">
                <i class="fas fa-shield-alt"></i>
                Admin Dashboard
            </div>
        </div>

        
        
        
        
        
        
        
        <nav class="nav-grid">
            <a href="studentadd.jsp" class="nav-item">
                <i class="fas fa-user-plus nav-icon"></i>
                <span class="nav-text">Add New Student</span>
                <i class="fas fa-chevron-right nav-arrow"></i>
            </a>

            <a href="studentupdate.jsp" class="nav-item">
                <i class="fas fa-user-edit nav-icon"></i>
                <span class="nav-text">Update Student Info</span>
                <i class="fas fa-chevron-right nav-arrow"></i>
            </a>

            <a href="studentdelete.jsp" class="nav-item">
                <i class="fas fa-user-minus nav-icon"></i>
                <span class="nav-text">Remove Student</span>
                <i class="fas fa-chevron-right nav-arrow"></i>
            </a>

            <a href="displayStudents" class="nav-item">
                <i class="fas fa-users nav-icon"></i>
                <span class="nav-text">View All Students</span>
                <i class="fas fa-chevron-right nav-arrow"></i>
            </a>

            <a href="report_form.jsp" class="nav-item">
                <i class="fas fa-chart-bar nav-icon"></i>
                <span class="nav-text">Generate Reports</span>
                <i class="fas fa-chevron-right nav-arrow"></i>
            </a>
        </nav>
    </div>
</body>
</html>