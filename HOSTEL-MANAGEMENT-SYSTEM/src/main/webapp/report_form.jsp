<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate Reports - Hostel Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #8b5cf6;
            --primary-dark: #7c3aed;
            --primary-light: #ede9fe;
            --primary-lighter: #f5f3ff;
            --secondary-color: #ec4899;
            --secondary-dark: #db2777;
            --secondary-light: #fce7f3;
            --accent-color: #c084fc;
            --tertiary-color: #64748b;
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
            --background-color: #fdfbff;
            --surface-color: #ffffff;
            --text-primary: #1e1b3a;
            --text-secondary: #64748b;
            --text-muted: #94a3b8;
            --border-color: #e9d5ff;
            --border-light: #f3e8ff;
            --shadow-sm: 0 1px 2px 0 rgb(139 92 246 / 0.05);
            --shadow-md: 0 4px 6px -1px rgb(139 92 246 / 0.1), 0 2px 4px -2px rgb(139 92 246 / 0.1);
            --shadow-lg: 0 10px 15px -3px rgb(139 92 246 / 0.1), 0 4px 6px -4px rgb(139 92 246 / 0.1);
            --shadow-xl: 0 20px 25px -5px rgb(139 92 246 / 0.1), 0 8px 10px -6px rgb(139 92 246 / 0.1);
            --gradient-primary: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
            --gradient-secondary: linear-gradient(135deg, var(--secondary-color) 0%, var(--accent-color) 100%);
            --gradient-background: linear-gradient(135deg, var(--background-color) 0%, var(--primary-lighter) 50%, var(--secondary-light) 100%);
            --radius-sm: 0.375rem;
            --radius-md: 0.5rem;
            --radius-lg: 0.75rem;
            --radius-xl: 1rem;
            --radius-2xl: 1.5rem;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: var(--gradient-background);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            color: var(--text-primary);
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 80%, rgba(139, 92, 246, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 80% 20%, rgba(236, 72, 153, 0.15) 0%, transparent 50%),
                radial-gradient(circle at 40% 40%, rgba(192, 132, 252, 0.1) 0%, transparent 50%);
            pointer-events: none;
            z-index: -1;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: var(--radius-2xl);
            padding: 40px;
            max-width: 650px;
            width: 100%;
            box-shadow: 
                var(--shadow-xl),
                0 0 40px rgba(139, 92, 246, 0.15);
            border: 2px solid var(--border-light);
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-primary);
        }

        .container::after {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(139, 92, 246, 0.08) 0%, transparent 70%);
            border-radius: 50%;
            animation: float 8s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(5deg); }
        }

        .header {
            position: relative;
            z-index: 2;
            text-align: center;
            margin-bottom: 30px;
        }

        .header h2 {
            color: var(--primary-color);
            margin-bottom: 10px;
            font-size: 2rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            text-shadow: 0 2px 4px rgba(139, 92, 246, 0.1);
        }

        .header h2 i {
            color: var(--secondary-color);
            filter: drop-shadow(0 2px 4px rgba(236, 72, 153, 0.2));
        }

        .header p {
            font-size: 1rem;
            color: var(--text-secondary);
            margin-bottom: 25px;
            font-weight: 500;
        }

        .report-type-info {
            background: linear-gradient(135deg, var(--primary-lighter) 0%, var(--secondary-light) 100%);
            border-radius: var(--radius-lg);
            padding: 20px;
            margin-bottom: 30px;
            border: 1px solid var(--border-color);
            position: relative;
            z-index: 2;
        }

        .report-type-info h4 {
            color: var(--primary-dark);
            margin-bottom: 15px;
            font-size: 1.125rem;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .report-type-info h4 i {
            color: var(--secondary-color);
        }

        .report-type-info ul {
            list-style: none;
            padding-left: 0;
            margin-bottom: 0;
        }

        .report-type-info li {
            margin-bottom: 12px;
            padding: 8px 12px;
            background: rgba(255, 255, 255, 0.7);
            border-radius: var(--radius-md);
            border-left: 3px solid var(--accent-color);
            transition: all 0.3s ease;
            font-weight: 500;
            color: var(--text-primary);
        }

        .report-type-info li:hover {
            background: rgba(255, 255, 255, 0.9);
            transform: translateX(5px);
            box-shadow: 0 2px 8px rgba(139, 92, 246, 0.1);
        }

        .report-type-info li i {
            font-size: 8px;
            margin-right: 12px;
            color: var(--secondary-color);
            vertical-align: middle;
        }

        .form-container {
            display: flex;
            flex-direction: column;
            position: relative;
            z-index: 2;
        }

        .form-group {
            margin-bottom: 25px;
            position: relative;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--text-primary);
            font-size: 0.875rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        label i {
            color: var(--primary-color);
            font-size: 1rem;
            width: 16px;
            text-align: center;
            filter: drop-shadow(0 1px 2px rgba(139, 92, 246, 0.2));
        }

        select, input[type="text"], input[type="date"] {
            width: 100%;
            padding: 12px 16px;
            border-radius: var(--radius-lg);
            border: 2px solid var(--border-color);
            background: rgba(255, 255, 255, 0.9);
            color: var(--text-primary);
            outline: none;
            transition: all 0.3s ease;
            font-family: inherit;
            font-size: 0.875rem;
            font-weight: 500;
        }

        select:focus, input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.1);
            background: rgba(255, 255, 255, 1);
            transform: translateY(-1px);
        }

        select:hover, input:hover {
            border-color: var(--accent-color);
            box-shadow: 0 2px 8px rgba(139, 92, 246, 0.1);
        }

        select {
            cursor: pointer;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%238b5cf6' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='m6 8 4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 12px center;
            background-repeat: no-repeat;
            background-size: 16px;
            padding-right: 40px;
        }

        input::placeholder {
            color: var(--text-muted);
            font-weight: 400;
        }

        .date-range-container {
            display: flex;
            gap: 20px;
        }

        .date-range-container > div {
            flex: 1;
        }

        .date-range-container label {
            font-size: 0.8rem;
            color: var(--text-secondary);
            margin-bottom: 6px;
            font-weight: 500;
        }

        .conditional-field {
            display: none;
            opacity: 0;
            transform: translateY(-10px);
            transition: all 0.4s ease;
        }

        .conditional-field.show {
            display: block;
            opacity: 1;
            transform: translateY(0);
        }

        .submit-btn {
            margin-top: 25px;
            background: var(--gradient-primary);
            color: #fff;
            border: none;
            padding: 15px 24px;
            border-radius: var(--radius-lg);
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            box-shadow: 
                var(--shadow-md),
                0 0 20px rgba(139, 92, 246, 0.3);
            position: relative;
            overflow: hidden;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .submit-btn:hover {
            background: var(--gradient-secondary);
            transform: translateY(-2px);
            box-shadow: 
                var(--shadow-lg),
                0 0 30px rgba(139, 92, 246, 0.4);
        }

        .submit-btn:active {
            transform: translateY(0);
        }

        .submit-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.6s ease;
        }

        .submit-btn:hover::before {
            left: 100%;
        }

        .submit-btn.loading {
            background: linear-gradient(135deg, var(--text-muted) 0%, var(--tertiary-color) 100%);
            cursor: not-allowed;
            transform: none;
            box-shadow: var(--shadow-sm);
        }

        .submit-btn.loading::before {
            display: none;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 30px;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 600;
            font-size: 0.875rem;
            transition: all 0.3s ease;
            padding: 12px 20px;
            border-radius: var(--radius-lg);
            border: 2px solid transparent;
            background: rgba(139, 92, 246, 0.05);
            position: relative;
            z-index: 2;
        }

        .back-link:hover {
            color: var(--secondary-color);
            background: rgba(236, 72, 153, 0.05);
            border-color: var(--accent-color);
            transform: translateX(-3px);
            box-shadow: 0 4px 12px rgba(139, 92, 246, 0.15);
            text-decoration: none;
        }

        .back-link i {
            margin-right: 0;
            transition: transform 0.3s ease;
        }

        .back-link:hover i {
            transform: translateX(-2px);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 15px;
            }

            .container {
                padding: 30px 25px;
                margin: 10px 0;
            }

            .header h2 {
                font-size: 1.5rem;
                flex-direction: column;
                gap: 0.5rem;
            }

            .date-range-container {
                flex-direction: column;
                gap: 15px;
            }

            .report-type-info {
                padding: 15px;
            }
        }

        @media (max-width: 480px) {
            .container {
                padding: 25px 20px;
            }

            .header h2 {
                font-size: 1.25rem;
            }

            .header p {
                font-size: 0.875rem;
            }

            select, input[type="text"], input[type="date"] {
                padding: 10px 12px;
                font-size: 14px;
            }

            .submit-btn {
                padding: 12px 20px;
                font-size: 0.875rem;
            }
        }

        /* Enhanced Animation Effects */
        @keyframes slideInUp {
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
            animation: slideInUp 0.6s ease-out;
        }

        .form-group {
            animation: slideInUp 0.6s ease-out;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }

        /* Loading spinner animation */
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .fa-spinner {
            animation: spin 1s linear infinite;
        }

        /* Focus improvements for accessibility */
        select:focus-visible, input:focus-visible {
            outline: 3px solid var(--accent-color);
            outline-offset: 2px;
        }

        .submit-btn:focus-visible {
            outline: 3px solid rgba(139, 92, 246, 0.5);
            outline-offset: 2px;
        }

        /* Print styles */
        @media print {
            body {
                background: white;
            }
            
            body::before {
                display: none;
            }
            
            .container {
                box-shadow: none;
                border: 1px solid #ccc;
            }
            
            .container::after {
                display: none;
            }
            
            .back-link {
                display: none;
            }
        }
    </style>

    <script>
        function toggleFields() {
            var reportType = document.getElementById("reportType").value;
            var roomDiv = document.getElementById("roomNumberDiv");
            var dateDiv = document.getElementById("dateRangeDiv");

            roomDiv.classList.remove("show");
            dateDiv.classList.remove("show");

            setTimeout(() => {
                if (reportType === "roomWise") {
                    roomDiv.classList.add("show");
                } else if (reportType === "dateRange") {
                    dateDiv.classList.add("show");
                }
            }, 100);
        }

        function handleSubmit(event) {
            var submitBtn = document.querySelector('.submit-btn');
            submitBtn.classList.add('loading');
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Generating Report...';
        }

        window.onload = function () {
            toggleFields();
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="header">
            <h2><i class="fas fa-chart-line"></i> Generate Report</h2>
            <p>Create comprehensive reports for your hostel management</p>
        </div>

        <div class="report-type-info">
            <h4><i class="fas fa-info-circle"></i> Available Report Types</h4>
            <ul>
                <li><i class="fas fa-circle"></i>Students with pending fee payments</li>
                <li><i class="fas fa-circle"></i>Students residing in specific rooms</li>
                <li><i class="fas fa-circle"></i>Students admitted within date ranges</li>
            </ul>
        </div>

        <form action="report" method="post" onsubmit="handleSubmit(event)" class="form-container">
            <div class="form-group">
                <label for="reportType"><i class="fas fa-clipboard-list"></i> Select Report Type:</label>
                <select id="reportType" name="reportType" onchange="toggleFields()" required>
                    <option value="">-- Choose Report Type --</option>
                    <option value="pendingFees">Students with Pending Fees</option>
                    <option value="roomWise">Students in a Particular Room</option>
                    <option value="dateRange">Students Admitted in a Date Range</option>
                </select>
            </div>

            <div id="roomNumberDiv" class="conditional-field">
                <div class="form-group">
                    <label for="roomNumber"><i class="fas fa-door-open"></i> Room Number:</label>
                    <input type="text" id="roomNumber" name="roomNumber" placeholder="Enter room number (e.g., 101, A-204)">
                </div>
            </div>

            <div id="dateRangeDiv" class="conditional-field">
                <div class="form-group">
                    <label><i class="fas fa-calendar-alt"></i> Admission Date Range:</label>
                    <div class="date-range-container">
                        <div>
                            <label for="startDate">Start Date:</label>
                            <input type="date" id="startDate" name="startDate">
                        </div>
                        <div>
                            <label for="endDate">End Date:</label>
                            <input type="date" id="endDate" name="endDate">
                        </div>
                    </div>
                </div>
            </div>

            <button type="submit" class="submit-btn">
                <i class="fas fa-file-download"></i> Generate Report
            </button>
        </form>

        <a href="index.jsp" class="back-link">
            <i class="fas fa-arrow-left"></i> Back to Dashboard
        </a>
    </div>
</body>
</html>