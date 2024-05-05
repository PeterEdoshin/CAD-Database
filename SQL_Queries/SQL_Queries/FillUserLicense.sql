USE CAADSoftware;

INSERT INTO UserLicense (product_id, license_element_quantity, license_start_time, license_finish_time, price) 
VALUES 
(1, 5, '2024-01-30', '2025-01-30', 500.00),
(2, 3, '2024-02-15', '2025-02-15', 300.00),
(3, 2, '2024-03-01', '2025-03-01', 200.00),
(4, 1, '2024-04-15', '2025-04-15', 100.00),
(5, 4, '2024-05-01', '2025-05-01', 400.00);

SELECT * FROM UserLicense;
