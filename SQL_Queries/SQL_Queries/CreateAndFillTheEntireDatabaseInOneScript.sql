CREATE DATABASE CAADSoftware
ON 
(
    NAME = CAADSoftware,
    FILENAME = '/var/opt/mssql/data/CAADSoftware.mdf',
    SIZE = 10MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 5MB
)
LOG ON 
(
    NAME = CAADSoftwareLogs,
    FILENAME = '/var/opt/mssql/data/CAADSoftware.ldf',
    SIZE = 5MB,
    MAXSIZE = 512MB,
    FILEGROWTH = 1MB
)
COLLATE Cyrillic_General_100_CS_AS;

USE CAADSoftware;

BEGIN;

CREATE TABLE Product(
	product_id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(255)
);

CREATE TABLE Device(
	device_id int IDENTITY(1,1) PRIMARY KEY,
	device_info nvarchar(MAX)
);

CREATE TABLE Employee(
	employee_id int IDENTITY(1,1) PRIMARY KEY,
	first_name nvarchar(255),
	last_name nvarchar(255),
	email nvarchar(255),
	phone_number nvarchar(255)
);

CREATE TABLE UserLicense(
	user_license_id int IDENTITY(1,1) PRIMARY KEY,
	product_id int,
	license_element_quantity int,
	license_start_time datetime,
	license_finish_time datetime,
	price numeric(10,2),
	CONSTRAINT UserLicenseProduct 
	FOREIGN KEY (product_id) REFERENCES Product(product_id)
	ON DELETE NO ACTION
	ON UPDATE CASCADE 
);

CREATE TABLE DeviceLicense(
	device_license_id int IDENTITY(1,1) PRIMARY KEY,
	product_id int,
	license_element_quantity int,
	license_start_time datetime,
	license_finish_time datetime,
	price numeric(10,2),
	CONSTRAINT DeviceLicenseProduct 
	FOREIGN KEY (product_id) REFERENCES Product(product_id)
	ON DELETE NO ACTION
	ON UPDATE CASCADE 
);

CREATE TABLE CompanyLicense(
	company_license_id int IDENTITY(1,1) PRIMARY KEY,
	product_id int,
	device_id int,
	license_start_time datetime,
	license_finish_time datetime,
	price numeric(10,2),
	CONSTRAINT CompanyLicenseProduct 
	FOREIGN KEY (product_id) REFERENCES Product(product_id)
	ON DELETE NO ACTION
	ON UPDATE CASCADE,
	CONSTRAINT LicensedDevice 
	FOREIGN KEY (device_id) REFERENCES Device(device_id)
	ON DELETE NO ACTION
	ON UPDATE CASCADE
);

CREATE TABLE UserLicenseElement(
	user_license_element_id int IDENTITY(1,1) PRIMARY KEY,
	employee_id int,
	user_license_id int,
	CONSTRAINT UserOfTheElement 
	FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT UserLicenseOfTheElement 
	FOREIGN KEY (user_license_id) REFERENCES UserLicense(user_license_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE 
);

CREATE TABLE DeviceLicenseElement(
	device_license_element_id int IDENTITY(1,1) PRIMARY KEY,
	device_id int,
	device_license_id int,
	CONSTRAINT DeviceOfTheElement 
	FOREIGN KEY (device_id) REFERENCES Device(device_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE,
	CONSTRAINT DeviceLicenseOfTheElement 
	FOREIGN KEY (device_license_id) REFERENCES DeviceLicense(device_license_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE 
);

USE CAADSoftware;

INSERT INTO Employee (first_name, last_name, email, phone_number)
VALUES ('Андрей', 'Яковлев', 'yaandrey@yandex.ru', '89216678328'),
	   ('Ольга', 'Алеутова', 'helgaaleutova@mail.ru', '89232345683'),
	   ('Нина', 'Алеутова', 'aleutovanina@mail.ru', '89214353454'),
	   ('Павел', 'Копыльцов', 'copiltzovp@gmail.com', '89214356290'),
	   ('Анастасия', 'Тарышкина', 'tarararanast@yandex.ru', '89212345010'),
	   ('Динь', 'Хуэн', 'dinhuenla23@hotmail.com', '89216678328'),
	   ('Аркадий', 'Лютиков', 'lutikov@outlook.com', '89216678328');

INSERT INTO Device(device_info)
VALUES 
('{
	"device_id": "LPT001",
	"device_type": "laptop",
	"brand": "Lenovo",
	"model": "ThinkPad X1 Carbon",
	"os": "Windows 10 Pro",
	"processor": "Intel Core i7-1185G7",
	"ram": "32GB",
	"storage": "1TB NVMe SSD"
}'),
('{
  "device_id": "IOT001",
  "device_type": "iot_gateway",
  "brand": "Raspberry Pi",
  "model": "Raspberry Pi 4",
  "os": "Raspbian",
  "processor": "Quad-core ARM Cortex-A72",
  "ram": "8GB",
  "storage": "128GB MicroSD"
}'),
('{
  "device_id": "CS001",
  "device_type": "cloud_server",
  "provider": "AWS",
  "instance_type": "t3.large",
  "os": "Amazon Linux 2",
  "vcpu": 2,
  "ram": "8GB",
  "storage": "100GB SSD",
}'),
('{
  "device_id": "IPC001",
  "device_type": "industrial_pc",
  "brand": "Advantech",
  "model": "ARK-1220",
  "os": "Ubuntu 20.04 LTS",
  "processor": "Intel Core i5-8365UE",
  "ram": "16GB",
  "storage": "256GB SSD",
}');

INSERT INTO Product (name) VALUES 
('AutoCAD'),
('SketchUp'),
('Revit'),
('ArchiCAD'),
('Rhinoceros 3D');

INSERT INTO UserLicense (product_id, license_element_quantity, license_start_time, license_finish_time, price) 
VALUES 
(1, 5, '2024-01-30', '2025-01-30', 500.00),
(2, 3, '2024-02-15', '2025-02-15', 300.00),
(3, 2, '2024-03-01', '2025-03-01', 200.00),
(4, 1, '2024-04-15', '2025-04-15', 100.00),
(5, 4, '2024-05-01', '2025-05-01', 400.00);

INSERT INTO DeviceLicense (product_id, license_element_quantity, license_start_time, license_finish_time, price) 
VALUES 
  (1, 2, '2024-01-30', '2025-01-30', 200.00),
  (2, 1, '2024-02-15', '2025-02-15', 100.00),
  (3, 3, '2024-03-01', '2025-03-01', 300.00),
  (4, 2, '2024-04-15', '2025-04-15', 200.00),
  (5, 4, '2024-05-01', '2025-05-01', 400.00);

INSERT INTO CompanyLicense (product_id, device_id, license_start_time, license_finish_time, price) 
VALUES 
  (1, 1, '2024-01-30', '2025-01-30', 1000.00),
  (2, 2, '2024-02-15', '2025-02-15', 800.00),
  (3, 1, '2024-03-01', '2025-03-01', 600.00),
  (4, 2, '2024-04-15', '2025-04-15', 400.00),
  (5, 1, '2024-05-01', '2025-05-01', 1200.00);

INSERT INTO UserLicenseElement (employee_id, user_license_id) 
VALUES 
  (1, 1),
  (2, 1),
  (2, 2),
  (3, 3),
  (4, 4);

INSERT INTO DeviceLicenseElement (device_id, device_license_id) 
VALUES 
  (1, 1),
  (2, 1),
  (2, 2),
  (3, 3),
  (4, 4);

END;
