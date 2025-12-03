-- Seed database with starter data

-- SALESPERSON (employees)

INSERT INTO SALESPERSON (Name, Email) VALUES
('Kyle Breen-Bondie', 'kyle@kylebb.com'),
('Sebastian Stanley', 'sebastian@domain.com'),
('Luca Scott', 'lucascott@yes.com');

-- STATUS

INSERT INTO STATUS (Name, Description) VALUES
('Accepted', 'Job has been created but not started'),
('In Progress', 'Currently being printed'),
('Ready to Ship', 'Finished and ready'),
('Completed', 'Customer has received the order'),
('Closed', 'Order is finished and invoice complete');

-- PRINT ITEM TYPES

INSERT INTO PRINT_ITEM_TYPE (Name) VALUES
('Postcard'),
('Envelope'),
('Flyer'),
('Brochure'),
('Booklet'),
('Business Card'),
('Poster'),
('Banner');

-- STOCK TYPES (paper category)

INSERT INTO PAPER_TYPE (Name, Description) VALUES
('Sheet', 'Cut sheet paper'),
('Roll', 'Large-format roll stock'),
('Rigid', 'Rigid board material');


-- PAPER (with stock type IDs)

INSERT INTO PAPER (Weight, Brand, StockTypeID, Color, Finish) VALUES
('100# Text', 'Mohawk', 1, 'White', 'Matte'),
('14pt', 'Hammermill', 1, 'White', 'Gloss'),
('Vinyl', '3M', 2, 'White', 'Opaque'),
('PVC Board', 'Ultraflex', 3, 'White', 'None');

-- PRESS

INSERT INTO PRESS (
    Name, MaxSheetSizeWidth, MaxSheetSizeHeight, MaxStockWeight,
    MaxSpeed, ColorBW, InlineOps
) VALUES
('Xerox', 13, 47, 400, 120, 'bw', 'Coating'),
('HP', 13, 19, 350, 160, 'color', 'None'),
('Heidelberg', 28, 40, 600, 300, 'color', 'Aqueous Coater'),
('RICOH', 28, 40, 600, 300, 'color', 'Folding'),
('Roland', 64, 999, 200, 80, 'color', 'Cutting');

-- FINISHING OPTIONS

INSERT INTO FINISHING_OPTION (OptionName) VALUES
('Gloss Coating'),
('Matte Lamination'),
('Saddle Stitching'),
('Grommets'),
('Scoring'),
('Folding');

-- CUSTOMER (assigning salespeople)

INSERT INTO CUSTOMER (Name, Address, Email, Phone, SalespersonID) VALUES
('Acme Corp', '123 Industrial Way', 'print@acme.com', '555-1111', 1),
('Kyle BB Enterprise', '52 Rain Road', 'info@kylebb.com', '555-2222', 2),
('Detroit Red Wings', '77 Market St', 'hello@detroiredwings.com', '555-3333', 3);

-- JOB (sample job for Acme Corp)

INSERT INTO JOB (CustomerID, SalespersonID, StatusID, JobDate, DueDate) VALUES
(1, 1, 1, '2025-12-2', '2025-12-15');  -- Pending Job

-- ITEM (sample item inside that job)

INSERT INTO ITEM (
    JobID, PrintTypeID, PressID, PaperID, Width, Height,
    Quantity, PageCount, SimplexDuplex, ColorBW
) VALUES
(1, 2, 2, 2, 8.5, 11, 1000, 2, 'duplex', 'color'); 
-- 1000 Flyers on HP

-- ITEM_FINISHING (add finishing to that item)

INSERT INTO ITEM_FINISHING (ItemID, OptionID) VALUES
(1, 1),   -- Gloss Coating
(1, 6);   -- Folding

-- INVOICE (for that job)

INSERT INTO INVOICE (JobID, InvoiceDate, Amount, PaidStatus) VALUES
(1, '2025-02-02', 450.00, 'unpaid');