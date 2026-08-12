# ⚡ ExamFlow Pro - Online Examination System

An enterprise-grade, role-based Online Examination Platform featuring dedicated portals for **Admin**, **Teacher (Instructor)**, and **Student**, powered by a persistent database engine, live proctoring (tab-switch detection), countdown timers, auto-grading, and certificate generation.

---

## 🚀 Quick Start & How to Run

### Method 1: One-Click Launcher (Windows)
Double-click `start_app.bat` or run:
```powershell
powershell -ExecutionPolicy Bypass -File .\run_server.ps1
```
This launches the built-in Windows HTTP web server at `http://localhost:8080` and automatically opens your default browser.

### Method 2: Direct Browser Opening
Simply double-click `index.html` in your file explorer to open it directly in Chrome, Firefox, Edge, or Opera!

---

## 🔑 Default Demo Accounts

For fast testing, 1-click quick login buttons are provided on the login screen and the top navigation bar:

| Role | Email | Password | Key Capabilities |
| :--- | :--- | :--- | :--- |
| **👑 Admin** | `admin@exam.com` | `admin123` | User directory, exam oversight, subjects, audit logs, DB JSON backup & restore. |
| **👨‍🏫 Teacher** | `teacher@exam.com` | `teacher123` | Exam Builder Wizard (4 steps), Question Bank (MCQ, Multi, T/F, Short), student scorecard grading, CSV export. |
| **🎓 Student** | `student@exam.com` | `student123` | Attempt proctored tests, countdown timer, anti-cheat tab monitor, instant scorecard, answer review, printable certificate. |

---

## 🌟 Key Features

### 1. Database & Persistence Layer (`js/db.js`)
- Relational data architecture with local persistence.
- Pre-seeded realistic assessments in **Computer Science**, **Web Development**, and **Database Systems**.
- One-click **JSON Database Export**, **JSON Import**, and **Reset to Default Seeds**.

### 2. Admin Portal (`js/admin.js`)
- **KPI Metrics**: Total Enrolled Students, Active Teachers, Published Tests, Overall Pass Rate.
- **User Management**: Add new accounts, suspend/activate users, delete accounts.
- **Exam Oversight**: View all exams across all instructors, toggle publish status.
- **Curriculum Management**: Add/edit subjects with custom emojis and theme colors.
- **System Audit Logs**: Real-time activity log tracing logins, creations, and test submissions.

### 3. Teacher / Instructor Portal (`js/teacher.js`)
- **Exam Builder Wizard**:
  - Step 1: Basic Information & Duration.
  - Step 2: Question selection from Question Bank.
  - Step 3: Anti-cheat rules (tab switch limit, question shuffle, allow reviews).
  - Step 4: Review and Publish.
- **Question Bank**:
  - Single Choice MCQ, Multi-Select MCQ, True/False, and Short Answer with keyword matching.
  - Explanations & solution notes for post-test review.
- **Results & Paper Grading**:
  - Inspect student submissions question-by-question.
  - View anti-cheat violation counts and time taken.
  - Export class results to CSV spreadsheet.

### 4. Student Portal & Live Proctored Exam Room (`js/student.js`)
- **Live Proctored Room**:
  - Live synchronized countdown timer with color warnings.
  - Anti-cheating proctor: Monitors tab switching and window blur; warns user and auto-submits upon exceeding violation threshold.
  - Color-coded **Question Navigator Palette** (Answered, Flagged for Review, Not Answered, Current).
  - Interactively select options, clear answers, and flag questions.
- **Instant Auto-Grading & Review**:
  - Real-time percentage calculation and pass/fail evaluation.
  - Full answer paper review with correct keys and teacher explanations.
- **Official Certificate of Achievement**:
  - Printable / Downloadable certificate with verification ID, student name, score, and verified seal.
