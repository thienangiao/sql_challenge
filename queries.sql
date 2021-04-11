select e.*,ti.title,d.dept_name
from "Dept_Emp" de
inner join "Departments" d
on de.dept_no=d.dept_no
inner join "Employees" e
on de.emp_no=e.emp_no
inner join "Titles" ti
on e.emp_title_id=ti.title_id
inner join "Dept_Manager" dm
on e.emp_no=dm.emp_no
;

select *
from "Dept_Manager"
;