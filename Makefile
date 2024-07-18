.PHONY: clean build rebuild
clean:
	docker rmi dnsscan

build:
	docker build -t dnsscan .

rebuild:
	docker build --no-cache -t dnsscan .
