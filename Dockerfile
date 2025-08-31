# Base Python image
FROM python:3.10-slim

# Set working directory inside container
WORKDIR /app

# Install system dependencies (needed for some pip packages like tgcrypto, cryptography, pyrogram, etc.)
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your bot code
COPY . .

# Start the bot (replace bot.py with your actual filename)
CMD ["python", "bot.py"]
