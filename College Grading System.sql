CREATE TABLE `students` (
  `student_id` int PRIMARY KEY AUTO_INCREMENT,
  `student_number` varchar(20) UNIQUE NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL,
  `year_level` int NOT NULL,
  `course_id` int NOT NULL
);

CREATE TABLE `instructors` (
  `instructor_id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) UNIQUE NOT NULL,
  `department` varchar(100) NOT NULL
);

CREATE TABLE `courses` (
  `course_id` int PRIMARY KEY AUTO_INCREMENT,
  `course_code` varchar(20) UNIQUE NOT NULL,
  `course_name` varchar(100) NOT NULL
);

CREATE TABLE `subjects` (
  `subject_id` int PRIMARY KEY AUTO_INCREMENT,
  `subject_code` varchar(20) UNIQUE NOT NULL,
  `subject_name` varchar(100) NOT NULL,
  `units` int NOT NULL
);

CREATE TABLE `sections` (
  `section_id` int PRIMARY KEY AUTO_INCREMENT,
  `section_name` varchar(50) NOT NULL,
  `subject_id` int NOT NULL,
  `instructor_id` int NOT NULL,
  `semester` varchar(20) NOT NULL,
  `school_year` varchar(20) NOT NULL
);

CREATE TABLE `enrollments` (
  `enrollment_id` int PRIMARY KEY AUTO_INCREMENT,
  `student_id` int NOT NULL,
  `section_id` int NOT NULL,
  `enrollment_date` date NOT NULL
);

CREATE TABLE `grades` (
  `grade_id` int PRIMARY KEY AUTO_INCREMENT,
  `enrollment_id` int NOT NULL,
  `prelim` decimal(5,2),
  `midterm` decimal(5,2),
  `final` decimal(5,2),
  `final_grade` decimal(5,2),
  `remarks` varchar(20)
);

ALTER TABLE `students` ADD FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

ALTER TABLE `sections` ADD FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

ALTER TABLE `sections` ADD FOREIGN KEY (`instructor_id`) REFERENCES `instructors` (`instructor_id`);

ALTER TABLE `enrollments` ADD FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

ALTER TABLE `enrollments` ADD FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`);

ALTER TABLE `grades` ADD FOREIGN KEY (`enrollment_id`) REFERENCES `enrollments` (`enrollment_id`);
