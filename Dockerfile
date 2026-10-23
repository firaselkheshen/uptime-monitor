# stage 1
FROM python:3.14-slim AS builder

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

#stage 2
FROM python:3.14-slim

COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

RUN useradd --create-home --uid 10001 appuser

WORKDIR /app
COPY app/ app/

USER appuser

EXPOSE 8000

CMD ["uvicorn" , "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

