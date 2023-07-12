DROP DATABASE IF EXISTS language_center;
CREATE DATABASE language_center;
USE language_center;


/*Creating tables*/
DROP TABLE IF EXISTS languages;

CREATE TABLE languages(
	l_id BIGINT NOT NULL AUTO_INCREMENT,
	l_name VARCHAR(30) NOT NULL,
	l_level VARCHAR(20),
	descriptions VARCHAR(1000),

	PRIMARY KEY(l_id));
    

DROP TABLE IF EXISTS course;

CREATE TABLE course(
	course_id BIGINT NOT NULL AUTO_INCREMENT,
	course_name VARCHAR(30) NOT NULL,
	course_level VARCHAR(20),
	c_capacity INT NOT NULL,
	credit_hours INT NOT NULL,
	tuition_fee INT NOT NULL,

	PRIMARY KEY(course_id));



DROP TABLE IF EXISTS professor;

CREATE TABLE professor(
	p_id BIGINT NOT NULL AUTO_INCREMENT,
    course_id BIGINT NOT NULL,
	p_name VARCHAR(30) NOT NULL,
	p_phone VARCHAR(20),
	p_Email VARCHAR(50),
	teaching_level VARCHAR(10) NOT NULL,
	bank_info INT,
	salary VARCHAR(20),

	PRIMARY KEY(p_id),
    
    	CONSTRAINT p_con 
		FOREIGN KEY (course_id)
		 REFERENCES course (course_id)
			 ON DELETE CASCADE
			 ON UPDATE CASCADE);



DROP TABLE IF EXISTS student;

CREATE TABLE student(
	student_id BIGINT NOT NULL AUTO_INCREMENT,
    course_id BIGINT NOT NULL,
	s_name VARCHAR(30) NOT NULL,
	s_age INT NOT NULL,
	s_phone VARCHAR(20),
	s_Email VARCHAR(50),
	payment_state VARCHAR(100) NOT NULL,
	payment_type VARCHAR(1000) NOT NULL,
	payment_num INT,

	PRIMARY KEY(student_id),
    
		CONSTRAINT s_con 
		FOREIGN KEY (course_id)
		REFERENCES course (course_id)
			 ON DELETE CASCADE
			 ON UPDATE CASCADE);



DROP TABLE IF EXISTS  class;

CREATE TABLE class(
	class_id BIGINT NOT NULL AUTO_INCREMENT,
    course_id BIGINT NOT NULL,
	class_name VARCHAR(30),
	class_type VARCHAR(10) NOT NULL,
	class_schedule VARCHAR(20) NOT NULL,

	PRIMARY KEY(class_id),
		
        CONSTRAINT co_con 
		FOREIGN KEY (course_id)
		 REFERENCES course (course_id)
			 ON DELETE CASCADE
			 ON UPDATE CASCADE);



DROP TABLE IF EXISTS exam;

CREATE TABLE exam(
	exam_id BIGINT NOT NULL AUTO_INCREMENT,
	p_id BIGINT NOT NULL,
	class_id BIGINT NOT NULL,
	e_type VARCHAR(10) NOT NULL,
	e_date DATETIME NOT NULL,
	e_score FLOAT,


	PRIMARY KEY(exam_id),

	CONSTRAINT cl_cons
		FOREIGN KEY (class_id)
		 REFERENCES class (class_id)
			 ON DELETE CASCADE
			 ON UPDATE CASCADE,

	CONSTRAINT ex_cons
		FOREIGN KEY (p_id) 
		REFERENCES professor (p_id)
			ON DELETE CASCADE
			ON UPDATE CASCADE);
            
            

DROP TABLE IF EXISTS Placemenent_exam;

CREATE TABLE Placement_exam(
	Pexam_id BIGINT NOT NULL AUTO_INCREMENT,
	pexam_name VARCHAR(30) NOT NULL,
	pexam_date DATETIME NOT NULL,
	pexam_score FLOAT,

	PRIMARY KEY(Pexam_id));


