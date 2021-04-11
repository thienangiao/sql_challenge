/* Query 1 - List the following details of each employee: employee number, last name, first name, sex, and salary */

select e.emp_no as "Employee Number"
, e.last_name as "Last Name"
, e.first_name as "First Name"
, e.sex as Sex
, s.salary as Salary
from "Employees" e
inner join "Salaries" s
	on e.emp_no = s.emp_no
order by "Employee Number"
;

/* Query 2 - List first name, last name, and hire date for employees who were hired in 1986 */

select e.first_name as "First Name"
, e.last_name as "Last Name"
, e.hire_date as "Hire Date"
from "Employees" e
inner join "Salaries" s
	on e.emp_no = s.emp_no
where date_part('year',e.hire_date)='1986'
order by "Hire Date","Last Name"
;

/*Query 3 - List the manager of each department with the following information:
			department number, department name, the manager's employee number, last name, first name*/
			
select dm.dept_no as "Department Number"
, d.dept_name as "Department Name"
, dm.emp_no as "Manager Employe Number"
, e.last_name as "Manager Last Name"
, e.first_name as "Manager First Name"
from "Dept_Manager" dm
inner join "Dept_Emp" de
	on dm.dept_no = de.dept_no
	and dm.emp_no=de.emp_no
inner join "Employees" e
	on de.emp_no=e.emp_no	
inner join "Departments" d
	on de.dept_no=d.dept_no
order by "Department Number","Manager Employe Number"
;		

/* Query 4 - List the department of each employee with the following information: 
			employee number, last name, first name, and department name */

select e.emp_no as "Employee Number"
, e.last_name as "Last Name"
, e.first_name as "First Name"
, d.dept_name as "Department Name"
from "Employees" e
inner join "Dept_Emp" de
	on e.emp_no = de.emp_no
inner join "Departments" d
	on de.dept_no=d.dept_no
order by "Employee Number"
;

/* Query 5 - List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." */

select e.first_name as "First Name"
, e.last_name as "Last Name"
, e.sex as Sex
from "Employees" e
where e.first_name = 'Hercules' and e.last_name like 'B%'
order by "First Name","Last Name"
;

/* Query 6 - List all employees in the Sales department, 
			including their employee number, last name, first name, and department name */

select e.emp_no as "Employee Number"
, e.last_name as "Last Name"
, e.first_name as "First Name"
, d.dept_name as "Department Name"
from "Employees" e
inner join "Dept_Emp" de
	on e.emp_no = de.emp_no
inner join "Departments" d
	on de.dept_no=d.dept_no
where d.dept_name = 'Sales'
order by "Employee Number"
;

/* Query 7 - List all employees in the Sales and Development departments, 
			including their employee number, last name, first name, and department name*/

select e.emp_no as "Employee Number"
, e.last_name as "Last Name"
, e.first_name as "First Name"
, d.dept_name as "Department Name"
from "Employees" e
inner join "Dept_Emp" de
	on e.emp_no = de.emp_no
inner join "Departments" d
	on de.dept_no=d.dept_no
where d.dept_name in ('Sales','Development')
order by "Employee Number"
;

/* Query 8 - In descending order, list the frequency count of employee last names, i.e., how many employees share each last name */

select e.last_name as "Last Name"
,count(e.emp_no) as "No. of Employees"
from "Employees" e
group by e.last_name
order by "No. of Employees" desc
;

-----------------------------------------
/*View for Bonus sections*/

create view vw_employees as

select e.emp_no as "Employee Number"
, e.last_name as "Last Name"
, e.first_name as "First Name"
, e.sex as Sex
, s.salary as Salary
, ti.title as Title
from "Employees" e
inner join "Salaries" s
	on e.emp_no = s.emp_no
inner join "Titles" ti
	on e.emp_title_id = ti.title_id
;
