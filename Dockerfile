FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --no-cache-dir -r requirements.txt

COPY app.py /app/

EXPOSE 5000

RUN useradd -m appuser
USER appuser

CMD ["python", "app.py"]