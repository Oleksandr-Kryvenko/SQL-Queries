select * from employees;
select * from employee_salary;
select * from salary;
select * from roles;
select * from roles_employee;

/*1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.*/

select em.employee_name, s.monthly_salary
	from employees em
join employee_salary es
	on em.id = es.employee_id
join salary s
	on s.id = es.salary_id;

/*2. Вывести всех работников у которых ЗП меньше 2000.*/

select em.employee_name, s.monthly_salary
	from employees em
join employee_salary es
	on em.id = es.employee_id
join salary s
	on s.id = es.salary_id
		where monthly_salary < 2000;

/*3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/

select s.monthly_salary
	from salary s
full join employee_salary es
	on es.salary_id = s.id
		where es.salary_id is null;

/*4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)*/

select s.monthly_salary
	from salary s
full join employee_salary es
	on (es.salary_id = s.id)
		where es.salary_id is null 
		and es.salary_id < 2000;	
	
/*5. Найти всех работников кому не начислена ЗП.*/

select em.employee_name, s.monthly_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
full join salary s
	on s.id = es.salary_id
		where monthly_salary is null;	
	
/*6. Вывести всех работников с названиями их должности.*/

select em.employee_name, r.role_name 
	from employees em
full join roles_employee re
	on re.employee_id = em.id
left join roles r
	on re.role_id = r.id;

/*7. Вывести имена и должность только Java разработчиков.*/

select em.employee_name, r.role_name 
	from employees em
full join roles_employee re
	on re.employee_id = em.id
left join roles r
	on re.role_id = r.id
		where role_name like '%Java developer';

/*8. Вывести имена и должность только Python разработчиков.*/

select em.employee_name, r.role_name 
	from employees em
full join roles_employee re
	on re.employee_id = em.id
left join roles r
	on re.role_id = r.id
		where role_name like '%Python%';

/*9. Вывести имена и должность всех QA инженеров.*/

select em.employee_name, r.role_name 
	from employees
full join roles_employee
	on roles_employee.employee_id = employees.id
left join roles
	on roles_employee.role_id = roles.id
		where role_name like '%QA%';

/*10. Вывести имена и должность ручных QA инженеров.*/

select em.employee_name, r.role_name 
	from employees em 
full join roles_employee re
	on re.employee_id = em.id
left join roles r
	on re.role_id = r.id
		where role_name like '%Manual QA%';

/*11. Вывести имена и должность автоматизаторов QA.*/

select em.employee_name, r.role_name 
	from employees em
full join roles_employee re
	on re.employee_id = em.id
left join roles r
	on re.role_id = r.id
		where role_name like '%Automation QA%';

/*12. Вывести имена и зарплаты Junior специалистов.*/

select em.employee_name, /*r.role_name,*/ s.monthly_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
full join salary s
	on s.id = es.salary_id		
full join roles_employee re
	on re.employee_id = em.id	
join roles r
	on r.id = re.role_id
		where r.role_name like '%Junior%';			
	
/*13. Вывести имена и зарплаты Middle специалистов.*/

select em.employee_name, /*r.role_name,*/ s.monthly_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
full join salary s
	on s.id = es.salary_id		
full join roles_employee re
	on re.employee_id = em.id	
join roles r
	on r.id = re.role_id
		where r.role_name like '%Middle%';	
	
/*14. Вывести имена и зарплаты Senior специалистов.*/

select em.employee_name, /*r.role_name,*/ s.monthly_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
join salary s
	on s.id = es.salary_id		
join roles_employee re
	on re.employee_id = em.id	
join roles r
	on r.id = re.role_id
		where r.role_name like '%Senior%';	
	
/*15. Вывести зарплаты Java разработчиков.*/

select /*em.employee_name, r.role_name,*/ s.monthly_salary as Java_dev_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
join salary s
	on s.id = es.salary_id		
join roles_employee re
	on re.employee_id = em.id	
left join roles r
	on re.role_id = r.id
		where role_name like '%Java%';		
	
/*16. Вывести зарплаты Python разработчиков.*/

select /*em.employee_name, r.role_name,*/ s.monthly_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
join salary s
	on s.id = es.salary_id		
join roles_employee re
	on re.employee_id = em.id	
left join roles r
	on re.role_id = r.id
		where role_name like '%Python%';	
	
/*17. Вывести имена и зарплаты Junior Python разработчиков.*/

select em.employee_name, /*r.role_name,*/ s.monthly_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
full join salary s
	on s.id = es.salary_id		
join roles_employee re
	on re.employee_id = em.id	
left join roles r
	on re.role_id = r.id
		where role_name like 'Junior Python%';	
	
/*18. Вывести имена и зарплаты Middle JS разработчиков.*/

select em.employee_name, r.role_name, s.monthly_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
full join salary s
	on s.id = es.salary_id		
