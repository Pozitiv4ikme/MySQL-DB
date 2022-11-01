-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-09-29 17:15:15.892

-- tables
-- Table: city
CREATE TABLE city (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    CONSTRAINT city_pk PRIMARY KEY (id)
);

-- Table: client
CREATE TABLE client (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    surname varchar(40) NOT NULL,
    membership_card_id int NOT NULL,
    gender_id int NULL,
    birthday date NOT NULL,
    phone varchar(12) NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY (id,membership_card_id)
);

-- Table: client_membership_card
CREATE TABLE client_membership_card (
    client_membership_card_id int NOT NULL,
    gym_id int NOT NULL,
    client_id int NOT NULL,
    CONSTRAINT client_membership_card_pk PRIMARY KEY (client_membership_card_id)
);

-- Table: exercise
CREATE TABLE exercise (
    id int NOT NULL AUTO_INCREMENT,
    number_of_repetitions int NOT NULL,
    approach int NOT NULL,
    complexity int NULL,
    type_of_musculse_load_on_id int NOT NULL,
    personal_exercise_machine_id int NOT NULL,
    CONSTRAINT exercise_pk PRIMARY KEY (id)
);

-- Table: free_general_training_program
CREATE TABLE free_general_training_program (
    id int NOT NULL AUTO_INCREMENT,
    day varchar(30) NOT NULL,
    exercise varchar(30) NULL,
    UNIQUE INDEX day (day),
    CONSTRAINT free_general_training_program_pk PRIMARY KEY (id)
);

-- Table: gender
CREATE TABLE gender (
    id int NOT NULL AUTO_INCREMENT,
    value varchar(30) NOT NULL,
    CONSTRAINT gender_pk PRIMARY KEY (id)
);

-- Table: general_training
CREATE TABLE general_training (
    id int NOT NULL AUTO_INCREMENT,
    trainer_id int NOT NULL,
    free_general_training_program_id int NOT NULL,
    week_work_schedule_id int NOT NULL,
    CONSTRAINT general_training_pk PRIMARY KEY (id)
);

-- Table: gym
CREATE TABLE gym (
    id int NOT NULL AUTO_INCREMENT,
    phone varchar(12) NOT NULL,
    street_address varchar(30) NOT NULL,
    service_id int NOT NULL,
    week_work_schedule_id int NOT NULL,
    city_id int NOT NULL,
    CONSTRAINT gym_pk PRIMARY KEY (id)
);

-- Table: massage
CREATE TABLE massage (
    id int NOT NULL AUTO_INCREMENT,
    masseur_id int NOT NULL,
    massage_type_id int NOT NULL,
    CONSTRAINT massage_pk PRIMARY KEY (id)
);

-- Table: massage_type
CREATE TABLE massage_type (
    id int NOT NULL AUTO_INCREMENT,
    type varchar(30) NOT NULL,
    CONSTRAINT massage_type_pk PRIMARY KEY (id)
);

-- Table: masseur
CREATE TABLE masseur (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(30) NOT NULL,
    surname varchar(30) NOT NULL,
    phone varchar(12) NOT NULL,
    week_work_schedule_id int NOT NULL,
    masseur_price_list_id int NOT NULL,
    CONSTRAINT masseur_pk PRIMARY KEY (id)
);

-- Table: masseur_price_list
CREATE TABLE masseur_price_list (
    id int NOT NULL AUTO_INCREMENT,
    one_time decimal(8,2) NULL,
    three_time decimal(8,2) NULL,
    seven_plus_three_free_time decimal(8,2) NULL,
    one_month_subscription decimal(8,2) NULL,
    CONSTRAINT masseur_price_list_pk PRIMARY KEY (id)
);

-- Table: membership_card
CREATE TABLE membership_card (
    id int NOT NULL AUTO_INCREMENT,
    type_membership_card_id int NOT NULL,
    CONSTRAINT membership_card_pk PRIMARY KEY (id)
);

