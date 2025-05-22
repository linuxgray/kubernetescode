# Use Python 3.12 base image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Copy application code
COPY . .

# Install correct packages
RUN pip install Flask==2.0.3 Werkzeug==2.0.3

# Expose port
EXPOSE 5000

# Run app
CMD ["python", "app.py"]
