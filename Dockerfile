FROM python:3.8-slim

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

ENV DB_USER=root
ENV DB_PASSWORD=root
ENV DB_HOST=mysql
ENV DB_NAME=evms

CMD ["python", "app.py"]
