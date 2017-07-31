# Clean Connect Content
clean:
	rm -rf $(CURDIR)/data; \
	mkdir $(CURDIR)/data

# Build the Docker Image using binary specified as arg
build:
	docker build -t connect-demo \
	   --build-arg CONNECT_BINARY_URL=$(CONNECT_BINARY_URL) . 

# Starts connect in a container named "connect".
start:
	docker run --privileged=true -it --rm \
		-v $(CURDIR):/connect \
		-p :3939:3939 \
		-e CONNECT_LICENSE=$(CONNECT_LICENSE) \
		--name connect \
		connect-demo dumb-init ./scripts/start-licensed.sh /opt/rstudio-connect/bin/connect --config ./config/development.gcfg
