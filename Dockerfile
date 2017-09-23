FROM python:3.6

ENV PYTHONUNBUFFERED 1

RUN mkdir /code

WORKDIR /code

ADD requirements.txt /code/

RUN pip install -r requirements.txt

RUN apt-get update && apt-get install -y python-mysqldb && apt-get clean && rm -rf /var/lib/apt/lists/*

ADD . /code/

RUN django-admin.py startproject composeexample .

ADD settings.py /code/composeexample/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
