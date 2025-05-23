FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt
# Or directly:
# RUN pip install Flask==2.0.3 Werkzeug==2.0.3

COPY . .

CMD ["python", "app.py"]
