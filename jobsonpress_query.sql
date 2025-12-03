SELECT 
    J.JobID,
    C.Name AS CustomerName,
    ST.Name AS StatusName,
    I.ItemID,
    P.Name AS PressName,
    J.JobDate,
    J.DueDate
FROM JOB J
JOIN CUSTOMER C ON J.CustomerID = C.CustomerID
JOIN STATUS ST ON J.StatusID = ST.StatusID
JOIN ITEM I ON I.JobID = J.JobID
JOIN PRESS P ON I.PressID = P.PressID
WHERE P.Name = "Xerox"