# UML - https://www.planttext.com/

@startuml
!theme vibrant

skin rose

title Backend Gym - Diagrama de Classe

class Gym {
  +String name
  +String email
  +String slug
  +Int gym_type_id
  -String cnpj
}

class AppConfig {
  +Boolean medical_attributes
  +Boolean gender_attribute
  +Int gym_id
}

class GymType {
  +String name
  +String slug
}

class Telephone {
  +String number
  +Int gym_id
  +Int user_id
}

class Location {
  +String name
  +String address
  +String number
  +String neighborhood
  +String complement
  +Int gym_id
  +Int user_id
}

class State {
  +String name
  +String uf
}

class City {
  +String name
  +Int state_id
}

class User {
  +String name
  +String email
  +String user_type
  +Boolean deleted
}

class Admin extends User {
   -String password
}

class Client extends User {
  +Float weight
  +Float height
  +String birthdate
  +String begindate
  +String fathers_name
  +String mothers_name
  +String occupation
  +String medical_name
  +String medical_address
  +String medical_email
  +String medical_telephone
  +String medical_type
  +String gender
  +Int plan_id
}

class Employee extends User {
  +String role
}

class Plan {
  +String name
  +Decimal price
  +Int gym_id
}

class Payment {
  +Decimal value
  +Decimal amount_paid
  +Date payment_date
  +Date due_date
  +Int payment_method_id
  +Int client_id
}

class PaymentMethod {
  +String name
  +String slug
}

class Record {
  +String begin_date
  +String end_date
  +String interval
  +Text goal
  +Int employee_id
  +Int client_id
}

class Training {
  +String name
  +Int record_id
}

class Exercise {
  +String name
  +Int qnt_series
  +Int qnt_repetitions
}

class TrainingExercise {
  +Int training_id
  +Int exercise_id
}


User "many" *-up- "1" Gym: Association
Gym "many" *-up- "1" GymType: Association
AppConfig "one" *-up- "1" Gym: Association
Telephone "many" *-up- "1" Gym: Association
Location "many" *-up- "1" Gym: Association
City "many" *-up- "1" State: Composition
Location "many" *-up- "1" City: Composition
Telephone "many" *-up- "1" User: Association
Location "many" *-up- "1" User: Association
Client "many" *-up- "1" Plan: Aggregation
Payment "many" *-up- "1" Client: Association
Record "many" *-up- "1" Client: Association
Payment "many" *-up- "1" PaymentMethod: Association
Record "many" *-up- "1" Employee: Association
Training "many" *-up- "1" Record: Composition
Exercise "many" *-up- "many" Training: Association
TrainingExercise "*" *-up- "1" Training 
TrainingExercise "*" *-up- "1" Exercise

@enduml