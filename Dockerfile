FROM python:3.7

WORKDIR /app

COPY requirements.txt .
COPY mol_view.py .

RUN pip install -r requirements.txt
COPY serve.sh .

CMD ["/app/serve.sh"]
