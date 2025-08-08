# Makefile — quick dev & demo targets for the multi-cloud demo Flask app
# Usage: make <target>
# Example: make run
.PHONY: help venv install run build docker-build docker-run docker-build-push clean

help:
	@echo "Targets:"
	@echo "  make venv                # create virtualenv at .venv"
	@echo "  make install             # install python requirements into .venv"
	@echo "  make run                 # run the Flask app locally (uses .venv)"
	@echo "  make build               # build a local Docker image (tag: sashi/cloud-portfolio-app:local)"
	@echo "  make docker-run          # run the built Docker image, map port 8080"
	@echo "  make docker-build-push PROJECT_ID=<gcp-project>  # build & push to GCR"
	@echo "  make clean               # remove .venv and Python caches"

venv:
	python3 -m venv .venv
	@echo "Virtualenv created at .venv"

install: venv
	. .venv/bin/activate && pip install --upgrade pip && pip install -r multi-cloud-demo/app/requirements.txt

run: install
	@echo "Starting Flask app (http://localhost:8080)"
	. .venv/bin/activate && python multi-cloud-demo/app/main.py

build:
	@echo "Building Docker image: sashi/cloud-portfolio-app:local"
	docker build -t sashi/cloud-portfolio-app:local ./multi-cloud-demo/app

docker-run: build
	@echo "Running Docker container (map host:8080 -> container:8080)"
	docker run --rm -p 8080:8080 sashi/cloud-portfolio-app:local

docker-build-push:
	@if [ -z "$(PROJECT_ID)" ]; then echo "ERROR: set PROJECT_ID variable. Example: make docker-build-push PROJECT_ID=my-gcp-project"; exit 1; fi
	docker build -t gcr.io/$(PROJECT_ID)/cloud-portfolio-app:latest ./multi-cloud-demo/app
	docker push gcr.io/$(PROJECT_ID)/cloud-portfolio-app:latest

clean:
	rm -rf .venv
	find . -type d -name '__pycache__' -exec rm -rf {} +
	@echo "Cleaned .venv and __pycache__"
