-- Doctor table
CREATE TABLE doctor
(
    doctor_id            VARCHAR(50)  NOT NULL PRIMARY KEY,
    name                 VARCHAR(255) NOT NULL,
    specialization_level INT          NULL
);

-- Patient table
CREATE TABLE patient
(
    patient_id   VARCHAR(50)   NOT NULL PRIMARY KEY,
    name         VARCHAR(255)  NOT NULL
);

-- Treatment program table
CREATE TABLE treatment_program
(
    program_id   VARCHAR(50)   NOT NULL PRIMARY KEY,
    name         VARCHAR(255)  NOT NULL,
    description  VARCHAR(255)  NULL,
    rate         DECIMAL(10,2) NOT NULL
);

-- Treatment session table
CREATE TABLE treatment_session
(
    session_id   VARCHAR(50)   NOT NULL PRIMARY KEY,
    content      VARCHAR(255)  NULL,
    title        VARCHAR(255)  NOT NULL,
    program_id   VARCHAR(50)   NOT NULL,
    patient_id   VARCHAR(50)   NOT NULL,
	created_at   DATETIME      DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (program_id) REFERENCES treatment_program (program_id),
    FOREIGN KEY (patient_id) REFERENCES patient (patient_id)
);

-- Patient program table (tracks registered programs)
CREATE TABLE patient_program
(
    patient_id        VARCHAR(50) NOT NULL,
    program_id        VARCHAR(50) NOT NULL,
    registration_date DATETIME    NOT NULL,
    PRIMARY KEY (patient_id, program_id),
    FOREIGN KEY (patient_id) REFERENCES patient (patient_id),
    FOREIGN KEY (program_id) REFERENCES treatment_program (program_id)
);

-- Doctor program (tracks doctor assignments)
CREATE TABLE doctor_program
(
    doctor_id  VARCHAR(50)   NOT NULL,
    program_id VARCHAR(50)   NOT NULL,
    PRIMARY KEY (doctor_id, program_id),
    FOREIGN KEY (doctor_id)  REFERENCES doctor (doctor_id),
    FOREIGN KEY (program_id) REFERENCES treatment_program (program_id)
);

-- Doctor sessions table (links doctor to treatment sessions)
CREATE TABLE doctor_session
(
    doctor_id  VARCHAR(50) NOT NULL,
    session_id VARCHAR(50) NOT NULL,
    PRIMARY KEY (doctor_id, session_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor (doctor_id),
    FOREIGN KEY (session_id) REFERENCES treatment_session (session_id)
);

-- Task table (tasks within a session)
CREATE TABLE task
(
    task_id     VARCHAR(50)   NOT NULL PRIMARY KEY,
    description VARCHAR(255)  NULL,
    score       FLOAT         NOT NULL,
    session_id  VARCHAR(50)   NOT NULL,
    FOREIGN KEY (session_id) REFERENCES treatment_session (session_id)
);


-- Trigger to check whether patent is registered to a program or not.
DELIMITER $$
CREATE TRIGGER trg_Register_Program
BEFORE INSERT ON treatment_session
FOR EACH ROW
BEGIN
	IF NOT EXISTS (
		SELECT 1
		FROM patient_program
		WHERE patient_id = NEW.patient_id
		  AND program_id = NEW.program_id
    ) THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Patient have not enroll in the program or the program_id does not match.';
	END IF;
END $$
DELIMITER ;

-- Trigger to check whether doctor is assigned to a program or not.
DELIMITER $$
CREATE TRIGGER trg_Doctor_Assignment
BEFORE INSERT ON doctor_session
FOR EACH ROW
BEGIN
    DECLARE session_program_id VARCHAR(50);
    
    SELECT program_id INTO session_program_id
    FROM treatment_session
    WHERE session_id = NEW.session_id;
	
    IF NOT EXISTS (
		SELECT 1
        FROM doctor_program
        WHERE doctor_id = NEW.doctor_id
          AND program_id = session_program_id
    ) THEN
		SIGNAL SQLSTATE "45010"
        SET MESSAGE_TEXT = "Doctor have not been assigned into any program or the proram_id does not match.";
    END IF;
END $$
DELIMITER ;

