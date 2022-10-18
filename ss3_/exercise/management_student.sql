USE quanlysinhvien;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
SELECT * FROM student WHERE studentName LIKE 'H%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12. 
SELECT * FROM class WHERE MONTH(startDate) = 12;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5. 
SELECT * FROM `subject` WHERE
    credit BETWEEN 3 AND 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2. 
SET SQL_SAFE_UPDATES = 0;
UPDATE student 
SET 
    classid = 2
WHERE
    studentname = 'Hung';
SET SQL_SAFE_UPDATES = 1;

-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần. 
SELECT 
    *
FROM
    student;

SELECT 
    studentName, subname, mark	
FROM
    student
        JOIN
    mark ON student.studentId = mark.studentId
        JOIN
    subject ON mark.subId = subject.subId
ORDER BY mark DESC , studentName ASC;