<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Student - Hostel Management System</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #6366f1 0%, #8b5cf6 50%, #d946ef 100%);
            --secondary-gradient: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            --surface-color: #ffffff;
            --surface-secondary: #f8fafc;
            --text-primary: #1e293b;
            --text-secondary: #64748b;
            --text-muted: #94a3b8;
            --border-color: #e2e8f0;
            --border-focus: #6366f1;
            --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            --radius-sm: 0.375rem;
            --radius-md: 0.5rem;
            --radius-lg: 0.75rem;
            --radius-xl: 1rem;
            --spacing-xs: 0.25rem;
            --spacing-sm: 0.5rem;
            --spacing-md: 1rem;
            --spacing-lg: 1.5rem;
            --spacing-xl: 2rem;
            --spacing-2xl: 3rem;
            --transition-fast: 150ms cubic-bezier(0.4, 0, 0.2, 1);
            --transition-normal: 300ms cubic-bezier(0.4, 0, 0.2, 1);
            --transition-slow: 500ms cubic-bezier(0.4, 0, 0.2, 1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        *::before,
        *::after {
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: var(--primary-gradient);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: var(--spacing-lg);
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
            -moz-osx-font-smoothing: grayscale;
        }

        .main-container {
            max-width: 56rem;
            width: 100%;
            background: var(--surface-color);
            backdrop-filter: blur(20px);
            border-radius: var(--radius-xl);
            box-shadow: var(--shadow-xl);
            border: 1px solid rgba(255, 255, 255, 0.1);
            overflow: hidden;
            animation: slideInUp 0.6s cubic-bezier(0.16, 1, 0.3, 1);
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(2rem) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .header-section {
            background: var(--primary-gradient);
            color: white;
            padding: var(--spacing-2xl) var(--spacing-xl);
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header-section::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle at center, rgba(255, 255, 255, 0.1) 0%, transparent 50%);
            animation: floatingOrb 8s ease-in-out infinite;
            pointer-events: none;
        }

        @keyframes floatingOrb {
            0%, 100% { 
                transform: translateY(0) rotate(0deg); 
                opacity: 0.5;
            }
            25% { 
                transform: translateY(-1rem) rotate(90deg); 
                opacity: 0.8;
            }
            50% { 
                transform: translateY(-2rem) rotate(180deg); 
                opacity: 1;
            }
            75% { 
                transform: translateY(-1rem) rotate(270deg); 
                opacity: 0.8;
            }
        }

        .header-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: var(--spacing-sm);
            position: relative;
            z-index: 1;
            letter-spacing: -0.025em;
        }

        .header-subtitle {
            font-size: 1.125rem;
            opacity: 0.9;
            position: relative;
            z-index: 1;
            font-weight: 400;
        }

        .header-icon {
            margin-right: var(--spacing-sm);
            font-size: 1.875rem;
            vertical-align: middle;
        }

        .form-section {
            padding: var(--spacing-2xl) var(--spacing-xl);
            background: var(--surface-color);
        }

        .form-layout {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(20rem, 1fr));
            gap: var(--spacing-lg);
            margin-bottom: var(--spacing-xl);
        }

        .field-group {
            position: relative;
            display: flex;
            flex-direction: column;
        }

        .field-label {
            display: flex;
            align-items: center;
            margin-bottom: var(--spacing-sm);
            font-weight: 600;
            color: var(--text-primary);
            font-size: 0.875rem;
            letter-spacing: 0.025em;
        }

        .label-icon {
            margin-right: var(--spacing-sm);
            color: var(--border-focus);
            font-size: 0.875rem;
        }

        .input-container {
            position: relative;
            display: flex;
            align-items: center;
        }

        .input-icon {
            position: absolute;
            left: 1rem;
            color: var(--text-muted);
            font-size: 1rem;
            z-index: 2;
            transition: color var(--transition-fast);
        }

        .form-input {
            width: 100%;
            padding: 1rem 1rem 1rem 2.75rem;
            border: 2px solid var(--border-color);
            border-radius: var(--radius-md);
            background-color: var(--surface-color);
            font-size: 1rem;
            color: var(--text-primary);
            transition: all var(--transition-normal);
            font-family: inherit;
            outline: none;
        }

        .form-input::placeholder {
            color: var(--text-muted);
            opacity: 1;
        }

        .form-input:hover {
            border-color: var(--text-muted);
        }

        .form-input:focus {
            border-color: var(--border-focus);
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.1);
            transform: translateY(-1px);
        }

        .form-input:focus + .input-icon,
        .field-group:focus-within .input-icon {
            color: var(--border-focus);
        }

        .form-input:invalid:not(:placeholder-shown) {
            border-color: #ef4444;
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
        }

        .button-group {
            display: flex;
            gap: var(--spacing-md);
            justify-content: center;
            margin-top: var(--spacing-xl);
            flex-wrap: wrap;
        }

        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 1rem 2rem;
            border: none;
            border-radius: var(--radius-md);
            font-size: 1rem;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            transition: all var(--transition-normal);
            position: relative;
            overflow: hidden;
            min-width: 10rem;
            font-family: inherit;
            letter-spacing: 0.025em;
        }

        .btn:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none !important;
        }

        .btn-icon {
            margin-right: var(--spacing-sm);
            font-size: 1rem;
        }

        .btn-primary {
            background: var(--primary-gradient);
            color: white;
            box-shadow: var(--shadow-md);
        }

        .btn-primary:hover:not(:disabled) {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }

        .btn-primary:active {
            transform: translateY(0);
            box-shadow: var(--shadow-md);
        }

        .btn-secondary {
            background: var(--surface-secondary);
            color: var(--text-primary);
            border: 2px solid var(--border-color);
            box-shadow: var(--shadow-sm);
        }

        .btn-secondary:hover:not(:disabled) {
            background: var(--border-color);
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }

        .btn-secondary:active {
            transform: translateY(0);
            box-shadow: var(--shadow-sm);
        }

        /* Loading state */
        .form-loading {
            opacity: 0.8;
            pointer-events: none;
        }

        .form-loading .btn-primary {
            background: linear-gradient(135deg, #94a3b8 0%, #64748b 100%);
        }

        /* Ripple effect */
        .btn-ripple {
            position: relative;
            overflow: hidden;
        }

        .btn-ripple::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.5);
            transform: translate(-50%, -50%);
            transition: width var(--transition-slow), height var(--transition-slow);
        }

        .btn-ripple:active::after {
            width: 300px;
            height: 300px;
        }

        /* Focus animations */
        @keyframes focusPulse {
            0%, 100% { 
                transform: scale(1); 
            }
            50% { 
                transform: scale(1.02); 
            }
        }

        .field-focus {
            animation: focusPulse 0.6s ease-out;
        }

        /* Spinner animation */
        @keyframes spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .fa-spin {
            animation: spin 1s linear infinite;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            body {
                padding: var(--spacing-md);
            }

            .main-container {
                margin: 0;
                border-radius: var(--radius-lg);
            }

            .header-section {
                padding: var(--spacing-xl) var(--spacing-lg);
            }

            .header-title {
                font-size: 1.75rem;
            }

            .header-subtitle {
                font-size: 1rem;
            }

            .form-section {
                padding: var(--spacing-xl) var(--spacing-lg);
            }

            .form-layout {
                grid-template-columns: 1fr;
                gap: var(--spacing-md);
            }

            .button-group {
                flex-direction: column;
                align-items: stretch;
            }

            .btn {
                width: 100%;
            }
        }

        @media (max-width: 480px) {
            .header-section {
                padding: var(--spacing-lg);
            }

            .form-section {
                padding: var(--spacing-lg);
            }

            .form-input {
                padding: 0.875rem 0.875rem 0.875rem 2.5rem;
            }

            .btn {
                padding: 0.875rem 1.5rem;
            }
        }

        /* Accessibility improvements */
        @media (prefers-reduced-motion: reduce) {
            *,
            *::before,
            *::after {
                animation-duration: 0.01ms !important;
                animation-iteration-count: 1 !important;
                transition-duration: 0.01ms !important;
                scroll-behavior: auto !important;
            }
        }

        @media (prefers-color-scheme: dark) {
            :root {
                --surface-color: #1e293b;
                --surface-secondary: #334155;
                --text-primary: #f1f5f9;
                --text-secondary: #cbd5e1;
                --text-muted: #94a3b8;
                --border-color: #475569;
            }

            .main-container {
                border-color: rgba(255, 255, 255, 0.1);
            }
        }

        /* High contrast mode */
        @media (prefers-contrast: high) {
            :root {
                --border-color: #000000;
                --text-muted: #333333;
                --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.3);
            }
        }

        /* Focus visible for keyboard navigation */
        .btn:focus-visible,
        .form-input:focus-visible {
            outline: 2px solid var(--border-focus);
            outline-offset: 2px;
        }

        /* Form validation styling */
        .field-group.error .form-input {
            border-color: #ef4444;
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.1);
        }

        .field-group.success .form-input {
            border-color: #22c55e;
            box-shadow: 0 0 0 3px rgba(34, 197, 94, 0.1);
        }

        /* Print styles */
        @media print {
            body {
                background: white;
                padding: 0;
            }

            .main-container {
                box-shadow: none;
                border: 1px solid #000;
            }

            .header-section {
                background: #f0f0f0 !important;
                color: #000 !important;
            }

            .btn {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="main-container">
        <div class="header-section">
            <h1 class="header-title">
                <i class="fas fa-user-graduate header-icon" aria-hidden="true"></i>
                Student Registration
            </h1>
            <p class="header-subtitle">Welcome to the Hostel Management System</p>
        </div>

        <div class="form-section">
            <form action="addStudent" method="post" id="studentForm" novalidate>
                <div class="form-layout">
                    <div class="field-group">
                        <label for="studentID" class="field-label">
                            <i class="fas fa-id-card label-icon" aria-hidden="true"></i>
                            Student ID
                        </label>
                        <div class="input-container">
                            <input 
                                type="number" 
                                id="studentID" 
                                name="studentID" 
                                class="form-input" 
                                required 
                                min="1" 
                                placeholder="Enter unique student ID"
                                aria-describedby="studentID-desc"
                            >
                            <i class="fas fa-id-card input-icon" aria-hidden="true"></i>
                        </div>
                    </div>

                    <div class="field-group">
                        <label for="studentName" class="field-label">
                            <i class="fas fa-user label-icon" aria-hidden="true"></i>
                            Full Name
                        </label>
                        <div class="input-container">
                            <input 
                                type="text" 
                                id="studentName" 
                                name="studentName" 
                                class="form-input" 
                                required 
                                placeholder="Enter full name"
                                aria-describedby="studentName-desc"
                            >
                            <i class="fas fa-user input-icon" aria-hidden="true"></i>
                        </div>
                    </div>

                    <div class="field-group">
                        <label for="roomNumber" class="field-label">
                            <i class="fas fa-door-open label-icon" aria-hidden="true"></i>
                            Room Number
                        </label>
                        <div class="input-container">
                            <input 
                                type="text" 
                                id="roomNumber" 
                                name="roomNumber" 
                                class="form-input" 
                                required 
                                placeholder="e.g., A-101, B-205"
                                aria-describedby="roomNumber-desc"
                            >
                            <i class="fas fa-door-open input-icon" aria-hidden="true"></i>
                        </div>
                    </div>

                    <div class="field-group">
                        <label for="admissionDate" class="field-label">
                            <i class="fas fa-calendar-alt label-icon" aria-hidden="true"></i>
                            Admission Date
                        </label>
                        <div class="input-container">
                            <input 
                                type="date" 
                                id="admissionDate" 
                                name="admissionDate" 
                                class="form-input" 
                                required
                                aria-describedby="admissionDate-desc"
                            >
                            <i class="fas fa-calendar-alt input-icon" aria-hidden="true"></i>
                        </div>
                    </div>

                    <div class="field-group">
                        <label for="feesPaid" class="field-label">
                            <i class="fas fa-indian-rupee-sign label-icon" aria-hidden="true"></i>
                            Fees Paid
                        </label>
                        <div class="input-container">
                            <input 
                                type="number" 
                                step="0.01" 
                                id="feesPaid" 
                                name="feesPaid" 
                                class="form-input" 
                                required 
                                min="0" 
                                placeholder="0.00"
                                aria-describedby="feesPaid-desc"
                            >
                            <i class="fas fa-indian-rupee-sign input-icon" aria-hidden="true"></i>
                        </div>
                    </div>

                    <div class="field-group">
                        <label for="pendingFees" class="field-label">
                            <i class="fas fa-exclamation-triangle label-icon" aria-hidden="true"></i>
                            Pending Fees
                        </label>
                        <div class="input-container">
                            <input 
                                type="number" 
                                step="0.01" 
                                id="pendingFees" 
                                name="pendingFees" 
                                class="form-input" 
                                required 
                                min="0" 
                                placeholder="0.00"
                                aria-describedby="pendingFees-desc"
                            >
                            <i class="fas fa-exclamation-triangle input-icon" aria-hidden="true"></i>
                        </div>
                    </div>
                </div>

                <div class="button-group">
                    <button type="submit" class="btn btn-primary btn-ripple">
                        <i class="fas fa-user-plus btn-icon" aria-hidden="true"></i>
                        Register Student
                    </button>
                    <a href="index.jsp" class="btn btn-secondary">
                        <i class="fas fa-arrow-left btn-icon" aria-hidden="true"></i>
                        Back to Dashboard
                    </a>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Enhanced form submission with loading state
        document.getElementById('studentForm').addEventListener('submit', function(e) {
            const formSection = document.querySelector('.form-section');
            const submitBtn = document.querySelector('.btn-primary');
            const originalContent = submitBtn.innerHTML;
            
            formSection.classList.add('form-loading');
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin btn-icon" aria-hidden="true"></i>Processing...';
            submitBtn.disabled = true;
            
            // Reset after 2 seconds (adjust based on your server response time)
            setTimeout(() => {
                formSection.classList.remove('form-loading');
                submitBtn.innerHTML = originalContent;
                submitBtn.disabled = false;
            }, 2000);
        });

        // Set default admission date to today
        document.getElementById('admissionDate').valueAsDate = new Date();

        // Enhanced input focus effects
        const inputs = document.querySelectorAll('.form-input');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.closest('.field-group').classList.add('field-focus');
            });
            
            input.addEventListener('blur', function() {
                this.closest('.field-group').classList.remove('field-focus');
            });

            // Real-time validation feedback
            input.addEventListener('input', function() {
                const fieldGroup = this.closest('.field-group');
                fieldGroup.classList.remove('error', 'success');
                
                if (this.checkValidity() && this.value.trim() !== '') {
                    fieldGroup.classList.add('success');
                } else if (!this.checkValidity() && this.value.trim() !== '') {
                    fieldGroup.classList.add('error');
                }
            });
        });

        // Enhanced ripple effect for buttons
        const rippleButtons = document.querySelectorAll('.btn-ripple');
        rippleButtons.forEach(button => {
            button.addEventListener('click', function(e) {
                const ripple = document.createElement('span');
                const rect = this.getBoundingClientRect();
                const size = Math.max(rect.width, rect.height);
                const x = e.clientX - rect.left - size / 2;
                const y = e.clientY - rect.top - size / 2;
                
                ripple.style.cssText = `
                    position: absolute;
                    width: ${size}px;
                    height: ${size}px;
                    left: ${x}px;
                    top: ${y}px;
                    background: rgba(255, 255, 255, 0.5);
                    border-radius: 50%;
                    transform: scale(0);
                    animation: ripple-animation 600ms linear;
                    pointer-events: none;
                `;
                
                this.appendChild(ripple);
                
                setTimeout(() => {
                    ripple.remove();
                }, 600);
            });
        });

        // Add ripple animation keyframes dynamically
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple-animation {
                to {
                    transform: scale(4);
                    opacity: 0;
                }
            }
        `;
        document.head.appendChild(style);

        // Form validation enhancement
        const form = document.getElementById('studentForm');
        form.addEventListener('submit', function(e) {
            let isValid = true;
            
            inputs.forEach(input => {
                const fieldGroup = input.closest('.field-group');
                fieldGroup.classList.remove('error', 'success');
                
                if (!input.checkValidity() || input.value.trim() === '') {
                    fieldGroup.classList.add('error');
                    isValid = false;
                } else {
                    fieldGroup.classList.add('success');
                }
            });
            
            if (!isValid) {
                e.preventDefault();
                // Focus on first invalid field
                const firstError = document.querySelector('.field-group.error input');
                if (firstError) {
                    firstError.focus();
                }
            }
        });

        // Accessibility: Keyboard navigation enhancement
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Tab') {
                document.body.classList.add('keyboard-navigation');
            }
        });

        document.addEventListener('mousedown', function() {
            document.body.classList.remove('keyboard-navigation');
        });

        // Auto-resize number inputs based on content
        const numberInputs = document.querySelectorAll('input[type="number"]');
        numberInputs.forEach(input => {
            input.addEventListener('input', function() {
                if (this.value.length > 10) {
                    this.style.fontSize = '0.875rem';
                } else {
                    this.style.fontSize = '1rem';
                }
            });
        });
    </script>
</body>
</html>