
build:
	docker build -t netbox .

deploy:
	docker run -d -p 8001:8001 --network=netbox --net-alias=netbox netbox