-- Table: personal_exercise_machine
CREATE TABLE personal_exercise_machine (
    id int NOT NULL AUTO_INCREMENT,
    type varchar(20) NOT NULL,
    client_weight int NULL,
    client_height int NULL,
    client_shoulder_width int NULL,
    client_leg_length int NULL,
    client_amount_of_fat_in_body int NULL,
    client_muscle_mass int NULL,
    client_state_of_health varchar(30) NOT NULL,
    CONSTRAINT personal_exercise_machine_pk PRIMARY KEY (id)
);

-- Table: personal_training
CREATE TABLE personal_training (
    id int NOT NULL AUTO_INCREMENT,
    trainer_id int NOT NULL,
    exercise_id int NOT NULL,
    CONSTRAINT personal_training_pk PRIMARY KEY (id)
);

-- Table: sauna
CREATE TABLE sauna (
    id int NOT NULL AUTO_INCREMENT,
    sauna_type_id int NOT NULL,
    week_work_schedule_id int NOT NULL,
    CONSTRAINT sauna_pk PRIMARY KEY (id)
);

-- Table: sauna_price_list
CREATE TABLE sauna_price_list (
    id int NOT NULL AUTO_INCREMENT,
    three_time decimal(8,2) NULL,
    one_week decimal(8,2) NULL,
    one_month decimal(8,2) NULL,
    CONSTRAINT sauna_price_list_pk PRIMARY KEY (id)
);

-- Table: sauna_type
CREATE TABLE sauna_type (
    id int NOT NULL AUTO_INCREMENT,
    type varchar(30) NOT NULL,
    sauna_price_list_id int NOT NULL,
    CONSTRAINT sauna_type_pk PRIMARY KEY (id)
);

-- Table: service
CREATE TABLE service (
    id int NOT NULL AUTO_INCREMENT,
    personal_training_id int NOT NULL,
    general_training_id int NOT NULL,
    massage_id int NOT NULL,
    sauna_id int NOT NULL,
    CONSTRAINT service_pk PRIMARY KEY (id)
);

-- Table: trainer
CREATE TABLE trainer (
    id int NOT NULL AUTO_INCREMENT,
    name varchar(25) NOT NULL,
    surname varchar(30) NOT NULL,
    trainer_area_of_work_id int NULL,
    phone varchar(12) NOT NULL,
    trainer_membership_id int NULL,
    week_work_schedule_id int NOT NULL,
    CONSTRAINT trainer_pk PRIMARY KEY (id)
);

-- Table: trainer_area_of_work
CREATE TABLE trainer_area_of_work (
    id int NOT NULL AUTO_INCREMENT,
    area_of_work varchar(35) NOT NULL,
    CONSTRAINT trainer_area_of_work_pk PRIMARY KEY (id)
);

-- Table: trainer_membership
CREATE TABLE trainer_membership (
    id int NOT NULL AUTO_INCREMENT,
    price_one_lesson decimal(8,2) NULL,
    price_three_lesson decimal(8,2) NULL,
    one_week_work decimal(8,2) NULL,
    one_month_work decimal(8,2) NULL,
    half_year_work decimal(8,2) NULL,
    one_year_work decimal(8,2) NULL,
    CONSTRAINT trainer_membership_pk PRIMARY KEY (id)
);

-- Table: type_membership_card
CREATE TABLE type_membership_card (
    id int NOT NULL AUTO_INCREMENT,
    price decimal(8,2) NOT NULL,
    discount decimal(8,2) NULL,
    personal_training_id int NULL,
    massage_id int NULL,
    sauna_id int NULL,
    CONSTRAINT type_membership_card_pk PRIMARY KEY (id)
);

-- Table: type_of_musculse_load_on
CREATE TABLE type_of_musculse_load_on (
    id int NOT NULL AUTO_INCREMENT,
    type_of_load_on varchar(30) NOT NULL,
    CONSTRAINT type_of_musculse_load_on_pk PRIMARY KEY (id)
);

-- Table: week_work_schedule
CREATE TABLE week_work_schedule (
    id int NOT NULL AUTO_INCREMENT,
    day varchar(20) NOT NULL,
    day_start_work time NOT NULL,
    day_end_work time NOT NULL,
    UNIQUE INDEX day (day),
    CONSTRAINT week_work_schedule_pk PRIMARY KEY (id)
);

