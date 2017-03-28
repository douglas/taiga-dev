all:
	@echo "To setup a new development environment quickly, run: make quickstart"
	@echo "For an optimal setup, see the README."

clone:
	git clone https://github.com/taigaio/taiga-back.git
	git clone https://github.com/taigaio/taiga-front-dist.git taiga-front

quickstart: clone setup
	docker logs -f taiga-backend

run:
	docker-compose up -d

build:
	cp services/backend/image/Dockerfile taiga-back
	docker-compose build

frontend_app:
	cd taiga-front && yarn && gulp deploy

setup: build run
	docker logs -f taiga-backend

stop:
	docker-compose stop

clean:
	docker-compose stop
	docker-compose rm -v

remove_volumes:
	docker volume rm taiga_postgres_data
	docker volume rm taiga_taiga_backend_media

clean_all: clean remove_volumes

wipe: clean_all
	rm -rf taiga-front
	rm -rf taiga-back
