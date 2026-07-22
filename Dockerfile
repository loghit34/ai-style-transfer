FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt-get/lists/*

WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy all project files
COPY . .

# Expose Hugging Face Space port 7860
EXPOSE 7860

# Command to run Gunicorn on port 7860
CMD ["gunicorn", "--bind", "0.0.0.0:7860", "--chdir", "NST_Code", "app:app", "--timeout", "300", "--workers", "2"]
