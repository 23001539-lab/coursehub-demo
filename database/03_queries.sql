-- 1. Xem danh sách tất cả sinh viên
SELECT * FROM students;

-- 2. Tra cứu danh sách các lớp học phần cùng tên môn và giảng viên phụ trách
SELECT cs.id AS class_id, 
       c.name AS course_name, 
       l.name AS lecturer_name, 
       cs.capacity
FROM class_sections cs
JOIN courses c ON cs.course_code = c.code
JOIN lecturers l ON cs.lecturer_id = l.id;

-- 3. Tra cứu danh sách sinh viên đã đăng ký theo từng lớp
SELECT e.class_section_id,
       s.id AS student_id,
       s.name AS student_name,
       e.registered_at
FROM enrollments e
JOIN students s ON e.student_id = s.id
ORDER BY e.class_section_id, s.id;