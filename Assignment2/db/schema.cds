namespace edu.university;

type Email      : String(100);
type Phone      : String(15);
type Percentage : Decimal(5,2);
type GradePoint : Decimal(4,2);
type Semester   : Integer;

type Designation : String(20) enum {
  Assistant; Associate; Full; Distinguished;
}

type EnrollmentStatus : String(20) enum {
  Enrolled; Dropped; Completed;
}

type Grade : String(2) enum {
  A; B; C; D; F;
}

type ExamType : String(20) enum {
  Midterm; Final; Quiz; Assignment;
}

entity Departments {
  key code           : String(10);
  name               : String(100);
  building           : String(100);
  headProfessor      : String(100);
  establishedYear    : Integer;
}

entity Professors {
  key ID             : String(10);
  firstName          : String(100);
  lastName           : String(100);
  email              : Email;
  phone              : Phone;
  departmentCode     : String(10);
  designation        : Designation;
  joinDate           : Date;
  salary             : Decimal(10,2);
  officeRoom         : String(20);
}

entity Courses {
  key code           : String(10);
  title              : String(100);
  description        : String(500);
  credits            : Integer;
  maxStudents        : Integer;
  currentEnrolled    : Integer default 0;
  semester           : Semester;
  departmentCode     : String(10);
  professorId        : String(10);
  schedule           : String(50);
  roomNumber         : String(20);
  isActive           : Boolean default true;
}

entity Students {
  key ID             : String(10);
  rollNumber         : String(20);
  firstName          : String(100);
  lastName           : String(100);
  email              : Email;
  phone              : Phone;
  dateOfBirth        : Date;
  admissionYear      : Integer;
  currentSemester    : Semester;
  cgpa               : GradePoint;
  departmentCode     : String(10);
  isActive           : Boolean default true;
}

entity Enrollments {
  key studentId      : String(10);
  key courseCode     : String(10);
  enrollmentDate     : Date;
  status             : EnrollmentStatus default 'Enrolled';
  grade              : Grade;
  gradePoints        : GradePoint;
  attendancePercent  : Percentage;
}

entity Exams {
  key ID             : String(10);
  courseCode         : String(10);
  examType           : ExamType;
  date               : Date;
  maxMarks           : Integer;
  weightagePercent   : Percentage;
}