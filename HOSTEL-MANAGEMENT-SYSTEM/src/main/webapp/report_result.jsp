<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Student" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Results - Hostel Management System</title>
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
            --warning-color: #F39C12;
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: var(--background-gradient);
            color: var(--text-primary);
            margin: 0;
            padding: 30px;
            line-height: 1.6;
            min-height: 100vh;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 24px;
            padding: 40px;
            max-width: 1200px;
            margin: auto;
            box-shadow: var(--card-shadow);
            border: 1px solid rgba(139, 95, 191, 0.1);
            transition: all 0.3s ease;
        }

        .header {
            text-align: center;
            margin-bottom: 40px;
            padding-bottom: 20px;
            border-bottom: 2px solid var(--light-purple);
        }

        .header h2 {
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
            letter-spacing: -0.5px;
        }

        .header p {
            color: var(--text-secondary);
            margin-bottom: 0;
            font-size: 1.1rem;
            font-weight: 500;
        }

        .no-results {
            text-align: center;
            padding: 80px 40px;
            border: 2px dashed var(--secondary-purple);
            border-radius: 20px;
            background: linear-gradient(135deg, rgba(139, 95, 191, 0.05), rgba(233, 30, 99, 0.05));
            margin: 20px 0;
        }

        .no-results i {
            font-size: 64px;
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 20px;
            display: block;
        }

        .no-results h3 {
            color: var(--primary-purple);
            font-size: 1.8rem;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .no-results p {
            color: var(--text-secondary);
            font-size: 1.1rem;
        }

        .results-summary {
            display: flex;
            align-items: center;
            gap: 20px;
            margin-bottom: 30px;
            background: linear-gradient(135deg, rgba(139, 95, 191, 0.08), rgba(233, 30, 99, 0.08));
            border-left: 5px solid var(--primary-purple);
            padding: 20px 25px;
            border-radius: 16px;
            backdrop-filter: blur(5px);
        }

        .results-summary i {
            font-size: 28px;
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .results-summary-text h4 {
            margin: 0 0 8px 0;
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            font-size: 1.3rem;
            font-weight: 600;
        }

        .results-summary-text p {
            margin: 0;
            color: var(--text-secondary);
            font-weight: 500;
        }

        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }

        .stat-card {
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(248, 243, 255, 0.8));
            border: 1px solid var(--border-color);
            border-radius: 20px;
            padding: 30px 25px;
            text-align: center;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            backdrop-filter: blur(10px);
            position: relative;
            overflow: hidden;
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--accent-gradient);
        }

        .stat-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--hover-shadow);
            border-color: var(--secondary-purple);
        }

        .stat-card i {
            font-size: 32px;
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 15px;
        }

        .stat-card h4 {
            margin: 0 0 8px;
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary-purple);
        }

        .stat-card p {
            margin: 0;
            color: var(--text-secondary);
            font-weight: 500;
            font-size: 0.95rem;
        }

        .export-options {
            display: flex;
            justify-content: flex-end;
            gap: 15px;
            margin-bottom: 30px;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            display: inline-flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
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
            transition: left 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn-export {
            background: linear-gradient(135deg, var(--secondary-purple), var(--primary-pink));
            color: white;
            box-shadow: 0 4px 15px rgba(139, 95, 191, 0.3);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.9);
            color: var(--primary-purple);
            border: 2px solid var(--secondary-purple);
            backdrop-filter: blur(10px);
        }

        .btn-primary {
            background: var(--accent-gradient);
            color: white;
            box-shadow: 0 4px 15px rgba(233, 30, 99, 0.3);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(139, 95, 191, 0.4);
        }

        .table-container {
            overflow-x: auto;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(139, 95, 191, 0.1);
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border: 1px solid var(--border-color);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: transparent;
        }

        th, td {
            padding: 16px 20px;
            text-align: left;
            border-bottom: 1px solid rgba(139, 95, 191, 0.1);
            font-weight: 500;
        }

        thead {
            background: linear-gradient(135deg, var(--light-purple), rgba(233, 30, 99, 0.1));
            position: relative;
        }

        thead::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 2px;
            background: var(--accent-gradient);
        }

        th {
            color: var(--primary-purple);
            font-weight: 600;
            font-size: 0.95rem;
            letter-spacing: 0.5px;
        }

        th i {
            margin-right: 8px;
            color: var(--secondary-purple);
        }

        tbody tr {
            transition: all 0.2s ease;
        }

        tbody tr:hover {
            background: linear-gradient(135deg, rgba(139, 95, 191, 0.05), rgba(233, 30, 99, 0.05));
            transform: scale(1.01);
        }

        tbody tr:nth-child(even) {
            background: rgba(248, 243, 255, 0.3);
        }

        td {
            color: var(--text-primary);
            font-size: 0.95rem;
        }

        .fees-paid {
            color: var(--success-color);
            font-weight: 700;
            font-size: 1rem;
        }

        .pending-fees {
            color: var(--primary-pink);
            font-weight: 700;
            font-size: 1rem;
        }

        .pending-fees.zero {
            color: var(--success-color);
            background: rgba(39, 174, 96, 0.1);
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 0.9rem;
        }

        .actions {
            margin-top: 40px;
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                padding: 20px;
            }

            .container {
                padding: 30px 20px;
            }

            .header h2 {
                font-size: 2rem;
            }

            .stats-cards {
                grid-template-columns: 1fr;
            }

            .export-options {
                justify-content: center;
                flex-wrap: wrap;
            }

            .actions {
                flex-direction: column;
                align-items: center;
            }

            .btn {
                width: 100%;
                max-width: 250px;
                justify-content: center;
            }

            th, td {
                padding: 12px 8px;
                font-size: 0.85rem;
            }
        }

        @media print {
            .btn, .actions, .export-options {
                display: none !important;
            }

            body {
                background: white;
                padding: 0;
            }

            .container {
                box-shadow: none;
                border: none;
                padding: 20px;
                background: white;
            }

            .header h2 {
                color: var(--primary-purple) !important;
                -webkit-text-fill-color: var(--primary-purple) !important;
            }

            table {
                font-size: 12px;
            }

            th, td {
                padding: 8px;
                border-bottom: 1px solid #ddd;
            }

            thead {
                background: #f5f5f5 !important;
            }

            .stat-card {
                break-inside: avoid;
            }
        }

        /* Loading Animation */
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

        .stat-card {
            animation: fadeInUp 0.6s ease-out;
            animation-fill-mode: both;
        }

        .stat-card:nth-child(1) { animation-delay: 0.1s; }
        .stat-card:nth-child(2) { animation-delay: 0.2s; }
        .stat-card:nth-child(3) { animation-delay: 0.3s; }
        .stat-card:nth-child(4) { animation-delay: 0.4s; }
    </style>

    <script>
        function exportToCSV() {
            const table = document.querySelector('table');
            if (!table) return;

            let csv = [];
            const rows = table.querySelectorAll('tr');

            for (let i = 0; i < rows.length; i++) {
                const row = [], cols = rows[i].querySelectorAll('td, th');
                for (let j = 0; j < cols.length; j++) {
                    row.push('"' + cols[j].innerText.replace(/"/g, '""') + '"');
                }
                csv.push(row.join(','));
            }

            const csvFile = new Blob([csv.join('\n')], { type: 'text/csv' });
            const downloadLink = document.createElement('a');
            downloadLink.download = 'hostel_report_' + new Date().toISOString().split('T')[0] + '.csv';
            downloadLink.href = window.URL.createObjectURL(csvFile);
            downloadLink.style.display = 'none';
            document.body.appendChild(downloadLink);
            downloadLink.click();
            document.body.removeChild(downloadLink);
        }

        function printReport() {
            window.print();
        }
    </script>
</head>
<body>
<div class="container">
    <div class="header">
        <h2><i class="fas fa-chart-bar"></i> Report Results</h2>
        <p>Generated report based on your selected criteria</p>
    </div>

    <%
        List<Student> studentList = (List<Student>) request.getAttribute("reportList");
        if (studentList == null || studentList.isEmpty()) {
    %>
    <div class="no-results">
        <i class="fas fa-search"></i>
        <h3>No Records Found</h3>
        <p>No students match the selected criteria. Please try different parameters.</p>
    </div>
    <%
        } else {
            int totalStudents = studentList.size();
            int studentsWithPendingFees = 0;
            double totalPendingAmount = 0;

            for (Student s : studentList) {
                if (s.getPendingFees() > 0) {
                    studentsWithPendingFees++;
                    totalPendingAmount += s.getPendingFees();
                }
            }
    %>

    <div class="results-summary">
        <i class="fas fa-info-circle"></i>
        <div class="results-summary-text">
            <h4>Report Summary</h4>
            <p>Found <%= totalStudents %> student(s) matching your criteria</p>
        </div>
    </div>

    <div class="stats-cards">
        <div class="stat-card">
            <i class="fas fa-users"></i>
            <h4><%= totalStudents %></h4>
            <p>Total Students</p>
        </div>
        <div class="stat-card">
            <i class="fas fa-exclamation-circle"></i>
            <h4><%= studentsWithPendingFees %></h4>
            <p>Students with Pending Fees</p>
        </div>
        <div class="stat-card">
            <i class="fas fa-rupee-sign"></i>
            <h4>₹<%= String.format("%.2f", totalPendingAmount) %></h4>
            <p>Total Pending Amount</p>
        </div>
        <div class="stat-card">
            <i class="fas fa-check-circle"></i>
            <h4><%= totalStudents - studentsWithPendingFees %></h4>
            <p>Students with Cleared Fees</p>
        </div>
    </div>

    <div class="export-options">
        <button onclick="exportToCSV()" class="btn btn-export">
            <i class="fas fa-download"></i> Export CSV
        </button>
        <button onclick="printReport()" class="btn btn-export">
            <i class="fas fa-print"></i> Print Report
        </button>
    </div>

    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th><i class="fas fa-id-badge"></i> Student ID</th>
                    <th><i class="fas fa-user"></i> Name</th>
                    <th><i class="fas fa-door-open"></i> Room Number</th>
                    <th><i class="fas fa-calendar"></i> Admission Date</th>
                    <th><i class="fas fa-money-check-alt"></i> Fees Paid</th>
                    <th><i class="fas fa-exclamation-triangle"></i> Pending Fees</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Student s : studentList) {
                %>
                <tr>
                    <td><%= s.getStudentID() %></td>
                    <td><%= s.getStudentName() %></td>
                    <td><%= s.getRoomNumber() %></td>
                    <td><%= s.getAdmissionDate() %></td>
                    <td class="fees-paid">₹<%= String.format("%.2f", s.getFeesPaid()) %></td>
                    <td class="<%= s.getPendingFees() == 0 ? "pending-fees zero" : "pending-fees" %>">
                        <%= s.getPendingFees() == 0 ? "Cleared" : "₹" + String.format("%.2f", s.getPendingFees()) %>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <%
        }
    %>

    <div class="actions">
        <a href="report_form.jsp" class="btn btn-primary">
            <i class="fas fa-arrow-left"></i> Back to Report Form
        </a>
        <a href="index.jsp" class="btn btn-secondary">
            <i class="fas fa-home"></i> Back to Dashboard
        </a>
    </div>
</div>
</body>
</html>