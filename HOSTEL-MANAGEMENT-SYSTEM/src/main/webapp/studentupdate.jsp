<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Update Student Info - Hostel Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
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
            color: var(--text-primary);
            line-height: 1.6;
            font-size: 14px;
            min-height: 100vh;
            padding: 1rem;
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
            max-width: 640px;
            margin: 2rem auto;
            background: var(--surface-color);
            border-radius: var(--radius-2xl);
            box-shadow: var(--shadow-xl);
            overflow: hidden;
            border: 1px solid var(--border-light);
            position: relative;
            backdrop-filter: blur(10px);
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

        .header {
            background: var(--gradient-primary);
            color: white;
            padding: 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -10%;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .header::after {
            content: '';
            position: absolute;
            bottom: -30%;
            left: -5%;
            width: 150px;
            height: 150px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
            animation: float 8s ease-in-out infinite reverse;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        .header-content {
            position: relative;
            z-index: 1;
        }

        h2 {
            font-size: 1.875rem;
            font-weight: 700;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .header-subtitle {
            font-size: 1rem;
            opacity: 0.9;
            font-weight: 400;
        }

        .form-container {
            padding: 2.5rem;
            background: linear-gradient(180deg, rgba(255, 255, 255, 0.9) 0%, rgba(245, 243, 255, 0.3) 100%);
        }

        .form-grid {
            display: grid;
            gap: 1.5rem;
        }

        .form-group {
            position: relative;
        }

        .form-group.grid-cols-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1rem;
        }

        form label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 600;
            color: var(--text-primary);
            font-size: 0.875rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        form label i {
            color: var(--primary-color);
            font-size: 1rem;
            width: 16px;
            text-align: center;
            filter: drop-shadow(0 1px 2px rgba(139, 92, 246, 0.2));
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: var(--gradient-primary);
            border-radius: var(--radius-lg);
            opacity: 0;
            z-index: -1;
            transition: opacity 0.3s ease;
        }

        form input[type="text"],
        form input[type="number"],
        form input[type="date"] {
            width: 100%;
            padding: 0.875rem 1rem;
            border: 2px solid var(--border-color);
            border-radius: var(--radius-lg);
            font-size: 0.875rem;
            transition: all 0.3s ease;
            background: var(--surface-color);
            color: var(--text-primary);
            position: relative;
            z-index: 1;
        }

        form input[type="text"]:focus,
        form input[type="number"]:focus,
        form input[type="date"]:focus {
            outline: none;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.1);
            transform: translateY(-1px);
            background: rgba(255, 255, 255, 0.95);
        }

        form input[type="text"]:hover,
        form input[type="number"]:hover,
        form input[type="date"]:hover {
            border-color: var(--accent-color);
            box-shadow: 0 4px 12px rgba(139, 92, 246, 0.15);
        }

        form input::placeholder {
            color: var(--text-muted);
            font-size: 0.875rem;
        }

        .submit-section {
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 2px solid var(--border-light);
            background: linear-gradient(180deg, transparent 0%, rgba(245, 243, 255, 0.3) 100%);
        }

        input[type="submit"] {
            background: var(--gradient-primary);
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: var(--radius-lg);
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            width: 100%;
            transition: all 0.3s ease;
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 0.5rem;
            box-shadow: 
                var(--shadow-md),
                0 0 20px rgba(139, 92, 246, 0.3);
            position: relative;
            overflow: hidden;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        input[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 
                var(--shadow-lg),
                0 0 30px rgba(139, 92, 246, 0.4);
            background: var(--gradient-secondary);
        }

        input[type="submit"]:active {
            transform: translateY(0);
            box-shadow: var(--shadow-sm);
        }

        input[type="submit"]:focus {
            outline: 3px solid rgba(139, 92, 246, 0.3);
            outline-offset: 2px;
        }

        input[type="submit"]::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.6s ease;
        }

        input[type="submit"]:hover::before {
            left: 100%;
        }

        .back-link-container {
            padding: 1.5rem 2.5rem 2rem;
            background: linear-gradient(135deg, var(--border-light) 0%, rgba(252, 231, 243, 0.5) 100%);
            text-align: center;
        }

        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.875rem;
            transition: all 0.3s ease;
            padding: 0.75rem 1.5rem;
            border-radius: var(--radius-lg);
            border: 2px solid transparent;
            background: rgba(255, 255, 255, 0.7);
        }

        .back-link:hover {
            color: var(--secondary-color);
            background: var(--surface-color);
            text-decoration: none;
            transform: translateX(-3px);
            border-color: var(--accent-color);
            box-shadow: 0 4px 12px rgba(139, 92, 246, 0.15);
        }

        .back-link i {
            font-size: 1rem;
            transition: transform 0.3s ease;
        }

        .back-link:hover i {
            transform: translateX(-2px);
        }

        /* Form validation styles */
        .form-group.error input {
            border-color: var(--danger-color);
            box-shadow: 0 0 0 4px rgba(239, 68, 68, 0.1);
            background: rgba(254, 242, 242, 0.8);
        }

        .form-group.success input {
            border-color: var(--success-color);
            box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1);
            background: rgba(236, 253, 245, 0.8);
        }

        /* Loading state */
        .loading input[type="submit"] {
            opacity: 0.7;
            cursor: not-allowed;
            background: linear-gradient(135deg, #94a3b8 0%, #64748b 100%);
        }

        /* Responsive design */
        @media (max-width: 768px) {
            body {
                padding: 0.5rem;
            }

            .container {
                margin: 1rem auto;
                border-radius: var(--radius-xl);
            }

            .header {
                padding: 1.5rem;
            }

            h2 {
                font-size: 1.5rem;
            }

            .form-container {
                padding: 2rem 1.5rem;
            }

            .form-group.grid-cols-2 {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .back-link-container {
                padding: 1.5rem;
            }
        }

        @media (max-width: 480px) {
            .header {
                padding: 1.25rem;
            }

            h2 {
                font-size: 1.25rem;
                flex-direction: column;
                gap: 0.5rem;
            }

            .form-container {
                padding: 1.5rem 1rem;
            }

            form input[type="text"],
            form input[type="number"],
            form input[type="date"] {
                padding: 0.75rem;
            }

            input[type="submit"] {
                padding: 0.875rem 1.5rem;
                font-size: 0.875rem;
            }
        }

        /* Animations */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes gradientShift {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            animation: slideIn 0.6s ease-out;
        }

        .form-group {
            animation: slideIn 0.6s ease-out;
        }

        .form-group:nth-child(2) { animation-delay: 0.1s; }
        .form-group:nth-child(3) { animation-delay: 0.2s; }
        .form-group:nth-child(4) { animation-delay: 0.3s; }
        .form-group:nth-child(5) { animation-delay: 0.4s; }
        .form-group:nth-child(6) { animation-delay: 0.5s; }

        /* Focus ring for accessibility */
        input:focus-visible {
            outline: 3px solid var(--accent-color);
            outline-offset: 2px;
        }

        /* Enhanced visual effects */
        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: 
                radial-gradient(circle at 10% 20%, rgba(139, 92, 246, 0.05) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(236, 72, 153, 0.05) 0%, transparent 50%);
            pointer-events: none;
            z-index: 0;
        }

        .form-container > * {
            position: relative;
            z-index: 1;
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
            
            .header {
                background: #f5f5f5 !important;
                color: #333 !important;
            }
            
            .back-link-container {
                display: none;
            }
        }

        /* Additional purple-pink themed enhancements */
        .form-group:hover label i {
            color: var(--secondary-color);
            transform: scale(1.1);
            transition: all 0.3s ease;
        }

        .input-wrapper:focus-within {
            transform: scale(1.02);
        }

        .submit-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: var(--gradient-primary);
            border-radius: 2px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <div class="header-content">
                <h2><i class="fas fa-user-edit"></i> Update Student Information</h2>
                <p class="header-subtitle">Modify existing student records with ease</p>
            </div>
        </div>
        
        <div class="form-container">
            <form action="updateStudent" method="post" id="updateStudentForm">
                <div class="form-grid">
                    <div class="form-group">
                        <label for="studentID">
                            <i class="fas fa-id-card"></i>
                            Student ID (to update)
                        </label>
                        <div class="input-wrapper">
                            <input type="number" id="studentID" name="studentID" required min="1" placeholder="Enter student ID to update">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="studentName">
                            <i class="fas fa-user"></i>
                            Student Name
                        </label>
                        <div class="input-wrapper">
                            <input type="text" id="studentName" name="studentName" required placeholder="Enter full name">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="roomNumber">
                            <i class="fas fa-door-open"></i>
                            Room Number
                        </label>
                        <div class="input-wrapper">
                            <input type="text" id="roomNumber" name="roomNumber" required placeholder="e.g., A-101, B-205">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="admissionDate">
                            <i class="fas fa-calendar-alt"></i>
                            Admission Date
                        </label>
                        <div class="input-wrapper">
                            <input type="date" id="admissionDate" name="admissionDate" required>
                        </div>
                    </div>

                    <div class="form-group grid-cols-2">
                        <div>
                            <label for="feesPaid">
                                <i class="fas fa-dollar-sign"></i>
                                Fees Paid
                            </label>
                            <div class="input-wrapper">
                                <input type="number" step="0.01" id="feesPaid" name="feesPaid" required min="0" placeholder="0.00">
                            </div>
                        </div>
                        <div>
                            <label for="pendingFees">
                                <i class="fas fa-exclamation-triangle"></i>
                                Pending Fees
                            </label>
                            <div class="input-wrapper">
                                <input type="number" step="0.01" id="pendingFees" name="pendingFees" required min="0" placeholder="0.00">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="submit-section">
                    <input type="submit" value="Update Student Information">
                </div>
            </form>
        </div>
        
        <div class="back-link-container">
            <a href="index.jsp" class="back-link">
                <i class="fas fa-arrow-left"></i> 
                Back to Home
            </a>
        </div>
    </div>

    <script>
        // Form validation and enhancement script
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('updateStudentForm');
            const inputs = form.querySelectorAll('input[required]');

            // Add real-time validation
            inputs.forEach(input => {
                input.addEventListener('blur', function() {
                    validateField(this);
                });

                input.addEventListener('input', function() {
                    if (this.classList.contains('error')) {
                        validateField(this);
                    }
                });
            });

            function validateField(field) {
                const formGroup = field.closest('.form-group');
                
                if (field.validity.valid && field.value.trim() !== '') {
                    formGroup.classList.remove('error');
                    formGroup.classList.add('success');
                } else {
                    formGroup.classList.remove('success');
                    formGroup.classList.add('error');
                }
            }

            // Form submission handling
            form.addEventListener('submit', function(e) {
                let isValid = true;
                
                inputs.forEach(input => {
                    if (!input.validity.valid || input.value.trim() === '') {
                        isValid = false;
                        validateField(input);
                    }
                });

                if (isValid) {
                    // Add loading state
                    const submitBtn = form.querySelector('input[type="submit"]');
                    submitBtn.style.opacity = '0.7';
                    submitBtn.style.cursor = 'not-allowed';
                    submitBtn.value = 'Updating...';
                }
            });

            // Set today's date as max for admission date
            const admissionDate = document.getElementById('admissionDate');
            const today = new Date().toISOString().split('T')[0];
            admissionDate.setAttribute('max', today);
        });
    </script>
</body>
</html>