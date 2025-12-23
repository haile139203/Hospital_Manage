Explanation of the design decisions made for entities

*Design decisions for entities, relationships and cardinality:
1.	TreatmentProgram table
- Purpose: Represents the healthcare program offered by the hospital.
- Design Decisions:

  o	program_id: Primary key to uniquely identify each program.

  o	name: the program’s name.

  o	rate: Represents the rating or feedback of the program.

  o	description: detailed description of the program.

  o	timestamp (created_at, updated_at): tracks the creation and modification of program.

2.	TreatmentSession table
-	Purpose: Represent individual sessions within a program
-	Design decision:

    o	session_id: Primary key to uniquely identify each session
  
    o	title: Briefly description of the session’s purpose
  
    o	program_id: foreign key linking sessions to specific program
  
    o	patient_id: foreign key linking sessions to specific patient
  
    o	timestamp (created_at, updated_at): tracks the creation and modification of program.
  
3.	Doctor Table
- Purpose: Represent healthcare providers with their unique specializations.
- Design decisions
  
  o	doctor_id: Used as the primary key to uniquely identify each doctor
  
  o	specialization_level: Allows categorizing doctors based on expertise levels.
  
  o	timestamps (created_at, updated_at): tracks the creation and modification of program.
  
4.	Patient table
- Purpose: Represents individuals receiving treatment
- Design decision:

  o	program_id: Primary key to uniquely identify each program
  
  o	rate: Represents the rating of this program
  
  o	timestamp (created_at, updated_at): tracks the creation and modification of program.
  
5.	Task
-	Purpose: Represent specific tasks within a session
-	Design decision:
  
       o	task_id: Primary key to uniquely identify tasks.
  
       o	score: score for performance evaluation of difficulty.
  
       o	status: tracks task procedures (e.g: pending, completed)
  
       o	session_id: Foreign key linking the task to session
  
       o	timestamp (created_at, updated_at): tracks the creation and modification of program.
  
6.	PatientProgram table
-	Purpose: Tracks programs that patients are registered for (many-to-many relationships table linking program with patient)
-	Design decision:
  
       o	Composite primary key (patient_id, program_id): Ensures uniqueness of patient-program combinations

       o	timestamp (created_at, updated_at): tracks the creation and modification of program.
  
7.	DoctorProgram table
-	Purpose: Links doctors to programs they are involved in (many-to-many relationships table linking program with doctor)
-	Design decision:
  
       o	Composite primary key (doctor_id, session_id): Ensures uniqueness of doctor-session combinations.
  
       o	timestamp (created_at, updated_at): tracks the creation and modification of program.
  
8.	DoctorSession
-	Purpose: Links doctors to specific sessions they oversee (many-to-many relationships table linking session with doctor)
-	Design decision:
  
     o	Composite primary key (doctor_id, session_id): Ensures uniqueness of doctor-session combinations.

     o	timestamp (created_at, updated_at): tracks the creation and modification of program.

*Relationship:

1.	TreatmentProgram – TreatmentSession

     o	One-to-many: one program can have multiple sessions, but each session only belongs to one program

2.	TreatmentProgram – Patient

     o	Many-to-many: a patient can enroll in multiple programs, and one program can have multiple programs. Managed by PatientProgram table.

3.	TreatmentProgram – Doctor

     o	Many-to-many: a doctor can be assigned to multiple programs, and one program can have multiple programs. Managed by DoctorProgram table.

4.	TreatmentSession – Doctor

     o	Many-to-many: Sessions can involve multiple doctors, and doctors can participate in multiple sessions. Managed by the DoctorSession table.

5.	Patient – TreatmentSession

     o	one-to-many: A patient can attend different sessions across multiple programs, but each treatment session is designed for a specific patient. 

6.	TreatmentSession – Task

     o	One-to-many: A session can have multiple tasks, but each task belongs to one session.

*Cardinality:

Relationship	Type	Cardinality

TreatmentProgram – TreatmentSession	one-to-many	1:N

TreatmentProgram – Patient	many-to-many	M:N

TreatmentProgram – Doctor	many-to-many	M:N

TreatmentSession – Doctor	many-to-many	M:N

Patient – TreatmentSession	one-to-many	1:N

TreatmentSession – Task	one-to-many	1:N


