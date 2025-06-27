# Language Center – MySQL Database Project

This project is a MySQL-based backend for a language learning center. It includes relational data for students, classes, exams, and placement tests. The script populates the database with sample data and includes two SQL queries for basic reporting and analytics.

---

## Tables contain:
- Languages
- Course
- Professor
- Student
- Class
- Exam
- Placement Exam

## File Contents

- Example of INSERT statements:
```sql
INSERT INTO student (course_id, s_name, s_age, payment_state, payment_type)
VALUES (2, 'Sam Toutounchi', 24, 'NOT_Confirmed', 'credit_cart');
