using hospital.management from '../db/schema';

service HospitalService {
  entity Departments    as projection on management.Departments;
  entity Doctors        as projection on management.Doctors;
  entity Patients       as projection on management.Patients;
  entity Appointments   as projection on management.Appointments;
  entity MedicalRecords as projection on management.MedicalRecords;
}