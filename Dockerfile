FROM python:3.10-slim

RUN useradd -m appuser

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY --chown=appuser:appuser app.py /app/

EXPOSE 5000

USER appuser

ENTRYPOINT ["python", "app.py"]