namespace platform.events;

type Email  : String(100);
type Phone  : String(15);
type Amount : Decimal(10,2);
type Rating : Integer;
type Name   : String(100);
type URL    : String(300);

type EventType : String(20) enum {
  Conference; Workshop; Seminar; Webinar; Meetup;
}

type EventStatus : String(20) enum {
  Draft; Published; Ongoing; Completed; Cancelled;
}

type TicketType : String(10) enum {
  General; VIP; Student;
}

type RegistrationStatus : String(20) enum {
  Confirmed; Cancelled; Waitlisted; Attended;
}

type VenueType : String(20) enum {
  Auditorium; ConferenceHall; Outdoor; Virtual;
}

entity Venues {
  key ID            : String(10);
  name              : Name;
  address           : String(300);
  city              : String(100);
  capacity          : Integer;
  type              : VenueType;
  amenities         : String(300);
  hourlyRate        : Amount;
  contactPerson     : Name;
  phone             : Phone;
  isActive          : Boolean default true;
}

entity Events {
  key ID              : String(10);
  title               : String(200);
  description         : String(1000);
  eventType           : EventType;
  venueId             : String(10);
  startDate           : Date;
  endDate             : Date;
  startTime           : Time;
  endTime             : Time;
  maxAttendees        : Integer;
  registeredCount     : Integer default 0;
  ticketPrice         : Amount;
  status              : EventStatus default 'Draft';
  organizerName       : Name;
  organizerEmail      : Email;
  tags                : String(300);
}

entity Speakers {
  key ID          : String(10);
  name            : Name;
  email           : Email;
  phone           : Phone;
  bio             : String(1000);
  company         : String(100);
  designation     : String(100);
  expertise       : String(300);
  photoUrl        : URL;
  rating          : Rating;
  totalTalks      : Integer;
  isActive        : Boolean default true;
}

entity EventSpeakers {
  key eventId         : String(10);
  key speakerId       : String(10);
  topic               : String(200);
  sessionTime         : Time;
  sessionDuration     : Integer;
  roomNumber          : String(20);
}

entity Registrations {
  key ID              : String(10);
  eventId             : String(10);
  attendeeName        : Name;
  attendeeEmail       : Email;
  attendeePhone       : Phone;
  company             : String(100);
  ticketType          : TicketType;
  registrationDate    : Date;
  status              : RegistrationStatus default 'Confirmed';
  amountPaid          : Amount;
  paymentId           : String(50);
}

entity Feedback {
  key ID            : String(10);
  eventId           : String(10);
  attendeeEmail     : Email;
  overallRating     : Rating;
  contentRating     : Rating;
  venueRating       : Rating;
  speakerRating     : Rating;
  comment           : String(1000);
  submittedAt       : DateTime;
}