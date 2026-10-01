# --- DỮ LIỆU GIẢ LẬP ---
students = [
    {"student_id": "22000001", "name": "Nguyễn Văn A"},
    {"student_id": "22000002", "name": "Trần Thị B"}
]

courses = [
    {"course_code": "INT2204", "name": "Cơ sở dữ liệu", "capacity": 2, "enrolled": 1},
    {"course_code": "INT2205", "name": "Lập trình Web", "capacity": 1, "enrolled": 1}
]

enrollments = [
    {"student_id": "22000001", "course_code": "INT2204"}
]

# --- HÀM BỔ TRỢ TÌM KIẾM ---
def find_student(student_id):
    for s in students:
        if s["student_id"] == student_id:
            return s
    return None

def find_course(course_code):
    for c in courses:
        if c["course_code"] == course_code:
            return c
    return None

# --- HÀM ĐĂNG KÝ HỌC PHẦN (ĐÃ CHỈNH SỬA THỨ TỰ ƯU TIÊN) ---
def enroll_student(student_id, course_code):
    # 1. Kiểm tra sinh viên tồn tại
    student = find_student(student_id)
    if student is None:
        return False, "Mã sinh viên không tồn tại"
        
    # 2. Kiểm tra học phần tồn tại
    course = find_course(course_code)
    if course is None:
        return False, "Mã học phần không tồn tại"
        
    # 3. Kiểm tra sinh viên đã đăng ký trùng chưa (ĐƯA LÊN TRƯỚC)
    duplicated = any(
        item["student_id"] == student_id and item["course_code"] == course_code
        for item in enrollments
    )
    if duplicated:
        return False, "Sinh viên đã đăng ký học phần này"

    # 4. Kiểm tra lớp còn chỗ
    if course["enrolled"] >= course["capacity"]:
        return False, "Lớp đã đủ số lượng"
        
    # ĐĂNG KÝ THÀNH CÔNG: Cập nhật dữ liệu
    enrollments.append({"student_id": student_id, "course_code": course_code})
    course["enrolled"] += 1
    
    return True, "Đăng ký thành công"

# --- 5 TÌNH HUỐNG CHẠY THỬ ---
print("--- KẾT QUẢ KIỂM THỬ ---")

# TH1: Đăng ký thành công
status, msg = enroll_student("22000002", "INT2204")
print(f"TH1 (Đăng ký thành công): {status} - {msg}")

# TH2: Đăng ký trùng
status, msg = enroll_student("22000001", "INT2204")
print(f"TH2 (Đăng ký trùng): {status} - {msg}")

# TH3: Lớp đầy
status, msg = enroll_student("22000002", "INT2205")
print(f"TH3 (Lớp đầy): {status} - {msg}")

# TH4: Mã học phần không tồn tại
status, msg = enroll_student("22000002", "INT9999")
print(f"TH4 (Sai mã học phần): {status} - {msg}")

# TH5: Mã sinh viên không tồn tại
status, msg = enroll_student("99999999", "INT2204")
print(f"TH5 (Sai mã sinh viên): {status} - {msg}")