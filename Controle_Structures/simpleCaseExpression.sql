SET SERVEROUTPUT ON;
/****************** Simple Case Expression ******************/
DECLARE
  v_job_code        VARCHAR2(10) := 'SA_MAN';
  v_salary_increase NUMBER;
BEGIN
  v_salary_increase :=  CASE v_job_code 
                         WHEN 'SA_MAN' THEN 0.2
                         WHEN 'SA_REP' THEN 0.3
                        ELSE 0
                        END;
  dbms_output.put_line('Your salary increase is : '|| v_salary_increase);
END;