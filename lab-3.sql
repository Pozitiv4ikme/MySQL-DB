-- Create database
CREATE DATABASE IF NOT EXISTS study_iot;
USE study_iot;

-- Create schema for gym

-- Tables

DROP TABLE IF EXISTS client_membership_card;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS membership_card;
DROP TABLE IF EXISTS gender;
DROP TABLE IF EXISTS type_membership_card;
DROP TABLE IF EXISTS gym_schedule;
DROP TABLE IF EXISTS gym;
DROP TABLE IF EXISTS city;

DROP TABLE IF EXISTS service;

DROP TABLE IF EXISTS general_training_schedule;
DROP TABLE IF EXISTS general_training;
DROP TABLE IF EXISTS free_general_training_program;

DROP TABLE IF EXISTS sauna_schedule;
DROP TABLE IF EXISTS sauna;
DROP TABLE IF EXISTS sauna_price_list;

DROP TABLE IF EXISTS massage;
DROP TABLE IF EXISTS massage_type;
DROP TABLE IF EXISTS masseur_schedule;
DROP TABLE IF EXISTS masseur;
DROP TABLE IF EXISTS masseur_price_list;

DROP TABLE IF EXISTS personal_training;
DROP TABLE IF EXISTS exercise;
DROP TABLE IF EXISTS type_of_muscle_load_on;
DROP TABLE IF EXISTS personal_exercise_machine;

DROP TABLE IF EXISTS trainer_schedule;
DROP TABLE IF EXISTS trainer;
DROP TABLE IF EXISTS trainer_membership;
DROP TABLE IF EXISTS trainer_area_of_work;
DROP TABLE IF EXISTS work_schedule;

-- Table: work schedule - week schedule where we put info about all ( trainer, gym, masseur, sauna, etc. )
CREATE TABLE work_schedule (
        id INT AUTO_INCREMENT,
        day VARCHAR(20) NOT NULL,
        d_start TIME NOT NULL,
        d_end TIME NOT NULL,
        CONSTRAINT work_schedule_pk PRIMARY KEY (id)
) ENGINE = INNODB;

-- Table: trainer area of work
CREATE TABLE trainer_area_of_work (
        id INT AUTO_INCREMENT,
        area_of_work VARCHAR(35) NOT NULL,
        CONSTRAINT trainer_area_of_work_pk PRIMARY KEY (id)
) ENGINE = INNODB;

-- Table: trainer membership
CREATE TABLE trainer_membership (
        id INT AUTO_INCREMENT,
        one_l DECIMAL(8,2) NULL,
        three_l DECIMAL(8,2) NULL,
        one_week DECIMAL(8,2) NULL,
        one_month DECIMAL(8,2) NULL,
        three_month DECIMAL(8,2) NULL,
        CONSTRAINT trainer_membership_pk PRIMARY KEY (id)
) ENGINE = INNODB;

-- Table: trainer of gym ( can be many )
CREATE TABLE trainer (
        id INT AUTO_INCREMENT,
        name VARCHAR(25) NOT NULL,
        surname VARCHAR(30) NOT NULL,
        trainer_area_of_work_id INT NULL,
        phone VARCHAR(12) NOT NULL,
        trainer_membership_id INT NULL,
        CONSTRAINT trainer_pk PRIMARY KEY (id),
        FOREIGN KEY (trainer_area_of_work_id) REFERENCES trainer_area_of_work(id),
        FOREIGN KEY (trainer_membership_id) REFERENCES trainer_membership(id)
) ENGINE = INNODB;

-- Table: trainer schedule - week schedule for trainer
CREATE TABLE trainer_schedule (
        trainer_id INT NOT NULL,
        work_schedule_id INT NOT NULL,
        FOREIGN KEY (trainer_id) REFERENCES trainer(id),
        FOREIGN KEY (work_schedule_id) REFERENCES work_schedule(id)
) ENGINE = INNODB;


-- end of trainer part


-- Table: personal_exercise_machine
CREATE TABLE personal_exercise_machine (
        id INT AUTO_INCREMENT,
        client_weight INT NULL,
        client_height INT NULL,
        client_shoulder_width INT NULL,
        client_leg_length INT NULL,
        client_amount_of_fat_in_body INT NULL,
        client_muscle_mass INT NULL,
        client_state_of_health varchar(30) NOT NULL,
        CONSTRAINT personal_exercise_machine_pk PRIMARY KEY (id)
) ENGINE = INNODB;

-- Table: type of muscle load on
CREATE TABLE type_of_muscle_load_on (
        id INT NOT NULL AUTO_INCREMENT,
        type_of_load_on VARCHAR(30) NOT NULL,
        CONSTRAINT type_of_muscle_load_on PRIMARY KEY (id)
) ENGINE = INNODB;

