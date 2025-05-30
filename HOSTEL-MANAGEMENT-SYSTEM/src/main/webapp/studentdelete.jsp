<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Student - Hostel Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
            margin: 0;
            padding: 20px;
            color: #2d3748;
            min-height: 100vh;
        }

        .container {
            max-width: 700px;
            margin: 40px auto;
            padding: 40px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 
                0 20px 25px -5px rgba(139, 69, 195, 0.1),
                0 10px 10px -5px rgba(139, 69, 195, 0.04),
                0 0 0 1px rgba(139, 69, 195, 0.05);
            border: 1px solid rgba(139, 69, 195, 0.1);
        }

        .header {
            text-align: center;
            margin-bottom: 35px;
        }

        .header h1 {
            background: linear-gradient(135deg, #8b45c3, #e91e63, #f093fb);
            background-clip: text;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 12px;
            letter-spacing: -0.5px;
        }

        .header p {
            font-size: 16px;
            color: #6b7280;
            font-weight: 500;
        }

        .warning-banner {
            background: linear-gradient(135deg, #fef7ff, #fdf2f8);
            color: #be185d;
            padding: 20px;
            border-left: 6px solid #ec4899;
            border-radius: 12px;
            margin-bottom: 30px;
            animation: fadeIn 1s ease-in-out;
            border: 1px solid rgba(236, 72, 153, 0.2);
            box-shadow: 0 4px 6px -1px rgba(236, 72, 153, 0.1);
        }

        .warning-banner h3 {
            margin: 0 0 8px 0;
            font-weight: 600;
            font-size: 18px;
        }

        .warning-banner i {
            margin-right: 10px;
            color: #ec4899;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #6b46c1;
            font-size: 15px;
        }

        .form-group i {
            margin-right: 8px;
            color: #a855f7;
        }

        .form-group input {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e5e7eb;
            border-radius: 12px;
            background-color: #ffffff;
            font-size: 16px;
            color: #374151;
            transition: all 0.3s ease;
            box-sizing: border-box;
        }

        .form-group input:focus {
            outline: none;
            border-color: #a855f7;
            box-shadow: 
                0 0 0 3px rgba(168, 85, 247, 0.1),
                0 4px 6px -1px rgba(168, 85, 247, 0.1);
            transform: translateY(-1px);
        }

        .form-group input::placeholder {
            color: #9ca3af;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 35px;
            gap: 15px;
        }

        .btn {
            padding: 14px 28px;
            border: none;
            border-radius: 12px;
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .btn i {
            margin-right: 10px;
        }

        .btn-danger {
            background: linear-gradient(135deg, #dc2626, #be185d);
            color: #ffffff;
            box-shadow: 0 4px 14px 0 rgba(220, 38, 38, 0.3);
        }

        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px 0 rgba(220, 38, 38, 0.4);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #f3e8ff, #fdf4ff);
            color: #6b46c1;
            border: 2px solid #a855f7;
            box-shadow: 0 4px 14px 0 rgba(168, 85, 247, 0.15);
        }

        .btn-secondary:hover {
            background: linear-gradient(135deg, #ede9fe, #faf5ff);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px 0 rgba(168, 85, 247, 0.25);
        }

        .form-container.loading {
            opacity: 0.6;
            pointer-events: none;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 99;
            left: 0; 
            top: 0;
            width: 100%; 
            height: 100%;
            background-color: rgba(107, 70, 193, 0.15);
            backdrop-filter: blur(5px);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background: linear-gradient(135deg, #ffffff, #fefcff);
            padding: 35px;
            border-radius: 20px;
            text-align: center;
            width: 90%;
            max-width: 450px;
            box-shadow: 
                0 25px 50px -12px rgba(107, 70, 193, 0.25),
                0 0 0 1px rgba(168, 85, 247, 0.1);
            border: 1px solid rgba(168, 85, 247, 0.1);
        }

        .modal-content h3 {
            color: #be185d;
            font-size: 22px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .modal-content p {
            color: #6b7280;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 10px;
        }

        .modal-buttons {
            display: flex;
            justify-content: space-around;
            margin-top: 25px;
            gap: 15px;
        }

        @keyframes fadeIn {
            from { 
                opacity: 0; 
                transform: translateY(20px) scale(0.95); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0) scale(1); 
            }
        }

        .pulse {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { 
                transform: scale(1);
                box-shadow: 0 4px 6px -1px rgba(236, 72, 153, 0.1);
            }
            50% { 
                transform: scale(1.02);
                box-shadow: 0 8px 15px -3px rgba(236, 72, 153, 0.2);
            }
        }

        /* Enhanced animations */
        .container {
            animation: slideIn 0.8s ease-out;
        }

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

        /* Responsive design */
        @media (max-width: 600px) {
            .container {
                margin: 20px auto;
                padding: 25px;
            }

            .btn-container {
                flex-direction: column;
                gap: 15px;
            }

            .btn {
                width: 100%;
                justify-content: center;
            }

            .modal-buttons {
                flex-direction: column;
                gap: 12px;
            }

            .modal-content {
                padding: 25px;
                margin: 20px;
            }

            .header h1 {
                font-size: 28px;
            }
        }

        /* Focus states for accessibility */
        .btn:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(168, 85, 247, 0.5);
        }

        /* Loading state enhancement */
        .form-container.loading::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(90deg, transparent, rgba(168, 85, 247, 0.1), transparent);
            animation: loading 1.5s infinite;
        }

        @keyframes loading {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-user-minus"></i> Delete Student</h1>
            <p>Remove a student record from the hostel management system</p>
        </div>

        <div class="warning-banner">
            <h3><i class="fas fa-exclamation-triangle"></i>Warning</h3>
            <p>This action will permanently delete the student record. Please ensure you have selected the correct student ID before proceeding.</p>
        </div>

        <div class="form-container">
            <form id="deleteForm" method="post">
                <div class="form-group">
                    <label for="studentID">
                        <i class="fas fa-id-card"></i>Student ID to Delete
                    </label>
                    <input type="number" id="studentID" name="studentID" required min="1" 
                           placeholder="Enter the student ID to remove">
                </div>

                <div class="btn-container">
                    <button type="button" class="btn btn-danger" id="deleteBtn">
                        <i class="fas fa-trash-alt"></i>Delete Student
                    </button>
                    <a href="index.jsp" class="btn btn-secondary">
                        <i class="fas fa-arrow-left"></i>Back to Home
                    </a>
                </div>
            </form>
        </div>
    </div>

    <!-- Confirmation Modal -->
    <div id="confirmModal" class="modal">
        <div class="modal-content">
            <h3><i class="fas fa-exclamation-triangle"></i> Confirm Deletion</h3>
            <p>Are you sure you want to delete student with ID <strong id="confirmStudentId"></strong>?</p>
            <p style="color: #dc2626; font-size: 0.9rem; font-weight: 500;">This action cannot be reversed.</p>
            <div class="modal-buttons">
                <button type="button" class="btn btn-danger" id="confirmDelete">
                    <i class="fas fa-check"></i>Yes, Delete
                </button>
                <button type="button" class="btn btn-secondary" id="cancelDelete">
                    <i class="fas fa-times"></i>Cancel
                </button>
            </div>
        </div>
    </div>

    <script>
        const modal = document.getElementById('confirmModal');
        const deleteBtn = document.getElementById('deleteBtn');
        const confirmDelete = document.getElementById('confirmDelete');
        const cancelDelete = document.getElementById('cancelDelete');
        const studentIdInput = document.getElementById('studentID');
        const confirmStudentId = document.getElementById('confirmStudentId');
        const deleteForm = document.getElementById('deleteForm');

        deleteBtn.addEventListener('click', function(e) {
            e.preventDefault();
            const studentId = studentIdInput.value.trim();

            if (!studentId) {
                studentIdInput.focus();
                studentIdInput.style.borderColor = '#dc3545';
                setTimeout(() => {
                    studentIdInput.style.borderColor = '';
                }, 2000);
                return;
            }

            confirmStudentId.textContent = studentId;
            modal.style.display = 'flex';
        });

        confirmDelete.addEventListener('click', function() {
            modal.style.display = 'none';
            const formContainer = document.querySelector('.form-container');
            formContainer.classList.add('loading');
            deleteForm.action = 'deleteStudent';
            deleteForm.submit();
        });

        cancelDelete.addEventListener('click', function() {
            modal.style.display = 'none';
        });

        window.addEventListener('click', function(event) {
            if (event.target === modal) {
                modal.style.display = 'none';
            }
        });

        // Pulse effect
        setTimeout(() => {
            document.querySelector('.warning-banner').classList.add('pulse');
        }, 1000);

        studentIdInput.addEventListener('input', function() {
            this.style.borderColor = '';
            this.value = this.value.replace(/[^0-9]/g, '');
        });

        window.addEventListener('load', function() {
            studentIdInput.focus();
        });
    </script>
</body>
</html>