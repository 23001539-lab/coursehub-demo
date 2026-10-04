-- 1. Thử thêm SV có Mã SV không đủ 8 ký tự (Lỗi CHECK ck_students_id)
INSERT INTO students (id, name, major, email) 
VALUES ('123', 'Nguyen Van A', 'KHDL', 'sv_sai_id@example.com');

-- 2. Thử thêm học phần có tín chỉ = 0 (Lỗi CHECK ck_courses_credits)
INSERT INTO courses (code, name, credits) 
VALUES ('TEST01', 'Mon hoc gia', 0);

-- 3. Thử thêm SV trùng email đã tồn tại (Lỗi UNIQUE uq_students_email)
INSERT INTO students (id, name, major, email) 
VALUES ('22000005', 'Tran Van B', 'KHDL', 'anh@example.com');

-- 4. Thử đăng ký trùng lớp WEB-01 lần 2 cho SV 22000001 (Lỗi PRIMARY KEY ghép)
INSERT INTO enrollments (student_id, class_section_id) 
VALUES ('22000001', 'WEB-01');