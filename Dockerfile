# Start from a base image (Python example)
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy your project files into the container
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# If you really need apt packages, uncomment:
# RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Expose port (for web services)
EXPOSE 8000

# Command to run your app
CMD ["python", "main.py"]
