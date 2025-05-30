<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reports - Hostel Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        :root {
            --primary-purple: #8B5FBF;
            --secondary-purple: #A569BD;
            --light-purple: #D7BDE2;
            --primary-pink: #E91E63;
            --secondary-pink: #F06292;
            --light-pink: #FCE4EC;
            --accent-gradient: linear-gradient(135deg, #8B5FBF, #E91E63);
            --background-gradient: linear-gradient(135deg, #F8F3FF, #FFF0F6);
            --card-shadow: 0 8px 32px rgba(139, 95, 191, 0.15);
            --hover-shadow: 0 12px 40px rgba(139, 95, 191, 0.25);
            --text-primary: #2C1810;
            --text-secondary: #6C5477;
            --border-color: #D7BDE2;
            --success-color: #27AE60;
            --info-gradient: linear-gradient(135deg, rgba(139, 95, 191, 0.1), rgba(233, 30, 99, 0.1));
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: var(--background-gradient);
            color: var(--text-primary);
            margin: 0;
            padding: 0;
            line-height: 1.6;
            min-height: 100vh;
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 24px;
            box-shadow: var(--card-shadow);
            border: 1px solid rgba(139, 95, 191, 0.1);
            animation: fadeInUp 0.6s ease-out;
        }

        .header {
            text-align: center;
            margin-bottom: 50px;
            padding-bottom: 30px;
            border-bottom: 2px solid var(--light-purple);
            position: relative;
        }

        .header::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 50%;
            transform: translateX(-50%);
            width: 100px;
            height: 4px;
            background: var(--accent-gradient);
            border-radius: 2px;
        }

        .header h2 {
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 2.8rem;
            font-weight: 700;
            margin-bottom: 15px;
            letter-spacing: -0.5px;
        }

        .header p {
            color: var(--text-secondary);
            font-size: 1.2rem;
            font-weight: 500;
            max-width: 800px;
            margin: 0 auto;
            line-height: 1.7;
        }

        .info-section {
            margin-bottom: 50px;
        }

        .info-section h4 {
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 30px;
            font-size: 1.8rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .info-section h4 i {
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 25px;
        }

        .info-item {
            background: var(--info-gradient);
            backdrop-filter: blur(10px);
            padding: 30px 20px;
            text-align: center;
            border-radius: 20px;
            color: var(--primary-purple);
            font-weight: 600;
            box-shadow: 0 4px 20px rgba(139, 95, 191, 0.1);
            border: 1px solid rgba(139, 95, 191, 0.2);
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }

        .info-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--accent-gradient);
        }

        .info-item:hover {
            transform: translateY(-8px);
            box-shadow: var(--hover-shadow);
            background: linear-gradient(135deg, rgba(139, 95, 191, 0.15), rgba(233, 30, 99, 0.15));
        }

        .info-item i {
            font-size: 32px;
            margin-bottom: 15px;
            display: block;
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .info-item span {
            font-size: 1rem;
            font-weight: 600;
        }

        .reports-section {
            margin-bottom: 50px;
        }

        .section-title {
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .section-title i {
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .reports-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
            justify-content: center;
        }

        .report-card {
            display: flex;
            flex-direction: row;
            text-decoration: none;
            color: var(--text-primary);
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: var(--card-shadow);
            border: 1px solid var(--border-color);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            max-width: 800px;
            width: 100%;
            position: relative;
        }

        .report-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.6s;
        }

        .report-card:hover::before {
            left: 100%;
        }

        .report-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: var(--hover-shadow);
            border-color: var(--secondary-purple);
        }

        .report-icon {
            background: var(--accent-gradient);
            color: white;
            padding: 40px 30px;
            font-size: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            min-width: 140px;
        }

        .report-icon::after {
            content: '';
            position: absolute;
            top: 0;
            right: 0;
            bottom: 0;
            width: 2px;
            background: rgba(255, 255, 255, 0.3);
        }

        .report-content {
            padding: 30px;
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .report-content h3 {
            margin: 0 0 15px;
            color: var(--primary-purple);
            font-size: 1.6rem;
            font-weight: 700;
            letter-spacing: -0.3px;
        }

        .report-content p {
            font-size: 1.1rem;
            color: var(--text-secondary);
            margin-bottom: 20px;
            line-height: 1.6;
            font-weight: 500;
        }

        .report-features {
            list-style: none;
            padding: 0;
            margin: 20px 0;
        }

        .report-features li {
            font-size: 1rem;
            margin: 10px 0;
            color: var(--text-primary);
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 500;
        }

        .report-features i {
            color: var(--success-color);
            font-size: 0.9rem;
            width: 16px;
        }

        .report-content .btn {
            margin-top: 20px;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 12px 20px;
            background: var(--accent-gradient);
            color: white;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 600;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(139, 95, 191, 0.3);
            align-self: flex-start;
        }

        .report-content .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(139, 95, 191, 0.4);
        }

        .navigation {
            text-align: center;
            margin-top: 40px;
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .nav-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }

        .nav-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .nav-btn:hover::before {
            left: 100%;
        }

        .nav-btn.primary {
            background: var(--accent-gradient);
            color: white;
            box-shadow: 0 4px 15px rgba(139, 95, 191, 0.3);
        }

        .nav-btn.primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(139, 95, 191, 0.4);
        }

        .nav-btn.secondary {
            background: rgba(255, 255, 255, 0.9);
            color: var(--primary-purple);
            border: 2px solid var(--secondary-purple);
            backdrop-filter: blur(10px);
        }

        .nav-btn.secondary:hover {
            transform: translateY(-3px);
            background: var(--light-purple);
            box-shadow: 0 8px 25px rgba(139, 95, 191, 0.2);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                margin: 20px;
                padding: 30px 20px;
            }

            .header h2 {
                font-size: 2.2rem;
            }

            .header p {
                font-size: 1.1rem;
            }

            .info-grid {
                grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
                gap: 20px;
            }

            .info-item {
                padding: 25px 15px;
            }

            .info-item i {
                font-size: 28px;
            }

            .report-card {
                flex-direction: column;
                max-width: 100%;
            }

            .report-icon {
                padding: 30px 20px;
                font-size: 40px;
                min-width: auto;
            }

            .report-icon::after {
                display: none;
            }

            .report-content {
                padding: 25px 20px;
            }

            .navigation {
                flex-direction: column;
                align-items: center;
            }

            .nav-btn {
                width: 100%;
                max-width: 300px;
                justify-content: center;
            }

            .section-title {
                font-size: 1.6rem;
                flex-direction: column;
                gap: 10px;
                text-align: center;
            }
        }

        @media (max-width: 480px) {
            .header h2 {
                font-size: 1.8rem;
            }

            .info-grid {
                grid-template-columns: 1fr;
            }

            .report-content h3 {
                font-size: 1.4rem;
            }

            .report-content p {
                font-size: 1rem;
            }
        }

        /* Loading Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .container {
            animation: fadeInUp 0.6s ease-out;
        }

        .info-item {
            animation: fadeInUp 0.6s ease-out;
            animation-fill-mode: both;
        }

        .info-item:nth-child(1) { animation-delay: 0.1s; }
        .info-item:nth-child(2) { animation-delay: 0.2s; }
        .info-item:nth-child(3) { animation-delay: 0.3s; }
        .info-item:nth-child(4) { animation-delay: 0.4s; }
        .info-item:nth-child(5) { animation-delay: 0.5s; }
        .info-item:nth-child(6) { animation-delay: 0.6s; }

        .report-card {
            animation: fadeInUp 0.8s ease-out;
            animation-delay: 0.7s;
            animation-fill-mode: both;
        }

        /* Print Styles */
        @media print {
            body {
                background: white;
                color: black;
            }

            .container {
                box-shadow: none;
                border: none;
                background: white;
            }

            .header h2,
            .section-title,
            .info-section h4 {
                color: var(--primary-purple) !important;
                -webkit-text-fill-color: var(--primary-purple) !important;
            }

            .report-card {
                break-inside: avoid;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            }

            .navigation {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2><i class="fas fa-chart-line"></i> Hostel Management Reports</h2>
            <p>Generate comprehensive reports to analyze your hostel operations, track student information, and monitor financial data with powerful filtering options.</p>
        </div>

        <div class="info-section">
            <h4><i class="fas fa-info-circle"></i> Report Capabilities</h4>
            <div class="info-grid">
                <div class="info-item">
                    <i class="fas fa-users"></i>
                    <span>Student Management</span>
                </div>
                <div class="info-item">
                    <i class="fas fa-money-bill-wave"></i>
                    <span>Fee Tracking</span>
                </div>
                <div class="info-item">
                    <i class="fas fa-door-open"></i>
                    <span>Room Allocation</span>
                </div>
                <div class="info-item">
                    <i class="fas fa-calendar-alt"></i>
                    <span>Date Range Analysis</span>
                </div>
                <div class="info-item">
                    <i class="fas fa-file-export"></i>
                    <span>Export Options</span>
                </div>
                <div class="info-item">
                    <i class="fas fa-print"></i>
                    <span>Print Ready</span>
                </div>
            </div>
        </div>

        <div class="reports-section">
            <h3 class="section-title">
                <i class="fas fa-clipboard-list"></i> Available Reports
            </h3>
            
            <div class="reports-grid">
                <a href="report_form.jsp" class="report-card">
                    <div class="report-icon">
                        <i class="fas fa-chart-bar"></i>
                    </div>
                    <div class="report-content">
                        <div>
                            <h3>Generate Custom Reports</h3>
                            <p>Create detailed reports with flexible filtering options to analyze your hostel data.</p>
                            
                            <ul class="report-features">
                                <li><i class="fas fa-check-circle"></i> Students with pending fees</li>
                                <li><i class="fas fa-check-circle"></i> Room-wise student allocation</li>
                                <li><i class="fas fa-check-circle"></i> Date range admission reports</li>
                                <li><i class="fas fa-check-circle"></i> Export to CSV format</li>
                                <li><i class="fas fa-check-circle"></i> Print-friendly layouts</li>
                            </ul>
                        </div>
                        
                        <div class="btn">
                            Start Generating <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>
            </div>
        </div>

        <div class="navigation">
            <a href="report_form.jsp" class="nav-btn primary">
                <i class="fas fa-plus-circle"></i>
                Generate New Report
            </a>
            <a href="index.jsp" class="nav-btn secondary">
                <i class="fas fa-home"></i>
                Back to Dashboard
            </a>
        </div>
    </div>
</body>
</html>