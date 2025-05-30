<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details - Hostel Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #8b5cf6;
            --primary-dark: #7c3aed;
            --primary-light: #f3e8ff;
            --secondary-color: #a855f7;
            --accent-pink: #ec4899;
            --accent-pink-light: #fce7f3;
            --success-color: #10b981;
            --warning-color: #f59e0b;
            --danger-color: #ef4444;
            --background-color: #faf5ff;
            --surface-color: #ffffff;
            --text-primary: #1e1b4b;
            --text-secondary: #6b46c1;
            --text-muted: #a78bfa;
            --border-color: #ddd6fe;
            --border-light: #f3e8ff;
            --shadow-sm: 0 1px 2px 0 rgba(139, 92, 246, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(139, 92, 246, 0.1), 0 2px 4px -2px rgba(139, 92, 246, 0.1);
            --shadow-lg: 0 10px 15px -3px rgba(139, 92, 246, 0.1), 0 4px 6px -4px rgba(139, 92, 246, 0.1);
            --shadow-xl: 0 20px 25px -5px rgba(139, 92, 246, 0.1), 0 8px 10px -6px rgba(139, 92, 246, 0.1);
            --radius-sm: 0.375rem;
            --radius-md: 0.5rem;
            --radius-lg: 0.75rem;
            --radius-xl: 1rem;
            --gradient-primary: linear-gradient(135deg, #8b5cf6 0%, #ec4899 50%, #7c3aed 100%);
            --gradient-secondary: linear-gradient(135deg, #a855f7 0%, #f472b6 100%);
            --gradient-light: linear-gradient(135deg, #f3e8ff 0%, #fce7f3 100%);
            --gradient-backdrop: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: var(--gradient-backdrop);
            color: var(--text-primary);
            line-height: 1.6;
            font-size: 14px;
            min-height: 100vh;
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--gradient-backdrop);
            z-index: -1;
        }

        .container {
            max-width: 1400px;
            margin: 2rem auto;
            padding: 0 1rem;
        }

        .main-card {
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(20px);
            border-radius: var(--radius-xl);
            box-shadow: 
                var(--shadow-xl),
                0 0 0 1px rgba(139, 92, 246, 0.1);
            overflow: hidden;
            border: 1px solid rgba(139, 92, 246, 0.1);
        }

        .header {
            background: var(--gradient-primary);
            color: white;
            padding: 2.5rem;
            position: relative;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: -50px;
            right: -50px;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .header::after {
            content: '';
            position: absolute;
            bottom: -30px;
            left: -30px;
            width: 150px;
            height: 150px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
            animation: float 4s ease-in-out infinite reverse;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(180deg); }
        }

        .header-content {
            position: relative;
            z-index: 2;
        }

        .header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 0.75rem;
            display: flex;
            align-items: center;
            gap: 1rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .header p {
            font-size: 1.1rem;
            opacity: 0.95;
            font-weight: 400;
        }

        .content-wrapper {
            padding: 2.5rem;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-bottom: 2.5rem;
        }

        .stat-card {
            background: var(--gradient-light);
            border: 2px solid var(--border-light);
            border-radius: var(--radius-xl);
            padding: 2rem;
            box-shadow: var(--shadow-md);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }

        .stat-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: var(--shadow-xl);
            border-color: var(--secondary-color);
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 6px;
            height: 100%;
            background: var(--gradient-secondary);
            border-radius: 0 4px 4px 0;
        }

        .stat-card::after {
            content: '';
            position: absolute;
            top: -50%;
            right: -20px;
            width: 100px;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(139, 92, 246, 0.03), transparent);
            transform: rotate(15deg);
            transition: all 0.4s ease;
        }

        .stat-card:hover::after {
            right: 100%;
        }

        .stat-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 1.5rem;
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: var(--radius-lg);
            background: var(--gradient-secondary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.5rem;
            box-shadow: var(--shadow-md);
            position: relative;
            z-index: 1;
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
            background: var(--gradient-primary);
            background-clip: text;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .stat-label {
            font-size: 1rem;
            color: var(--text-secondary);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .search-filter-section {
            background: var(--gradient-light);
            border-radius: var(--radius-xl);
            padding: 2rem;
            margin-bottom: 2.5rem;
            border: 2px solid var(--border-light);
            box-shadow: var(--shadow-sm);
        }

        .search-filter {
            display: flex;
            gap: 1.5rem;
            align-items: center;
            flex-wrap: wrap;
        }

        .search-container {
            flex: 1;
            min-width: 320px;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 1rem 1.25rem 1rem 3.5rem;
            border: 2px solid var(--border-color);
            border-radius: var(--radius-lg);
            font-size: 1rem;
            transition: all 0.3s ease;
            background: var(--surface-color);
            box-shadow: var(--shadow-sm);
        }

        .search-input:focus {
            outline: none;
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 4px var(--primary-light), var(--shadow-md);
            transform: translateY(-2px);
        }

        .search-icon {
            position: absolute;
            left: 1.25rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
            font-size: 1.25rem;
        }

        .filter-select {
            padding: 1rem 1.25rem;
            border: 2px solid var(--border-color);
            border-radius: var(--radius-lg);
            background: var(--surface-color);
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            min-width: 200px;
            color: var(--text-secondary);
            font-weight: 500;
            box-shadow: var(--shadow-sm);
        }

        .filter-select:focus {
            outline: none;
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 4px var(--primary-light), var(--shadow-md);
            transform: translateY(-2px);
        }

        .table-container {
            background: var(--surface-color);
            border-radius: var(--radius-xl);
            overflow: hidden;
            border: 2px solid var(--border-light);
            box-shadow: var(--shadow-lg);
            position: relative;
        }

        .table-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--gradient-primary);
        }

        .student-table {
            width: 100%;
            border-collapse: collapse;
        }

        .student-table thead {
            background: var(--gradient-primary);
            position: relative;
        }

        .student-table th {
            padding: 1.5rem 1.25rem;
            text-align: left;
            font-weight: 700;
            font-size: 0.95rem;
            color: white;
            white-space: nowrap;
            border: none;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            letter-spacing: 0.5px;
        }

        .student-table th i {
            margin-right: 0.75rem;
            opacity: 0.9;
            font-size: 1rem;
        }

        .student-table td {
            padding: 1.25rem;
            border-bottom: 1px solid var(--border-light);
            font-size: 0.95rem;
            vertical-align: middle;
            transition: all 0.2s ease;
        }

        .student-row {
            transition: all 0.3s ease;
            position: relative;
        }

        .student-row:hover {
            background: var(--gradient-light);
            transform: scale(1.01);
            box-shadow: 0 4px 12px rgba(139, 92, 246, 0.1);
        }

        .student-row:hover td {
            border-color: var(--secondary-color);
        }

        .student-row:last-child td {
            border-bottom: none;
        }

        .student-id {
            font-weight: 700;
            color: var(--primary-color);
            font-size: 1rem;
            background: var(--primary-light);
            padding: 0.5rem 0.75rem;
            border-radius: var(--radius-md);
            display: inline-block;
        }

        .student-name {
            font-weight: 600;
            color: var(--text-primary);
            font-size: 1rem;
        }

        .room-number {
            background: var(--gradient-secondary);
            color: white;
            padding: 0.5rem 1rem;
            border-radius: var(--radius-lg);
            font-weight: 600;
            font-size: 0.9rem;
            display: inline-block;
            box-shadow: var(--shadow-sm);
        }

        .fees-paid {
            color: var(--success-color);
            font-weight: 700;
            font-size: 1rem;
        }

        .fees-pending {
            color: var(--danger-color);
            font-weight: 700;
            font-size: 1rem;
        }

        .fees-pending.zero {
            color: var(--success-color);
        }

        .no-data {
            text-align: center;
            padding: 5rem 2rem;
            background: var(--gradient-light);
            border-radius: var(--radius-xl);
            margin: 2rem 0;
            border: 2px solid var(--border-light);
        }

        .no-data-icon {
            width: 120px;
            height: 120px;
            margin: 0 auto 2rem;
            background: var(--gradient-secondary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 3rem;
            box-shadow: var(--shadow-xl);
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .no-data h3 {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: var(--text-primary);
            background: var(--gradient-primary);
            background-clip: text;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .no-data p {
            color: var(--text-secondary);
            margin-bottom: 2.5rem;
            max-width: 500px;
            margin-left: auto;
            margin-right: auto;
            font-size: 1.1rem;
            line-height: 1.7;
        }

        .btn-container {
            margin-top: 2.5rem;
            text-align: center;
            padding-top: 2.5rem;
            border-top: 2px solid var(--border-light);
        }

        .btn {
            display: inline-flex;
            align-items: center;
            gap: 0.75rem;
            background: var(--gradient-primary);
            color: white;
            padding: 1rem 2rem;
            text-decoration: none;
            border-radius: var(--radius-lg);
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: var(--shadow-lg);
            border: none;
            cursor: pointer;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.5s ease;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-4px) scale(1.05);
            box-shadow: var(--shadow-xl);
            text-decoration: none;
            color: white;
        }

        .btn:active {
            transform: translateY(-2px) scale(1.02);
        }

        .btn i {
            font-size: 1.1rem;
        }

        /* Enhanced Responsive Design */
        @media (max-width: 768px) {
            .container {
                margin: 1rem auto;
                padding: 0 0.5rem;
            }

            .header {
                padding: 2rem 1.5rem;
            }

            .header h1 {
                font-size: 2rem;
            }

            .content-wrapper {
                padding: 2rem 1.5rem;
            }

            .stats-grid {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .search-filter {
                flex-direction: column;
                align-items: stretch;
            }

            .search-container {
                min-width: auto;
            }

            .filter-select {
                min-width: auto;
            }

            .table-container {
                overflow-x: auto;
            }

            .student-table {
                min-width: 700px;
            }

            .no-data {
                padding: 3rem 1.5rem;
            }

            .no-data-icon {
                width: 100px;
                height: 100px;
                font-size: 2.5rem;
            }
        }

        @media (max-width: 480px) {
            .header h1 {
                font-size: 1.75rem;
            }

            .stat-card {
                padding: 1.5rem;
            }

            .stat-number {
                font-size: 2rem;
            }

            .student-table th,
            .student-table td {
                padding: 1rem 0.75rem;
                font-size: 0.85rem;
            }

            .no-data h3 {
                font-size: 1.5rem;
            }
        }

        /* Enhanced Loading Animation */
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

        .main-card {
            animation: fadeInUp 0.8s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .stat-card {
            animation: fadeInUp 0.8s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .stat-card:nth-child(2) {
            animation-delay: 0.1s;
        }

        .stat-card:nth-child(3) {
            animation-delay: 0.2s;
        }

        .student-row {
            animation: fadeInUp 0.6s cubic-bezier(0.4, 0, 0.2, 1);
        }

        /* Enhanced Focus styles for accessibility */
        .btn:focus,
        .search-input:focus,
        .filter-select:focus {
            outline: 3px solid var(--accent-pink);
            outline-offset: 2px;
        }

        /* Print styles */
        @media print {
            body {
                background: white !important;
            }
            
            .search-filter-section,
            .btn-container {
                display: none;
            }
            
            .main-card {
                box-shadow: none;
                border: 2px solid var(--primary-color);
            }
            
            .header {
                background: var(--primary-light) !important;
                color: var(--text-primary) !important;
            }
            
            .stat-card {
                break-inside: avoid;
            }
        }

        /* Scrollbar Styling */
        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        ::-webkit-scrollbar-track {
            background: var(--border-light);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb {
            background: var(--gradient-secondary);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--primary-color);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="main-card">
        <div class="header">
            <div class="header-content">
                <h1><i class="fas fa-users"></i> Student Management</h1>
                <p>Comprehensive hostel student information system</p>
            </div>
        </div>

        <div class="content-wrapper">
            <%
                List<Student> studentList = (List<Student>) request.getAttribute("studentList");
                if (studentList == null || studentList.isEmpty()) {
            %>
            <div class="no-data">
                <div class="no-data-icon">
                    <i class="fas fa-user-slash"></i>
                </div>
                <h3>No Student Records Found</h3>
                <p>There are currently no students registered in the hostel management system. Get started by adding your first student.</p>
                <a href="studentadd.jsp" class="btn">
                    <i class="fas fa-user-plus"></i> Add Student
                </a>
            </div>
            <%
                } else {
                    int totalStudents = studentList.size();
                    double totalFeesPaid = 0, totalPendingFees = 0;
                    for (Student s : studentList) {
                        totalFeesPaid += s.getFeesPaid();
                        totalPendingFees += s.getPendingFees();
                    }
            %>

            <div class="stats-grid">
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon">
                            <i class="fas fa-users"></i>
                        </div>
                    </div>
                    <div class="stat-number" id="totalStudents"><%= totalStudents %></div>
                    <div class="stat-label">Total Students</div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                    </div>
                    <div class="stat-number"><%= String.format("%.2f", totalFeesPaid) %></div>
                    <div class="stat-label">Total Fees Collected</div>
                </div>
                <div class="stat-card">
                    <div class="stat-header">
                        <div class="stat-icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </div>
                    </div>
                    <div class="stat-number"><%= String.format("%.2f", totalPendingFees) %></div>
                    <div class="stat-label">Pending Fees</div>
                </div>
            </div>

            <div class="search-filter-section">
                <div class="search-filter">
                    <div class="search-container">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" id="searchInput" class="search-input" placeholder="Search students by name, ID, or room number...">
                    </div>
                    <select id="sortFilter" class="filter-select">
                        <option value="">Sort by...</option>
                        <option value="id">Student ID</option>
                        <option value="name">Name</option>
                        <option value="room">Room Number</option>
                        <option value="date">Admission Date</option>
                        <option value="pending">Pending Fees</option>
                    </select>
                </div>
            </div>

            <div class="table-container">
                <table class="student-table" id="studentsTable">
                    <thead>
                    <tr>
                        <th><i class="fas fa-id-card"></i> Student ID</th>
                        <th><i class="fas fa-user"></i> Name</th>
                        <th><i class="fas fa-door-open"></i> Room Number</th>
                        <th><i class="fas fa-calendar-alt"></i> Admission Date</th>
                        <th><i class="fas fa-check-circle"></i> Fees Paid</th>
                        <th><i class="fas fa-exclamation-triangle"></i> Pending Fees</th>
                    </tr>
                    </thead>
                    <tbody id="studentsTableBody">
                    <%
                        for (Student s : studentList) {
                    %>
                    <tr class="student-row">
                        <td><span class="student-id"><%= s.getStudentID() %></span></td>
                        <td class="student-name"><%= s.getStudentName() %></td>
                        <td><span class="room-number"><%= s.getRoomNumber() %></span></td>
                        <td><%= s.getAdmissionDate() %></td>
                        <td class="fees-paid"><%= String.format("%.2f", s.getFeesPaid()) %></td>
                        <td class="<%= s.getPendingFees() == 0 ? "fees-pending zero" : "fees-pending" %>">
                            <%= String.format("%.2f", s.getPendingFees()) %>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
            <% } %>

            <div class="btn-container">
                <a href="index.jsp" class="btn">
                    <i class="fas fa-home"></i> Back to Home
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById('searchInput').addEventListener('input', function () {
        const term = this.value.toLowerCase();
        document.querySelectorAll('.student-row').forEach(row => {
            row.style.display = row.textContent.toLowerCase().includes(term) ? '' : 'none';
        });
    });

    document.getElementById('sortFilter').addEventListener('change', function () {
        const key = this.value;
        const tbody = document.getElementById('studentsTableBody');
        const rows = Array.from(tbody.querySelectorAll('.student-row'));

        rows.sort((a, b) => {
            let valA, valB;
            switch (key) {
                case 'id':
                    valA = parseInt(a.cells[0].textContent); valB = parseInt(b.cells[0].textContent); break;
                case 'name':
                    valA = a.cells[1].textContent.toLowerCase(); valB = b.cells[1].textContent.toLowerCase(); break;
                case 'room':
                    valA = a.cells[2].textContent; valB = b.cells[2].textContent; break;
                case 'date':
                    valA = new Date(a.cells[3].textContent); valB = new Date(b.cells[3].textContent); break;
                case 'pending':
                    valA = parseFloat(a.cells[5].textContent.replace('$', '')); valB = parseFloat(b.cells[5].textContent.replace('$', '')); return valB - valA;
                default: return 0;
            }
            return valA > valB ? 1 : valA < valB ? -1 : 0;
        });

        rows.forEach(row => tbody.appendChild(row));
    });
</script>
</body>
</html>