-- Table: exercise
CREATE TABLE exercise (
        id INT NOT NULL AUTO_INCREMENT,
        number_of_repetitions INT NOT NULL,
        approach INT NOT NULL,
        complexity INT NULL,
        type_of_muscle_load_on_id INT NOT NULL,
        personal_exercise_machine_id INT NOT NULL,
        CONSTRAINT exercise_pk PRIMARY KEY (id),
        FOREIGN KEY (type_of_muscle_load_on_id) REFERENCES type_of_muscle_load_on(id),
        FOREIGN KEY (personal_exercise_machine_id) REFERENCES personal_exercise_machine(id)
) ENGINE = INNODB;

-- Table: personal training
CREATE TABLE personal_training (
        id INT AUTO_INCREMENT,
        trainer_id INT NOT NULL,
        exercise_id INT NOT NULL,
        CONSTRAINT personal_training_pk PRIMARY KEY (id),
        FOREIGN KEY (trainer_id) REFERENCES trainer(id),
        FOREIGN KEY (exercise_id) REFERENCES exercise(id)
) ENGINE = INNODB;


-- end of personal trainer part


-- Table: masseur price list
CREATE TABLE masseur_price_list (
        id INT AUTO_INCREMENT,
        one_t DECIMAL(8,2) NULL,
        three_t DECIMAL(8,2) NULL,
        seven_plus_three_t DECIMAL(8,2) NULL,
        one_month DECIMAL(8,2) NULL,
        CONSTRAINT masseur_price_list_pk PRIMARY KEY (id)
) ENGINE = INNODB;

-- Table: masseur
CREATE TABLE masseur (
        id INT AUTO_INCREMENT,
        name VARCHAR(30) NOT NULL,
        surname VARCHAR(30) NOT NULL,
        phone VARCHAR(12) NOT NULL,
        masseur_price_list_id INT NOT NULL,
        CONSTRAINT masseur_pk PRIMARY KEY (id),
        FOREIGN KEY (masseur_price_list_id) REFERENCES masseur_price_list(id)
) ENGINE = INNODB;

-- Table: masseur schedule - week schedule for masseur
CREATE TABLE masseur_schedule (
        masseur_id INT NOT NULL,
        work_schedule_id INT NOT NULL,
        FOREIGN KEY (masseur_id) REFERENCES masseur(id),
        FOREIGN KEY (work_schedule_id) REFERENCES work_schedule(id)
) ENGINE = INNODB;

-- Table: massage type
CREATE TABLE massage_type (
        id INT AUTO_INCREMENT,
        type VARCHAR(30) NOT NULL,
        CONSTRAINT massage_type_pk PRIMARY KEY (id)
) ENGINE = INNODB;

-- Table: massage
CREATE TABLE massage (
        id INT AUTO_INCREMENT,
        masseur_id INT NOT NULL,
        massage_type_id INT NOT NULL,
        CONSTRAINT massage_pk PRIMARY KEY (id),
        FOREIGN KEY (masseur_id) REFERENCES masseur(id),
        FOREIGN KEY (massage_type_id) REFERENCES massage_type(id)
) ENGINE = INNODB;


-- end of massage part


-- Table: sauna price list
CREATE TABLE sauna_price_list (
        id INT AUTO_INCREMENT,
        three_time DECIMAL(8,2) NULL,
        one_week DECIMAL(8,2) NULL,
        one_month DECIMAL(8,2) NULL,
        CONSTRAINT sauna_price_list_pk PRIMARY KEY (id)
) ENGINE = INNODB;

-- Table: sauna
CREATE TABLE sauna (
        id INT AUTO_INCREMENT,
        type VARCHAR(30) NOT NULL,
        sauna_price_list_id INT NOT NULL,
        CONSTRAINT sauna_pk PRIMARY KEY (id),
        FOREIGN KEY (sauna_price_list_id) REFERENCES sauna_price_list(id)
) ENGINE = INNODB;

-- Table: sauna schedule - week schedule for sauna
CREATE TABLE sauna_schedule (
        sauna_id INT NOT NULL,
        work_schedule_id INT NOT NULL,
        FOREIGN KEY (sauna_id) REFERENCES sauna(id),
        FOREIGN KEY (work_schedule_id) REFERENCES work_schedule(id)
) ENGINE = INNODB;


-- end of massage part


-- Table: free general training program
CREATE TABLE free_general_training_program (
        id INT AUTO_INCREMENT,
        day VARCHAR(30) NOT NULL,
        exercise VARCHAR(30) NULL,
        UNIQUE INDEX day (day),
        CONSTRAINT free_general_training_program_pk PRIMARY KEY (id)
) ENGINE = INNODB;

