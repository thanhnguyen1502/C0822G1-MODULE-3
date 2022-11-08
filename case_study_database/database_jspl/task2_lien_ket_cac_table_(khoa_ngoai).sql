---------- LIÊN KẾT KHÓA NGOẠI ----------

-- Khóa ngoại employee --
ALTER TABLE furama_management.employee 
ADD FOREIGN KEY (position_id) REFERENCES position (id);

 ALTER TABLE furama_management.employee
 ADD FOREIGN KEY (education_degree_id) REFERENCES education_degree (id);

ALTER TABLE furama_management.employee
ADD FOREIGN KEY (division_id) REFERENCES division (id);


-- Khóa ngoại customer --
ALTER TABLE furama_management.customer 
ADD FOREIGN KEY (customer_type_id) REFERENCES customer_type (id);


-- Khóa ngoại facility --
ALTER TABLE furama_management.facility
ADD FOREIGN KEY (rent_type_id) REFERENCES rengt_type (id);

ALTER TABLE furama_management.facility
ADD FOREIGN KEY (facility_type_id) REFERENCES facility_type (id);


-- Khóa ngoại contract --
ALTER TABLE furama_management.contract
ADD FOREIGN KEY (employee_id) REFERENCES employee (id);

ALTER TABLE furama_management.contract
ADD FOREIGN KEY (customer_id) REFERENCES customer (id);

ALTER TABLE furama_management.contract
ADD FOREIGN KEY (facility_id) REFERENCES facility (id);


-- Khóa ngoại contract_detail --
ALTER TABLE furama_management.contract_detail
ADD FOREIGN KEY (contract_id) REFERENCES contract (id);

ALTER TABLE furama_management.contract_detail
ADD FOREIGN KEY (attach_facility_id) REFERENCES attach_facility (id);