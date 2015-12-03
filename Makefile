LAN_HOST=$(shell ifconfig  | grep -E 'inet.[0-9]' | grep -v '127.0.0.1' | awk 'NR==1{ print $$2}')

hosts:
	@rm hosts 2&>/dev/null || true
	@echo "127.0.0.1	localhost" >> hosts
	@echo "255.255.255.255	broadcasthost" >> hosts
	@echo "::1	localhost" >> hosts
	@echo "fe80::1%%lo0	localhost" >> hosts
	@echo "127.0.0.1	l" >> hosts
	@echo "::1	l" >> hosts
	@echo "$(LAN_HOST)	lanhost" >> hosts
ifneq ($(DOCKER_HOST),)
	@echo "$(DOCKER_HOST)	docker" >> hosts
endif

.PHONY: hosts