/*Inserting values into the tables*/

INSERT INTO languages (l_name, l_level, descriptions)
	values ('English', 'C2', "This language is presented by our institute in A, B, C levels, don't forget to enjoy English!");

INSERT INTO languages (l_name, l_level, descriptions)
    values ('German', 'B1', "This language is presented by our institute in A, B, C levels, don't forget to enjoy German!");

INSERT INTO languages (l_name, l_level, descriptions)
    values ('French', 'A3', "This language is presented by our institute in A, B, C levels, don't forget to enjoy French!");
    

    
    
INSERT INTO course (course_name, course_level, c_capacity , credit_hours, tuition_fee)
	values ('English101' , 'Beginner', 25, 72, 500);
    
INSERT INTO course (course_name, course_level, c_capacity , credit_hours, tuition_fee)
	values ('German202' , 'Intermediate', 25, 60, 750);
    
    
INSERT INTO course (course_name, course_level, c_capacity , credit_hours, tuition_fee)
	values ('French303' , 'Advanced', 25, 45, 1000);
    



    
INSERT INTO professor (course_id ,p_name, teaching_level)
	values (1,'Shahin Alipanahi' , 'Adults');

INSERT INTO professor (course_id, p_name, teaching_level)
	values (2,'Amin Sayyadi' , 'teenagers');    
 
INSERT INTO professor (course_id, p_name, teaching_level)
	values (3,'Ali Bakhshalipour' , 'children'); 
    
    
    


INSERT INTO student (course_id, s_name, s_age, payment_state, payment_type )
	values (1,'Yalda Shirdel' , 21 , 'Confirmed', 'credit_cart');    
    
INSERT INTO student (course_id, s_name, s_age, payment_state, payment_type )
	values (1,'Golara Akhavan' , 22 , 'Confirmed', 'cash');
    
INSERT INTO student (course_id, s_name, s_age, payment_state, payment_type )
	values (2,'Sam Toutounchi' , 24 , 'NOT_Confirmed', 'credit_cart');
    
    



INSERT INTO class (course_id, class_type, class_schedule)
	values (1,'Online' , 'Saturday-Wedensday');
    
INSERT INTO class (course_id, class_type, class_schedule)
	values (2, 'In_Person' , 'Sunday-Tuseday');
    
INSERT INTO class (course_id, class_type, class_schedule)
	values (3, 'Online' , 'Monday-Thursday');
    
    
    
    
    
INSERT INTO exam (p_id, class_id, e_type, e_date)
	values ('1' , '1','In-person','2023-02-7 10:30:00');

INSERT INTO exam (p_id, class_id, e_type, e_date)
	values ('2' , '2','In-person','2023-1-5 14:00:00');
    
INSERT INTO exam (p_id, class_id, e_type, e_date)
	values ('2' , '3','online', '2023-1-5 08:00:00');
    




INSERT INTO Placement_exam (pexam_name, pexam_date)
	values ('English' ,'2023-11-06 10:00:00' );
    
INSERT INTO Placement_exam (pexam_name, pexam_date)
	values ('English' , '2023-09-08 10:00:00');
    
INSERT INTO Placement_exam (pexam_name, pexam_date)
	values ('English' , '2023-10-23 10:00:00' );
    

    
/*This is the query that finds the student's name where studesnt's age is bigger than 21 and the professor's name is "Shahin Alipanahi".*/
SELECT s_name
FROM student st
JOIN professor pr ON pr.course_id = st.course_id 
WHERE st.s_age > 21
AND pr.p_name = "Shahin Alipanahi";

/*This is the second query where returns the count of students where the payment_satate is "confirmed" and the class's type is "online"*/
SELECT COUNT(student_id)
FROM student st
JOIN class cl ON cl.course_id = st.course_id
WHERE payment_state = "Confirmed"
AND class_type = "online";

/*comment one query in order to run the other, and vice versa.*/   