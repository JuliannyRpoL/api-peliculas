FROM python:3.7

RUN mkdir /app

WORKDIR /app

COPY . /app 

RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
  
RUN pip install -r /app/requirements.txt

ENV FLASK_APP "entrypoint:app"
ENV FLASK_ENV "development"
ENV APP_SETTINGS_MODULE "config.default"

RUN flask db init
RUN flask db revision --rev-id 1c36c052e9e8
RUN flask db migrate
RUN flask db upgrade

EXPOSE 5000

CMD ["python", "entrypoint.py"]

