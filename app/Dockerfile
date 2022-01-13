# FROM python:3.10.1-alpine3.14
FROM alpine:3.14

RUN addgroup --gid 10001 app \
  && adduser \
    --uid 10001 \
    --home /home/app \
    --shell /bin/ash \
    --ingroup app \
    --disabled-password \
    app

WORKDIR /home/app

COPY ./poetry.lock ./
COPY ./pyproject.toml ./

RUN apk add --no-cache \
    python3~=3.9.5 \
    py3-pip~=20.3.4 \
    py3-psycopg2~=2.8.6 \
    py3-cryptography~=3.3 \
  # !NOTE: to split or not to split for several layers, that is the question
  && pip install --no-cache-dir poetry==1.1.12 \
  && poetry config virtualenvs.create false \
  && poetry install

USER app

EXPOSE 8000

COPY ./ /home/app

ENTRYPOINT ["/usr/bin/python3"]
CMD ["manage.py", "runserver", "0.0.0.0:8000"]
