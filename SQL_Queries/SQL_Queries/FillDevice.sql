USE CAADSoftware;

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

SELECT * FROM Device;