-- Table: general training
CREATE TABLE general_training (
        id INT AUTO_INCREMENT,
        trainer_id INT NOT NULL,
        free_general_training_program_id int NOT NULL,
        CONSTRAINT general_training_pk PRIMARY KEY (id),
        FOREIGN KEY (trainer_id) REFERENCES trainer(id),
        FOREIGN KEY (free_general_training_program_id) REFERENCES free_general_training_program(id)
) ENGINE = INNODB;

-- Table: sauna schedule - week schedule for sauna
CREATE TABLE general_training_schedule (
        general_training_id INT NOT NULL,
        work_schedule_id INT NOT NULL,
        FOREIGN KEY (general_training_id) REFERENCES general_training(id),
        FOREIGN KEY (work_schedule_id) REFERENCES work_schedule(id)
) ENGINE = INNODB;


-- end of massage part


-- Table: service
CREATE TABLE service (
        id INT AUTO_INCREMENT,
        personal_training_id INT NOT NULL,
        general_training_id INT NOT NULL,
        massage_id INT NOT NULL,
        sauna_id INT NOT NULL,
        CONSTRAINT service_pk PRIMARY KEY (id),
        FOREIGN KEY (personal_training_id) REFERENCES personal_training(id),
        FOREIGN KEY (general_training_id) REFERENCES general_training(id),
        FOREIGN KEY (massage_id) REFERENCES massage(id),
        FOREIGN KEY (sauna_id) REFERENCES sauna(id)
) ENGINE = INNODB;


-- end of service part


-- Table: city - where is placed gym
CREATE TABLE city (
        id INT AUTO_INCREMENT,
        name VARCHAR(30) NOT NULL,
        CONSTRAINT city_pk PRIMARY KEY (id)
) ENGINE = INNODB;

-- Table: gym
CREATE TABLE gym (
        id INT AUTO_INCREMENT,
        phone VARCHAR(12) NOT NULL,
        street_address VARCHAR(30) NOT NULL,
        service_id INT NOT NULL,
        city_id INT NOT NULL,
        CONSTRAINT gym_pk PRIMARY KEY (id),
        FOREIGN KEY (service_id) REFERENCES service(id),
        FOREIGN KEY (city_id) REFERENCES city(id)
) ENGINE = INNODB;

-- Table: gym schedule - week schedule for gym
CREATE TABLE gym_schedule (
        gym_id INT NOT NULL,
        work_schedule_id INT NOT NULL,
        FOREIGN KEY (gym_id) REFERENCES gym(id),
        FOREIGN KEY (work_schedule_id) REFERENCES work_schedule(id)
) ENGINE = INNODB;


-- end of gym part


-- Table: type_membership_card
CREATE TABLE type_membership_card (
        id INT AUTO_INCREMENT,
        price DECIMAL(8,2) NOT NULL,
        discount DECIMAL(8,2) NULL,
        personal_training_id INT NULL,
        massage_id INT NULL,
        sauna_id INT NULL,
        CONSTRAINT type_membership_card_pk PRIMARY KEY (id),
        FOREIGN KEY (personal_training_id) REFERENCES personal_training(id),
        FOREIGN KEY (massage_id) REFERENCES massage(id),
        FOREIGN KEY (sauna_id) REFERENCES sauna(id)
) ENGINE = INNODB;

-- Table: gender
CREATE TABLE gender (
        id INT NOT NULL AUTO_INCREMENT,
        value VARCHAR(30) NOT NULL,
        CONSTRAINT gender_pk PRIMARY KEY (id)
) ENGINE = INNODB;

-- Table: membership card
CREATE TABLE membership_card (
        id INT NOT NULL AUTO_INCREMENT,
        type_membership_card_id INT NOT NULL,
        CONSTRAINT membership_card_pk PRIMARY KEY (id),
        FOREIGN KEY (type_membership_card_id) REFERENCES type_membership_card(id)
) ENGINE = INNODB;

-- Table: client of the gym
CREATE TABLE client (
        id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(25) NOT NULL,
        surname VARCHAR(30) NOT NULL,
        membership_card_id INT NOT NULL,
        gender_id INT NULL,
        birthday DATE NOT NULL,
        phone VARCHAR(12) NOT NULL,
        CONSTRAINT client_pk PRIMARY KEY (id,membership_card_id),
        FOREIGN KEY (membership_card_id) REFERENCES membership_card(id),
        FOREIGN KEY (gender_id) REFERENCES gender(id)
) ENGINE = INNODB;

