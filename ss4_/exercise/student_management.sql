USE quanlysinhvien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT * FROM `subject` WHERE credit = (SELECT MAX(Credit) FROM `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất
select `subject`.subId, subName, credit, mark as max_mark 
		from `subject` 
			join mark on `subject`.subId = mark.subId
				where mark = (select max(mark) from mark);
                
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select student.studentID,student.studentName, address,`status`, phone, classId , avg(mark)
	from student 
		 left join mark on student.studentID = mark.studentId	
         group by student.studentID		-- nhóm dữ liệu
         order by avg(mark) desc;		-- sử dụng để sắp xếp
        