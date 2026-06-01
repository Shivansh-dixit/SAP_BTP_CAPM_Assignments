namespace hospital.management;

type Name        : String(100);
type Phone       : String(15);
type Email       : String(100);
type Amount      : Decimal(10,2);
type MedicalNote : String(1000);

type Gender : String(10) enum {
  Male; Female; Other;
}

type BloodGroup : String(5) enum {
  APos = 'A+'; ANeg = 'A-';
  BPos = 'B+'; BNeg = 'B-';
  OPos = 'O+'; ONeg = 'O-';
  ABPos = 'AB+'; ABNeg = 'AB-';
}

type AppointmentStatus : String(20) enum {
  Scheduled; Completed; Cancelled; NoShow;
}

entity Departments {
  key ID       : String(10);
  name         : Name;
  floor        : Integer;
  head         : Name;
  capacity     : Integer;
  phone        : Phone;
  isActive     : Boolean default true;
}

entity Doctors {
  key ID           : String(10);
  firstName        : Name;
  lastName         : Name;
  specialization   : String(100);
  qualification    : String(100);
  experience       : Integer;
  fee              : Amount;
  departmentId     : UUID;
  phone            : Phone;
  email            : Email;
  availableDays    : String(50);
  isActive         : Boolean default true;
}

entity Patients {
  key ID                : String(10);
  firstName             : Name;
  lastName              : Name;
  dateOfBirth           : Date;
  gender                : Gender;
  bloodGroup            : BloodGroup;
  phone                 : Phone;
  email                 : Email;
  address               : String(300);
  emergencyContact      : Phone;
  registrationDate      : Date;
}

entity Appointments {
  key ID               : String(10);
  patientId            : UUID;
  doctorId             : UUID;
  appointmentDate      : Date;
  appointmentTime      : Time;
  status               : AppointmentStatus default 'Scheduled';
  reason               : String(300);
  notes                : MedicalNote;
  fee                  : Amount;
}

entity MedicalRecords {
  key ID              : String(10);
  patientId           : UUID;
  doctorId            : UUID;
  appointmentId       : UUID;
  diagnosis           : MedicalNote;
  prescription        : MedicalNote;
  testRecommended     : String(500);
  recordDate          : Date;
} 