-- Table: client_membership_card
CREATE TABLE client_membership_card (
        gym_id INT NOT NULL,
        client_id INT NOT NULL,
        FOREIGN KEY (gym_id) REFERENCES gym(id),
        FOREIGN KEY (client_id) REFERENCES client(id)
) ENGINE = INNODB;


-- Indexes of tables

-- for get info about work schedule
CREATE INDEX trainer_schedule_index ON trainer_schedule(trainer_id, work_schedule_id);
CREATE INDEX masseur_schedule_index ON masseur_schedule(masseur_id, work_schedule_id);
CREATE INDEX sauna_schedule_index ON sauna_schedule(sauna_id, work_schedule_id);
CREATE INDEX general_training_schedule_index ON general_training_schedule(general_training_id, work_schedule_id);
CREATE INDEX gym_schedule_index ON gym_schedule(gym_id, work_schedule_id);

-- for announcement about discount on some card
CREATE INDEX client_index ON client(name, surname, phone);

-- for get fast info about gym
CREATE INDEX gym_index ON gym(phone, street_address, city_id);

-- for fast presentation what your gym have
CREATE INDEX gym_services_index ON gym(id, service_id);


-- Insertion in tables

INSERT INTO work_schedule(day, d_start, d_end) VALUES

-- gym work schedule
('Monday', '08:30:00', '22:00:00'),
('Tuesday', '08:30:00', '22:00:00'),
('Wednesday', '09:00:00', '22:30:00'),
('Thursday', '09:00:00', '22:30:00'),
('Friday', '09:00:00', '23:00:00'),
('Saturday', '10:00:00', '22:00:00'),
('Sunday', '10:00:00', '22:00:00'),

-- trainer 1 work schedule
('Monday', '12:00:00', '18:00:00'),
('Tuesday', '09:00:00', '15:00:00'),
('Friday', '19:00:00', '23:00:00'),

-- trainer 2 work schedule
('Monday', '09:00:00', '20:00:00'),
('Tuesday', '11:30:00', '15:30:00'),
('Wednesday', '19:00:00', '22:30:00'),
('Thursday', '10:00:00', '15:00:00'),
('Friday', '17:00:00', '23:00:00'),

-- trainer 3 work schedule
('Saturday', '10:00:00', '22:00:00'),
('Sunday', '10:00:00', '22:00:00'),

-- masseur 1 work schedule
('Monday', '08:30:00', '21:00:00'),
('Tuesday', '8:30:00', '21:00:00'),
('Wednesday', '09:00:00', '21:30:00'),
('Thursday', '09:00:00', '21:00:00'),
('Friday', '09:00:00', '22:00:00'),

-- masseur 2 work schedule
('Monday', '09:00:00', '13:00:00'),
('Tuesday', '11:30:00', '13:30:00'),
('Wednesday', '14:00:00', '19:30:00'),
('Thursday', '10:00:00', '15:00:00'),
('Friday', '17:00:00', '19:00:00'),

-- masseur 3 work schedule
('Saturday', '10:00:00', '15:00:00'),
('Sunday', '14:00:00', '17:00:00'),

-- sauna 1 work schedule
('Monday', '08:30:00', '20:00:00'),
('Tuesday', '8:30:00', '20:00:00'),
('Wednesday', '09:00:00', '20:30:00'),
('Thursday', '09:00:00', '20:00:00'),
('Friday', '09:00:00', '21:00:00'),

-- sauna 2 work schedule
('Monday', '09:00:00', '12:00:00'),
('Tuesday', '09:30:00', '12:30:00'),
('Wednesday', '11:00:00', '13:00:00'),
('Thursday', '10:00:00', '15:00:00'),
('Friday', '10:00:00', '13:00:00'),

-- sauna 3 work schedule
('Saturday', '13:30:00', '15:45:00'),
('Sunday', '09:15:00', '12:45:00'),

-- general training 1 work schedule
('Monday', '10:00:00', '12:00:00'),
('Tuesday', '11:30:00', '13:00:00'),
('Wednesday', '19:00:00', '21:30:00'),
('Thursday', '10:00:00', '14:25:00'),
('Friday', '13:15:00', '13:45:00'),

-- general training 2 work schedule
('Wednesday', '19:00:00', '21:30:00'),
('Thursday', '10:00:00', '14:25:00'),
('Friday', '13:15:00', '13:45:00'),
('Sunday', '09:15:00', '12:45:00');

INSERT INTO trainer_area_of_work VALUES
(1, 'back'),
(2, 'yoga'),
(3, 'judo'),
(4, 'thai boxing'),
(5, 'muscle stretching');

