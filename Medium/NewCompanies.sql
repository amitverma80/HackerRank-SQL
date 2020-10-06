SELECT C.company_code, C.founder, count(distinct(lead_manager_code)), count(distinct(senior_manager_code)), count(distinct(manager_code)),
count(distinct(employee_code))
FROM Company C
INNER JOIN EMPLOYEE E ON (c.company_code = E.company_code)
Group BY C.company_code, C.founder
ORDER BY C.Company_Code;
