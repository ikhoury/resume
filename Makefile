build:
	docker build -t resume:latest .
.PHONY: build

run:
	docker run -p 8080:80 resume:latest
.PHONY: run