full join roles_employee re
	on re.employee_id = em.id	
full join roles r
	on re.role_id = r.id
		where role_name like 'Middle JavaScript%';		
	
/*19. Вывести имена и зарплаты Senior Java разработчиков.*/

select em.employee_name, r.role_name, s.monthly_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
full join salary s
	on s.id = es.salary_id		
full join roles_employee re
	on re.employee_id = em.id	
full join roles r
	on re.role_id = r.id
		where role_name like 'Senior Java developer';	
	
/*20. Вывести зарплаты Junior QA инженеров.*/

select /*em.employee_name, r.role_name,*/ s.monthly_salary as junior_qa_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
join salary s
	on s.id = es.salary_id		
join roles_employee re
	on re.employee_id = em.id	
join roles r
	on re.role_id = r.id
		where role_name like 'Junior%QA%';	
	
/*21. Вывести среднюю зарплату всех Junior специалистов.*/
	
select avg(s.monthly_salary) as avg_junior_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
join salary s
	on s.id = es.salary_id		
join roles_employee re
	on re.employee_id = em.id	
join roles r
	on r.id = re.role_id
		where r.role_name like '%Junior%';
	
/*22. Вывести сумму зарплат JS разработчиков.*/
	
select sum(s.monthly_salary) as sum_JS_dev_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
join salary s
	on s.id = es.salary_id		
join roles_employee re
	on re.employee_id = em.id	
join roles r
	on r.id = re.role_id
		where r.role_name like '%JavaScript%';

/*23. Вывести минимальную ЗП QA инженеров.*/
	
select min(s.monthly_salary) as min_QA_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
full join salary s
	on s.id = es.salary_id		
full join roles_employee re
	on re.employee_id = em.id	
full join roles r
	on re.role_id = r.id
		where role_name like '%QA%';
	
/*24. Вывести максимальную ЗП QA инженеров.*/
	
select max(s.monthly_salary) as max_QA_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
full join salary s
	on s.id = es.salary_id		
full join roles_employee re
	on re.employee_id = em.id	
full join roles r
	on re.role_id = r.id
		where role_name like '%QA%';

/*25. Вывести количество QA инженеров.*/
	
select count(em.employee_name) as qa_qty 
	from employees em
full join roles_employee re
	on re.employee_id = em.id
left join roles r
	on re.role_id = r.id
		where role_name like '%QA%';	
	
/*26. Вывести количество Middle специалистов.*/
	
select count(em.employee_name) as middel_qty
	from employees em
full join roles_employee re
	on re.employee_id = em.id
left join roles r
	on re.role_id = r.id
		where role_name like '%Middle%';

/*27. Вывести количество разработчиков.*/
	
select count(em.employee_name) as developers_qty
	from employees em
full join roles_employee re
	on re.employee_id = em.id
left join roles r
	on re.role_id = r.id
		where role_name like '%developer%';

/*28. Вывести фонд (сумму) зарплаты разработчиков.*/
	
select sum(s.monthly_salary) as sum_dev_salary
	from employees em
full join employee_salary es
	on em.id = es.employee_id
full join salary s
	on s.id = es.salary_id		
full join roles_employee re
	on re.employee_id = em.id	
full join roles r
	on re.role_id = r.id
		where role_name like '%developer%';
	
/*29. Вывести имена, должности и ЗП всех специалистов по возрастанию.*/
	
select em.employee_name, r.role_name, s.monthly_salary
	from employees em
join employee_salary es
	on em.id = es.employee_id
join salary s
	on s.id = es.salary_id		
join roles_employee re
	on re.employee_id = em.id	
join roles r
	on re.role_id = r.id
order by monthly_salary;

/*30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300.*/

select em.employee_name, r.role_name, s.monthly_salary
	from employees em
join employee_salary es
	on em.id = es.employee_id
join salary s
	on s.id = es.salary_id		
join roles_employee re
	on re.employee_id = em.id	
join roles r
	on re.role_id = r.id
		where monthly_salary between 1700 and 2300
order by monthly_salary;

/*31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300*/

select em.employee_name, r.role_name, s.monthly_salary
	from employees em
join employee_salary es
	on em.id = es.employee_id
join salary s
	on s.id = es.salary_id		
join roles_employee re
	on re.employee_id = em.id	
join roles r
	on re.role_id = r.id
		where monthly_salary < 2300
order by monthly_salary;

/*32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000.*/

select em.employee_name, r.role_name, s.monthly_salary
	from employees em
join employee_salary es
	on em.id = es.employee_id
join salary s
	on s.id = es.salary_id		
join roles_employee re
	on re.employee_id = em.id	
join roles r
	on re.role_id = r.id
		where monthly_salary in (1100, 1500, 2000)
order by monthly_salary;
