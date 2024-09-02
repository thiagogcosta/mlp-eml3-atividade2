start:
	@echo "Starting Docker services..."
	@docker-compose up -d --build

# Target to stop Docker services
end:
	@echo "Stopping Docker services..."
	@docker-compose down

# Target to remove all Docker containers
clear:
	@echo "Removing all Docker containers..."
	@docker rm -f $$(docker ps -a -q) || true