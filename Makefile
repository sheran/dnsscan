.PHONY: clean
clean:
	docker rmi dnsscan

.PHONY: build
build:
	docker build -t dnsscan .

.PHONY: rebuild
rebuild:
	docker build --no-cache -t dnsscan .
