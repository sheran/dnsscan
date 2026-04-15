IMAGE = sherangee/dnsscan
PLATFORMS = linux/arm64,linux/amd64

.PHONY: clean
clean:
	docker rmi $(IMAGE) || true

.PHONY: build
build:
	docker buildx build --platform $(PLATFORMS) -t $(IMAGE) .

.PHONY: rebuild
rebuild:
	docker buildx build --no-cache --platform $(PLATFORMS) -t $(IMAGE) .

.PHONY: push
push:
	docker buildx build --platform $(PLATFORMS) -t $(IMAGE) --push .
