SELECT
    J.JobID,
    C.Name AS CustomerName,
    ST.Name AS StatusName,
    J.JobDate,
    J.DueDate
FROM JOB J
JOIN CUSTOMER C ON J.CustomerID = C.CustomerID
JOIN STATUS ST ON J.StatusID = ST.StatusID
WHERE J.SalespersonID = 1;