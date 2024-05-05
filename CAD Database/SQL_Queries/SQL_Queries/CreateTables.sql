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

END;
