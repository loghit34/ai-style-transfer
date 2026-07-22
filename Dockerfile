FROM python:3.10-slim

# Install system dependencies (Debian 12 compatible)
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt-get/lists/*

WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Expose port for Railway / cloud hosting
EXPOSE 5000

# Command to run Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--chdir", "NST_Code", "app:app", "--timeout", "300", "--workers", "2"]
