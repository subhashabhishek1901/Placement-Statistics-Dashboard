CREATE DATABASE Placement;
use Placement;
SELECT * FROM placement.students;


SELECT COUNT(*) AS total_students FROM placement.students;


SELECT Placement_Status, COUNT(*) 
FROM placement.students
GROUP BY Placement_Status;


SELECT 
ROUND(
   (SUM(CASE WHEN Placement_Status='Placed' THEN 1 ELSE 0 END) * 100.0) 
   / COUNT(*), 2
) AS placement_rate
FROM placement.students;


SELECT Gender, Placement_Status, COUNT(*)
FROM placement.students
GROUP BY Gender, Placement_Status;


SELECT AVG(Salary_LPA) AS avg_Package
FROM placement.students
WHERE Placement_Status = 'Placed';


SELECT MAX(Salary_LPA) AS highest_package FROM placement.students;


SELECT Company_Type, AVG(Salary_LPA) 
FROM placement.students
WHERE Placement_Status='Placed'
GROUP BY Company_Type;

SELECT 
    CASE 
        WHEN CGPA >= 8 THEN 'High'
        WHEN CGPA >= 6 THEN 'Medium'
        ELSE 'Low'
    END AS CGPA_Category,
    COUNT(*) AS total,
    SUM(CASE WHEN Placement_Status='Placed' THEN 1 ELSE 0 END) AS placed
FROM placement.students
GROUP BY CGPA_Category;


SELECT Internship, COUNT(*) AS total,
SUM(CASE WHEN Placement_Status='Placed' THEN 1 ELSE 0 END) AS placed
FROM placement.students
GROUP BY Internship;


SELECT Projects,
COUNT(*) AS total_students,
SUM(CASE WHEN Placement_Status='Placed' THEN 1 ELSE 0 END) AS placed_students
FROM placement.students
GROUP BY Projects
ORDER BY Projects;


SELECT Student_Name, CGPA, Salary_LPA
FROM placement.students
WHERE Placement_Status='Placed'
ORDER BY Salary_LPA DESC
LIMIT 10;


SELECT Stream,
COUNT(*) AS total,
SUM(CASE WHEN Placement_Status='Placed' THEN 1 ELSE 0 END) AS placed
FROM placement.students
GROUP BY Stream;


-- Total Students
SELECT COUNT(*) FROM placement.students;


-- Placed Students
SELECT COUNT(*) FROM placement.students WHERE Placement_Status='Placed';


-- Avg Salary
SELECT AVG(Salary_LPA) FROM placement.students WHERE Placement_Status='Placed';


-- Company Type Distribution
SELECT Company_Type, COUNT(*) 
FROM placement.students 
GROUP BY Company_Type;


-- Degree Distribution
SELECT Degree, COUNT(*) 
FROM placement.students  
GROUP BY Degree;


SELECT ROUND(AVG(Salary_LPA), 2) AS median_salary
FROM (
    SELECT 
        Salary_LPA,
        ROW_NUMBER() OVER (ORDER BY Salary_LPA) AS row_num,
        COUNT(*) OVER () AS total_rows
    FROM placement.students
    WHERE Placement_Status = 'Placed'
) AS t
WHERE row_num IN (
	FLOOR((total_rows + 1) / 2),
    FLOOR((total_rows + 2) / 2)
);


SELECT Salary_LPA, COUNT(*) AS frequency
FROM placement.students
GROUP BY Salary_LPA
ORDER BY frequency DESC
LIMIT 4;


SELECT STDDEV(CGPA) AS stddev_cgpa
FROM placement.students;


SELECT VARIANCE(Salary_LPA) AS variance_salary
FROM placement.students
WHERE Placement_Status='Placed';


SELECT 
MAX(Salary_LPA) - MIN(Salary_LPA) AS salary_range
FROM placement.students
WHERE Placement_Status='Placed';


SELECT 
CASE 
    WHEN CGPA >= 8 THEN 'High'
    WHEN CGPA >= 6 THEN 'Medium'
    ELSE 'Low'
END AS CGPA_Category,
COUNT(*) AS count_students
FROM placement.students
GROUP BY CGPA_Category;


SELECT 
CASE 
    WHEN Salary_LPA >= 10 THEN 'High Salary'
    WHEN Salary_LPA >= 5 THEN 'Medium Salary'
    ELSE 'Low Salary'
END AS Salary_Category,
COUNT(*) AS count_students
FROM placement.students
WHERE Placement_Status='Placed'
GROUP BY Salary_Category;


SELECT 
ROUND(
SUM(CASE WHEN Placement_Status='Placed' THEN 1 ELSE 0 END) / COUNT(*), 2
) AS placement_probability
FROM placement.students;


SELECT 
Internship,
SUM(CASE WHEN Placement_Status='Placed' THEN 1 ELSE 0 END) / COUNT(*) AS probability
FROM placement.students
GROUP BY Internship;