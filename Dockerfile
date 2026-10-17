FROM python:3.12-slim

WORKDIR /app

COPY app/ /app/

RUN python -m py_compile /app/app.py

EXPOSE 8080

CMD ["python", "app.py"]
