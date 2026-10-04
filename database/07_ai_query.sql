-- 1. Truy vấn SAI (Dùng COUNT(*) khiến lớp chưa có sinh viên đăng ký vẫn bị đếm là 1)
SELECT cs.id AS class_id,
       COUNT(*) AS enrolled_wrong
FROM class_sections cs
LEFT JOIN enrollments e ON cs.id = e.class_section_id
GROUP BY cs.id;

-- 2. Truy vấn ĐÚNG (Dùng COUNT(e.student_id) đếm chính xác số lượng sinh viên)
SELECT cs.id AS class_id,
       COUNT(e.student_id) AS enrolled_correct
FROM class_sections cs
LEFT JOIN enrollments e ON cs.id = e.class_section_id
GROUP BY cs.id;