-- foreign keys
-- Reference: client_gender (table: client)
ALTER TABLE client ADD CONSTRAINT client_gender FOREIGN KEY client_gender (gender_id)
    REFERENCES gender (id);

-- Reference: client_membership_card (table: client)
ALTER TABLE client ADD CONSTRAINT client_membership_card FOREIGN KEY client_membership_card (membership_card_id)
    REFERENCES membership_card (id);

-- Reference: client_membership_card_client (table: client_membership_card)
ALTER TABLE client_membership_card ADD CONSTRAINT client_membership_card_client FOREIGN KEY client_membership_card_client (client_id,client_membership_card_id)
    REFERENCES client (id,membership_card_id);

-- Reference: client_membership_card_gym (table: client_membership_card)
ALTER TABLE client_membership_card ADD CONSTRAINT client_membership_card_gym FOREIGN KEY client_membership_card_gym (gym_id)
    REFERENCES gym (id);

-- Reference: exercise_personal_exercise_machine (table: exercise)
ALTER TABLE exercise ADD CONSTRAINT exercise_personal_exercise_machine FOREIGN KEY exercise_personal_exercise_machine (personal_exercise_machine_id)
    REFERENCES personal_exercise_machine (id);

-- Reference: exercise_type_of_musculse_load_on (table: exercise)
ALTER TABLE exercise ADD CONSTRAINT exercise_type_of_musculse_load_on FOREIGN KEY exercise_type_of_musculse_load_on (type_of_musculse_load_on_id)
    REFERENCES type_of_musculse_load_on (id);

-- Reference: general_training_free_general_training_program (table: general_training)
ALTER TABLE general_training ADD CONSTRAINT general_training_free_general_training_program FOREIGN KEY general_training_free_general_training_program (free_general_training_program_id)
    REFERENCES free_general_training_program (id);

-- Reference: general_training_trainer (table: general_training)
ALTER TABLE general_training ADD CONSTRAINT general_training_trainer FOREIGN KEY general_training_trainer (trainer_id)
    REFERENCES trainer (id);

-- Reference: general_training_week_work_schedule (table: general_training)
ALTER TABLE general_training ADD CONSTRAINT general_training_week_work_schedule FOREIGN KEY general_training_week_work_schedule (week_work_schedule_id)
    REFERENCES week_work_schedule (id);

-- Reference: gym_city (table: gym)
ALTER TABLE gym ADD CONSTRAINT gym_city FOREIGN KEY gym_city (city_id)
    REFERENCES city (id);

-- Reference: gym_service (table: gym)
ALTER TABLE gym ADD CONSTRAINT gym_service FOREIGN KEY gym_service (service_id)
    REFERENCES service (id);

-- Reference: gym_week_work_schedule (table: gym)
ALTER TABLE gym ADD CONSTRAINT gym_week_work_schedule FOREIGN KEY gym_week_work_schedule (week_work_schedule_id)
    REFERENCES week_work_schedule (id);

-- Reference: massage_massage_type (table: massage)
ALTER TABLE massage ADD CONSTRAINT massage_massage_type FOREIGN KEY massage_massage_type (massage_type_id)
    REFERENCES massage_type (id);

-- Reference: massage_masseur (table: massage)
ALTER TABLE massage ADD CONSTRAINT massage_masseur FOREIGN KEY massage_masseur (masseur_id)
    REFERENCES masseur (id);

-- Reference: masseur_masseur_price_list (table: masseur)
ALTER TABLE masseur ADD CONSTRAINT masseur_masseur_price_list FOREIGN KEY masseur_masseur_price_list (masseur_price_list_id)
    REFERENCES masseur_price_list (id);

-- Reference: masseur_week_work_schedule (table: masseur)
ALTER TABLE masseur ADD CONSTRAINT masseur_week_work_schedule FOREIGN KEY masseur_week_work_schedule (week_work_schedule_id)
    REFERENCES week_work_schedule (id);

