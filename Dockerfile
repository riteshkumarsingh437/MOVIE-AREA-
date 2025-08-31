FROM python:3.10-slim

WORKDIR /app

# Install system dependencies required by Pyrogram + TgCrypto
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    libssl-dev \
    libffi-dev \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your bot code
COPY . .

# Run the bot (change bot.py if your file is named differently)
CMD ["python", "bot.py"]
