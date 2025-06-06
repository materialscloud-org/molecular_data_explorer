FROM python:3.6.12-slim

# Get build essentials and gcc
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Set working directory inside container
WORKDIR /app

# Copy requirements first (to leverage caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy the rest of your app code
COPY . .

# Expose port 80
EXPOSE 80

# Run gunicorn with the command from your Procfile
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:create_server()"]
