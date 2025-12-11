FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Collect static assets for WhiteNoise (no-op if none change)
RUN python manage.py collectstatic --noinput

CMD ["sh", "-c", "gunicorn blogsite.wsgi:application --bind 0.0.0.0:${PORT:-8080}"]
