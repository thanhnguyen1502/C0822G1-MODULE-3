
-- Hiển thị tất cả sinh viên có tên bắt đầu bằng ký tự 'h'.
SELECT 
    *
FROM
    student
WHERE
    student_name LIKE 'h%';


-- Hiển thị thông tin các lớp học có thời gian bắt đầu vào tháng 12. 
SELECT 
    *
FROM
    class
WHERE
    MONTH(start_date) = 12;

USE student_management;


-- Hiển thị tất cả thông tin môn học có credit trong khoảng 3 - 5.
SELECT 
    *
FROM
    `subject`
WHERE
    credit BETWEEN 3 AND 5;


-- Thay đổi mã lớp  của sinh viên có tên "Hung" là 2.
SET sql_safe_updates = 0;
UPDATE student 
SET 
    class_id = 2
WHERE
    student_name = 'Hung'; 
SET sql_safe_updates = 1;


-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
SELECT 
    s.student_name, sj.sub_name, m.mark
FROM
    student s
        JOIN
    mark m ON s.student_id = m.student_id
        JOIN
    `subject` sj ON m.sub_id = sj.sub_id
ORDER BY m.mark DESC , s.student_name;