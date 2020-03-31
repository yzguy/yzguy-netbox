
build:
	docker build -t netbox-nginx .

deploy:
	docker run -d -p 8080:8080 --volumes-from=netbox --network=netbox netbox-nginx
