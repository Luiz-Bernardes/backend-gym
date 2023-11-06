# UML - https://www.planttext.com/

@startuml
!theme vibrant

skin rose

title Backend Gym - Diagrama de Classe

class Gym {
  +String name
  +String slug
  -String cnpj
}

class Email {
  +String address
  +Int gym_id
  +Int user_id
}

class Telephone {
  +String number
  +Int gym_id
  +Int user_id
}

class Location {
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
  +String user_type
}

class Admin extends User {
   +Boo is_admin
}

class Client extends User {
  +Float weight
  +Float height
  +String birthdate
  +String begindate
  +Int plan_id
}

class Employee extends User {
  +String role
}

class Plan {
  +String name
  +Float price
  +Int gym_id
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

Email "many" *-up- "1" Gym: Association
Telephone "many" *-up- "1" Gym: Association
Location "many" *-up- "1" Gym: Association
City "many" *-up- "1" State: Composition
Location "many" *-up- "1" City: Composition
Email "many" *-up- "1" User: Association
Telephone "many" *-up- "1" User: Association
Location "many" *-up- "1" User: Association
Client "many" *-up- "1" Plan: Aggregation
Record "many" *-up- "1" Client: Association
Record "many" *-up- "1" Employee: Association
Training "many" *-up- "1" Record: Composition
Exercise "many" *-up- "many" Training: Association
TrainingExercise "*" *-up- "1" Training 
TrainingExercise "*" *-up- "1" Exercise

@enduml