SET SERVEROUTPUT ON;

CREATE OR REPLACE FUNCTION GET_AVG_SAL (P_DEPT_ID DEPARTMENTS.DEPARTMENT_ID%TYPE) RETURN NUMBER AS
    V_AVG_SAL NUMBER;
BEGIN
    SELECT
        AVG(SALARY)
    INTO V_AVG_SAL
    FROM
        EMPLOYEES
    WHERE
        DEPARTMENT_ID = P_DEPT_ID;

    RETURN V_AVG_SAL;
END GET_AVG_SAL;
/

----------------- using a function in begin-end block
DECLARE
    V_AVG_SALARY NUMBER;
BEGIN
    V_AVG_SALARY := GET_AVG_SAL(50);
    DBMS_OUTPUT.PUT_LINE(V_AVG_SALARY);
END;
/

----------------- using functions in a select clause
SELECT
    EMPLOYEE_ID,
    FIRST_NAME,
    SALARY,
    DEPARTMENT_ID,
    GET_AVG_SAL(DEPARTMENT_ID) AVG_SAL
FROM
    EMPLOYEES;
    /
    
----------------- using functions in group by, order by, where clauses 
SELECT
    GET_AVG_SAL(DEPARTMENT_ID)
FROM
    EMPLOYEES
WHERE
    SALARY > GET_AVG_SAL(DEPARTMENT_ID)
GROUP BY
    GET_AVG_SAL(DEPARTMENT_ID)
ORDER BY
    GET_AVG_SAL(DEPARTMENT_ID);
/

----------------- dropping a function
DROP FUNCTION GET_AVG_SAL;