INSERT INTO trainer_membership (one_l, three_l, one_week, one_month, three_month) VALUES
(100.00, 250.00, 1200.00, 5000.00, 20000.00),
(150.00, 450.00, 1300.00, 3500.00, 13000.00),
(null, null, null, null, null);

INSERT INTO trainer (id, name, surname, trainer_area_of_work_id, phone, trainer_membership_id) VALUES
(1, 'Vitalii', 'Pashynskyi', 2, '380638743292', 3),
(2, 'Pavlo', 'Tkachuk', 4, '380678241228', 1),
(3, 'Victoria', 'Pavelchak', 5, '380637681290', 2);

INSERT INTO trainer_schedule (trainer_id, work_schedule_id) VALUES

-- trainer 1
(1, 8),
(1, 9),
(1, 10),

-- trainer 2
(2, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),

-- trainer 3
(3, 16),
(3, 17);

INSERT INTO personal_exercise_machine (id, client_weight, client_height, client_shoulder_width, client_leg_length,
                                       client_amount_of_fat_in_body, client_muscle_mass, client_state_of_health) VALUES
(1, 60, 170, null, null, 30, 70, 'good'),
(2, 70, null, 100, 120, null, null, 'bad'),
(3, null, null, 80, null, 25, null, 'sick');

INSERT INTO type_of_muscle_load_on (id, type_of_load_on) VALUES
(1, 'all'),
(2, 'one type'),
(3, 'complex');

INSERT INTO exercise (id, number_of_repetitions, approach, complexity, type_of_muscle_load_on_id,
                      personal_exercise_machine_id)  VALUES
(1, 16, 5, null, 3, 1),
(2, 10, 4, 10, 1, 3),
(3, 25, 2, 100, 2, 2);

INSERT INTO personal_training (trainer_id, exercise_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(2, 3);

INSERT INTO masseur_price_list (id, one_t, three_t, seven_plus_three_t, one_month) VALUES
(1, 100.00, 300.00, 1000.00, 2500.00),
(2, 50.00, 250.00, 800.00, 2000.00),
(3, 200.00, 550.00, 1300.00, 3500.00);

INSERT INTO masseur (id, name, surname, phone, masseur_price_list_id) VALUES
(1, 'Vitaliy', 'Nikolipis', '380584587321', 3),
(2, 'Oleg', 'Gymin', '380932134754', 2),
(3, 'Bill', 'Gates', '380978998232', 1);

INSERT INTO masseur_schedule (masseur_id, work_schedule_id) VALUES
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),

(2, 23),
(2, 24),
(2, 25),
(2, 26),
(2, 27),

(3, 28),
(3, 29);


INSERT INTO sauna_price_list (three_time, one_week, one_month) VALUES
(150, 450, 1500),
(200, 500, 2000),
(400, 900, 2500);

INSERT INTO sauna (type, sauna_price_list_id) VALUES
('Dry sauna', 1),
('Traditional', 2),
('Turkish bath', 3);

INSERT INTO sauna_schedule (sauna_id, work_schedule_id) VALUES
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),

(2, 35),
(2, 36),
(2, 37),
(2, 38),
(2, 39),

(3, 40),
(3, 41);

INSERT INTO free_general_training_program (id, day, exercise) VALUES
(1, 'Monday', 'tango'),
(2, 'Tuesday', 'cycle'),
(3, 'Wednesday', 'basic yoga'),
(4, 'Thursday', 'pilates matwork'),
(5, 'Friday', 'basic step'),

(6, 'Wednesday', 'power cycle'),
(7, 'Thursday', 'aqua medium'),
(8, 'Friday', 'nothing'),
(9, 'Sunday', 'aqua freestyle');

INSERT INTO general_training (trainer_id, free_general_training_program_id) VALUES
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),

(2, 6),
(2, 7),
(2, 8),
(2, 9);

INSERT INTO general_training_schedule (general_training_id, work_schedule_id) VALUES
(1, 42),
(2, 43),
(3, 44),
(4, 45),
(5, 46),

(6, 47),
(7, 48),
(8, 49),
(9, 50);

INSERT INTO service (personal_training_id, general_training_id, massage_id, sauna_id) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

INSERT INTO city (name) VALUES
('Lviv'),
('Lutsk'),
('Odessa'),
('Kovel'),
('Rivne'),
('Kharkiv'),
('Sambir');

INSERT INTO gym (phone, street_address, service_id, city_id) VALUES
(380932793092, 'Kravchuk 22', 1, 2),
(380674398042, 'Stepana Bandera 1', 2, 1),
(380674880844, 'Internationalist soldiers 12', 3, 4);