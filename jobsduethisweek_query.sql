SELECT
    J.JobID,
    C.Name AS CustomerName,
    S.Name AS SalespersonName,
    ST.Name AS StatusName,
    J.JobDate,
    J.DueDate
FROM JOB J
JOIN CUSTOMER C ON J.CustomerID = C.CustomerID
JOIN SALESPERSON S ON J.SalespersonID = S.SalespersonID
JOIN STATUS ST ON J.StatusID = ST.StatusID
WHERE J.DueDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
ORDER BY J.DueDate ASC;