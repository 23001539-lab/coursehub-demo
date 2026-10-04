-- 1. Xem trạng thái lớp WEB-01 trước khi đăng ký
SELECT * FROM v_section_summary WHERE class_id = 'WEB-01';

-- 2. Bắt đầu Giao dịch (Transaction)
BEGIN;

-- Thêm sinh viên 22000004 vào lớp WEB-01
INSERT INTO enrollments (student_id, class_section_id)
VALUES ('22000004', 'WEB-01');

-- Xem lại View ngay lập tức: Số enrolled sẽ tăng lên 3, remaining giảm về 0
SELECT * FROM v_section_summary WHERE class_id = 'WEB-01';

-- Hoàn tác giao dịch (Hủy bỏ đăng ký vừa thực hiện)
ROLLBACK;

-- 3. Kiểm tra lại View sau khi ROLLBACK: Sĩ số trở về trạng thái ban đầu
SELECT * FROM v_section_summary WHERE class_id = 'WEB-01';