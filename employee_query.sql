
--Create tables to upload data from csv files given 
create table titles (
	title_id varchar primary key, 
	title varchar not null 
);

select * from titles;

create table departments (
	dept_no varchar primary key, 
	dept_name varchar not null
);

select * from departments;


create table employees ( 
	emp_no  int primary key,
	emp_title_id  varchar not null, 
	birth_date varchar not null, 
	first_name varchar not null, 
	last_name varchar not null, 
	sex varchar not null, 
	hire_date varchar not null, 
	foreign key (emp_title_id) references titles(title_id)
);

select * from employees;


create table salaries (
	emp_no int primary key, 
	salary int not null,
	foreign key (emp_no) references employees(emp_no)
);

select * from salaries;


create table dept_emp (
	emp_no int not null, 
	dept_no varchar not null, 
	foreign key (emp_no) references employees(emp_no),
	foreign key (dept_no) references departments(dept_no)
);

select * from dept_emp; 

create table dept_manager (
    dept_no varchar not null,
	emp_no int not null,
	foreign key (dept_no) references departments(dept_no),
	foreign key (emp_no) references employees(emp_no)
);

select * from dept_manager;

1--List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from salaries as s
join employees as e
on e.emp_no =s.emp_no;


2--List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
 from employees 
 where hire_date  like '%1986';
 
3--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name. 
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager
join departments on dept_manager.dept_no = departments.dept_no
join employees on dept_manager.emp_no = employees.emp_no;


4--List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from departments as d
join dept_emp as de
on d.dept_no = de.dept_no
join employees as e 
on de.emp_no = e.emp_no;


5--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
and last_name like 'B%';

6--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp on e.emp_no = dept_emp.emp_no
join departments as don dept_emp.dept_no = d.dept_no;

7--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp on e.emp_no = dept_emp.emp_no
join departments as d on dept_emp.dept_no = d.dept_no
where d.dept_no ='d007' or d.dept_name ='d005';

8--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

select e.last_name, count(last_name) as "frequency_count"
from employees as e
group by last_name
order by "frequency_count" desc;