-- Reference: membership_card_type_membership_card (table: membership_card)
ALTER TABLE membership_card ADD CONSTRAINT membership_card_type_membership_card FOREIGN KEY membership_card_type_membership_card (type_membership_card_id)
    REFERENCES type_membership_card (id);

-- Reference: personal_training_exercise (table: personal_training)
ALTER TABLE personal_training ADD CONSTRAINT personal_training_exercise FOREIGN KEY personal_training_exercise (exercise_id)
    REFERENCES exercise (id);

-- Reference: personal_training_trainer (table: personal_training)
ALTER TABLE personal_training ADD CONSTRAINT personal_training_trainer FOREIGN KEY personal_training_trainer (trainer_id)
    REFERENCES trainer (id);

-- Reference: sauna_sauna_type (table: sauna)
ALTER TABLE sauna ADD CONSTRAINT sauna_sauna_type FOREIGN KEY sauna_sauna_type (sauna_type_id)
    REFERENCES sauna_type (id);

-- Reference: sauna_type_sauna_price_list (table: sauna_type)
ALTER TABLE sauna_type ADD CONSTRAINT sauna_type_sauna_price_list FOREIGN KEY sauna_type_sauna_price_list (sauna_price_list_id)
    REFERENCES sauna_price_list (id);

-- Reference: sauna_week_work_schedule (table: sauna)
ALTER TABLE sauna ADD CONSTRAINT sauna_week_work_schedule FOREIGN KEY sauna_week_work_schedule (week_work_schedule_id)
    REFERENCES week_work_schedule (id);

-- Reference: service_general_training (table: service)
ALTER TABLE service ADD CONSTRAINT service_general_training FOREIGN KEY service_general_training (general_training_id)
    REFERENCES general_training (id);

-- Reference: service_massage (table: service)
ALTER TABLE service ADD CONSTRAINT service_massage FOREIGN KEY service_massage (massage_id)
    REFERENCES massage (id);

-- Reference: service_personal_training (table: service)
ALTER TABLE service ADD CONSTRAINT service_personal_training FOREIGN KEY service_personal_training (personal_training_id)
    REFERENCES personal_training (id);

-- Reference: service_sauna (table: service)
ALTER TABLE service ADD CONSTRAINT service_sauna FOREIGN KEY service_sauna (sauna_id)
    REFERENCES sauna (id);

-- Reference: trainer_trainer_area_of_work (table: trainer)
ALTER TABLE trainer ADD CONSTRAINT trainer_trainer_area_of_work FOREIGN KEY trainer_trainer_area_of_work (trainer_area_of_work_id)
    REFERENCES trainer_area_of_work (id);

-- Reference: trainer_trainer_membership (table: trainer)
ALTER TABLE trainer ADD CONSTRAINT trainer_trainer_membership FOREIGN KEY trainer_trainer_membership (trainer_membership_id)
    REFERENCES trainer_membership (id);

-- Reference: trainer_week_work_schedule (table: trainer)
ALTER TABLE trainer ADD CONSTRAINT trainer_week_work_schedule FOREIGN KEY trainer_week_work_schedule (week_work_schedule_id)
    REFERENCES week_work_schedule (id);

-- Reference: type_membership_card_massage (table: type_membership_card)
ALTER TABLE type_membership_card ADD CONSTRAINT type_membership_card_massage FOREIGN KEY type_membership_card_massage (massage_id)
    REFERENCES massage (id);

-- Reference: type_membership_card_personal_training (table: type_membership_card)
ALTER TABLE type_membership_card ADD CONSTRAINT type_membership_card_personal_training FOREIGN KEY type_membership_card_personal_training (personal_training_id)
    REFERENCES personal_training (id);

-- Reference: type_membership_card_sauna (table: type_membership_card)
ALTER TABLE type_membership_card ADD CONSTRAINT type_membership_card_sauna FOREIGN KEY type_membership_card_sauna (sauna_id)
    REFERENCES sauna (id);

-- End of file.

