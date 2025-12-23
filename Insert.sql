-- Insert Doctors
INSERT INTO doctor (doctor_id, name, specialization_level) VALUES
('D001', 'Nguyen Ba Dat', 1),
('D002', 'Hoang Hoa Tham', 2),
('D003', 'Vu Duc kien', 3),
('D004', 'Duong Quynh Anh', 2),
('D005', 'Le Duc Huy', 1);

-- Insert Patients
INSERT INTO patient (patient_id, name) VALUES
('P001', 'Nguyen Tien Duc'),
('P002', 'Tran Cong Minh'),
('P003', 'Le Van Hai'),
('P004', 'Hoang Duc Nam'),
('P005', 'Tang Duc Hoan');

-- Insert Treatment Programs
INSERT INTO treatment_program (program_id, name, description, rate) VALUES
('T001', 'Cardiology Program', 'Comprehensive heart care program', 5.00),
('T002', 'Orthopedic Program', 'Treatment for bones and joints', 4.00),
('T003', 'Neurology Program', 'Brain and nerve related treatments', 5.00),
('T004', 'Pediatrics Program', 'Children health care program', 3.00),
('T005', 'Dermatology Program', 'Skin and cosmetic treatments', 4.00),
('T006', 'Oncology Program', 'Cancer treatment and care', 5.00),
('T007', 'Gastroenterology Program', 'Digestive system treatments', 3.00),
('T008', 'Ophthalmology Program', 'Eye health and vision treatments', 2.00),
('T009', 'Psychiatry Program', 'Mental health support and therapy', 3.00),
('T010', 'Gynecology Program', 'Women’s health and reproductive care', 4.00);

-- Insert Patient Programs
INSERT INTO patient_program (patient_id, program_id, registration_date) VALUES
('P001', 'T001', '2024-01-01'),
('P002', 'T002', '2024-02-01'),
('P003', 'T003', '2024-03-01'),
('P004', 'T004', '2024-04-01'),
('P005', 'T005', '2024-05-01'),
('P001', 'T006', '2024-06-01'),
('P002', 'T007', '2024-07-01'),
('P003', 'T008', '2024-08-01'),
('P004', 'T009', '2024-09-01'),
('P005', 'T010', '2024-10-01');

-- Insert Doctor Programs
INSERT INTO doctor_program (doctor_id, program_id) VALUES
('D001', 'T001'),
('D002', 'T002'),
('D003', 'T003'),
('D004', 'T004'),
('D005', 'T005'),
('D001', 'T006'),
('D002', 'T007'),
('D003', 'T008'),
('D004', 'T009'),
('D005', 'T010');

-- Insert Treatment Sessions
INSERT INTO treatment_session (session_id, content, title, program_id, patient_id) VALUES
('S001', 'Heart rate and ECG check', 'Initial consultation', 'T001', 'P001'),
('S002', 'Follow-up for heart treatment', 'Follow-up checkup', 'T001', 'P001'),
('S003', 'Orthopedic surgery consultation', 'Surgery for joint replacement', 'T002', 'P002'),
('S004', 'Brain MRI analysis', 'MRI brain scan', 'T003', 'P003'),
('S005', 'Rehabilitation therapy', 'Physical therapy session', 'T005', 'P005'),
('S006', 'Pediatric general check', 'Pediatric consultation', 'T004', 'P004'),
('S007', 'Skin checkup and advice', 'Skin checkup', 'T010', 'P005'),
('S008', 'Oncology consultation', 'Cancer treatment session', 'T007', 'P002'),
('S009', 'Digestive health check', 'Gastroscopy', 'T009', 'P004'),
('S010', 'Vision assessment', 'Eye checkup', 'T008', 'P003');

-- Insert Doctor Sessions
INSERT INTO doctor_session (doctor_id, session_id) VALUES
('D001', 'S001'),
('D001', 'S002'),
('D002', 'S003'),
('D003', 'S004'),
('D005', 'S005'),
('D004', 'S006'),
('D005', 'S007'),
('D002', 'S008'),
('D004', 'S009'),
('D003', 'S010');

-- Insert Task
INSERT INTO task (task_id, description, score, session_id) VALUES
('TK001', 'Examine heart rate and blood pressure', 10.0, 'S001'),
('TK002', 'Check ECG and heart rhythm', 8.0, 'S002'),
('TK003', 'Joint movement assessment', 7.0, 'S003'),
('TK004', 'Review MRI results', 9.0, 'S004'),
('TK005', 'Post-surgery physical therapy', 6.0, 'S005'),
('TK006', 'Consultation for child health', 7.0, 'S006'),
('TK007', 'Examine skin conditions', 9.0, 'S007'),
('TK008', 'Monitor cancer treatment progress', 8.0, 'S008'),
('TK009', 'Conduct digestive health checkup', 10.0, 'S009'),
('TK010', 'Perform eye test', 7.0, 'S010'),
('TK011', 'Examine blood pressure and perform ECG', 6.0, 'S001'),
('TK012', 'Reassess heart condition post-treatment', 9.0, 'S002'),
('TK013', 'Pre-surgery joint movement assessment', 8.0, 'S003'),
('TK014', 'Analyze MRI results for brain condition', 10.0, 'S004'),
('TK015', 'Rehabilitation exercises and mobility test', 7.0, 'S005'),
('TK016', 'Measure growth rate and check development', 6.0, 'S006'),
('TK017', 'Monitor skin texture and conditions', 9.0, 'S007'),
('TK018', 'Track chemotherapy response and side effects', 8.0, 'S008'),
('TK019', 'Assess gastric health and review treatment progress', 6.0, 'S009'),
('TK020', 'Check eye sight and recommend treatment', 9.0, 'S010'),
('TK021', 'Conduct stress test and heart condition review', 8.0, 'S001'),
('TK022', 'Examine joint flexibility post-surgery', 7.0, 'S003'),
('TK023', 'Pre-surgery consultation and assessment', 6.0, 'S003'),
('TK024', 'Review brain MRI results with a neurologist', 9.0, 'S004'),
('TK025', 'Post-surgery physiotherapy and mobility exercises', 8.0, 'S005'),
('TK026', 'Monitor childhood development and growth metrics', 7.0, 'S006'),
('TK027', 'Evaluate dermatological progress and skin treatments', 8.0, 'S007'),
('TK028', 'Monitor chemotherapy side effects and improve care', 9.0, 'S008'),
('TK029', 'Check digestive function and health status', 7.0, 'S009'),
('TK030', 'Perform comprehensive eye examination and advise treatment', 10.0, 'S010');

