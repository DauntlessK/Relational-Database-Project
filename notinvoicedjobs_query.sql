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
LEFT JOIN INVOICE I ON I.JobID = J.JobID
WHERE I.JobID IS NULL
  AND (
        ST.Name = 'Completed'
        OR (J.DueDate < CURDATE() AND ST.Name NOT IN ('Completed', 'Delivered'))
      )
ORDER BY J.DueDate ASC;