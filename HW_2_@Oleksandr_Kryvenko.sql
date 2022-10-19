/*1)	Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null*/
create table employees(
	id serial primary key,
	employee_name varchar(50) not null
);

select * from employees
order by employee_name; 

/*2)	Наполнить таблицу employee 70 строками.*/
insert into employees(employee_name)
	values ('Aisha Begley'), ('Alma Sebastian'), ('Ben Ochoa'), ('Cian Loper'), ('Diego Truitt'), ('Emily Mcculley'), ('Gracie Crum'), ('Hector Gervais'), ('Jayce Suiter'), ('Juniper Piercy'), ('Keagan Million'), ('Khloe Machado'), ('Lincoln Cobbs'), ('Makayla Bender'), ('Maya Mudd'), ('Micheal Peavy'), ('Miranda Cantor'), ('Olivia Mcguire'), ('Sammy Mcnamara'), ('Soren Anton'), ('Tatum Schnell'), ('Zion Matney'), ('Anne Gifford'), ('Asa Worthy'), ('Ashley Bolling'), ('Briella Newlin'), ('Chace Luevano'), ('Chiara Friel'), ('Dean Witter'), ('Dhruv Kyle'), ('Diana Coon'), ('Eva Jones'), ('Gabriel Yager'), ('Jaime Oberg'), ('Kaiya Cornejo'), ('Khadija Harr'), ('Leia Talley'), ('Lyla Sherrill'), ('Macey Rudy'), ('Madilynn Knox'), ('Marissa Chism'), ('Niko Beery'), ('Nolan Gil'), ('Reuben Carmona'), ('Saif Mix'), ('Sloane Yount'), ('Thiago Rock'), ('Vivaan Bayne'), ('Breanna Waldon'), ('Byron Bisson'), ('Byron Hand'), ('Chad Garnett'), ('Christina Coon'), ('Cullen Louis'), ('Dakota Hash'), ('Devin Dooley'), ('Elise Sweat'), ('Emerson Gower'), ('Grace Haire'), ('Isaac Suzuki'), ('Isis Haro'), ('Jackson Luckey'), ('James Honea'), ('Kali Marriott'), ('Kara Race'), ('Karlee Moffitt'), ('Kenneth Mackay'), ('Leo Converse'), ('Liam Titus'), ('Luca Chavis');

/*3)	Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
*/
create table salary(
	id serial primary key,
	monthly_salary int not null
)

select * from salary;
/*4)	Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500
*/
insert into salary(monthly_salary)
	values (1000), (1100), (1200), (1300), (1400), (1500), (1600), (1700), (1800), (1900), (2000), (2100), (2200), (2300), (2400), (2500);

/*5)	Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
*/

create table employee_salary(
	id serial primary key,
	employee_id int not null,
	salary_id int not null
);

/*6)	Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id

id	employee_id	salary_id
1	3	7
2	1	4
3	5	9
4	40	13
5	23	4
6	11	2
7	52	10
8	15	13
9	26	4
10	16	1
11	33	7
...	...	...
*/
insert into employee_salary(employee_id, salary_id)
	values (3, 7), (1, 4), (5, 9), (40, 13), (23, 4), 
			(11, 2), (52, 10), (15, 13), (26, 4), (16, 1), 
			(33, 7), (2, 11), (6, 15), (7, 10), (8, 12), 
			(9, 7), (10, 13), (12, 7), (13, 5), (14, 4), 
			(17, 5), (18, 9), (19, 10), (20, 3), (21, 1), 
			(22, 6), (24, 4), (25, 7), (27, 8), (28, 8), 
			(81, 2), (80, 1), (79, 5), (78, 10), (77, 15), 
			(76, 12), (75, 11), (73, 15), (72, 10), (71, 5);

select * from employee_salary;

/*7)	Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
*/

create table roles(
	id serial primary key,
	role_name int not null unique
);

select * from roles;
/*8)	Поменять тип столба role_name с int на varchar(30)*/

alter table roles 
alter column role_name type varchar(30);

/*9)	Наполнить таблицу roles 20 строками:

id	role_name
1	Junior Python developer
2	Middle Python developer
3	Senior Python developer
4	Junior Java developer
5	Middle Java developer
6	Senior Java developer
7	Junior JavaScript developer
8	Middle JavaScript developer
9	Senior JavaScript developer
10	Junior Manual QA engineer
11	Middle Manual QA engineer
12	Senior Manual QA engineer
13	Project Manager
14	Designer
15	HR
16	CEO
17	Sales manager
18	Junior Automation QA engineer
19	Middle Automation QA engineer
20	Senior Automation QA engineer

 */

insert into roles(role_name)
	values ('Junior Python developer'), 
			('Middle Python developer'), 
			('Senior Python developer'), 
			('Junior Java developer'), 
			('Middle Java developer'), 
			('Senior Java developer'), 
			('Junior JavaScript developer'), 
			('Middle JavaScript developer'), 
			('Senior JavaScript developer'), 
			('Junior Manual QA engineer'), 
			('Middle Manual QA engineer'), 
			('Senior Manual QA engineer'), 
			('Project Manager'), 
			('Designer'), 
			('HR'), 
			('CEO'), 
			('Sales manager'), 
			('Junior Automation QA engineer'), 
			('Middle Automation QA engineer'), 
			('Senior Automation QA engineer');

select * from roles;
/*10)	Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
*/

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	role_id int not null,
	foreign key(employee_id)
		references employees(id),
	foreign key(role_id)
		references roles(id)
);

/*11)	Наполнить таблицу roles_employee 40 строками:
 
id	employee_id	role_id
1	7	2
2	20	4
3	3	9
4	5	13
5	23	4
6	11	2
7	10	9
8	22	13
9	21	3
10	34	4
11	6	7
...	...	...
*/

insert into roles_employee(employee_id, role_id)
	values (7, 2),   (20, 4),  (3, 9),   (5, 13),  (23, 4),  
		   (11, 2),  (10, 9),  (22, 13), (21, 3),  (34, 4), 
		   (6, 7),   (1, 20),  (2, 11),  (4, 10),  (8, 14), 
		   (9, 7),   (12, 18), (13, 20), (14, 5),  (16, 17), 
		   (17, 9),  (18, 13), (19, 11), (24, 4),  (25, 11), 
		   (26, 14), (27, 3),  (28, 16), (29, 10), (30, 1), 
		   (31, 12), (32, 5),  (33, 16), (35, 13), (36, 10), 
		   (37, 11), (38, 2),  (39, 2),  (40, 19), (15, 7);

select * from roles_employee;