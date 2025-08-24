FROM python:3.12-slim
LABEL maintainer="Sarthak Docker" version="1.0"

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY ./app ./app

EXPOSE 8000


CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
# Install curl (needed for healthcheck)
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Healthcheck for FastAPI
HEALTHCHECK --interval=30s --timeout=5s CMD curl -f http://localhost:8000/ || exit 1

