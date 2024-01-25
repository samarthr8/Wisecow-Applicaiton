# Use a lightweight base image
FROM debian:bullseye-slim

# Set working directory
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Set the PATH environment variable to include the binary directories
ENV PATH="/usr/games:${PATH}"

# Copy the script into the container
COPY wisecow.sh /app/wisecow.sh

# Make the script executable
RUN chmod +x /app/wisecow.sh

# Expose the port on which the server runs
EXPOSE 4499

# Run the script when the container starts
CMD ["/bin/bash", "/app/wisecow.sh"]

