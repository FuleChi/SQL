SELECT  *
FROM    Purchasing.PurchaseOrderHeader
/*
This is a comment
*/
SELECT vendorId, Orderdate
FROM Purchasing.PurchaseOrderHeader

SELECT *
FROM    Purchasing.PurchaseOrderHeader
WHERE status = 4
ORDER BY OrderDate DESC