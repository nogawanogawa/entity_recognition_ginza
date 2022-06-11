FROM python:3.9

RUN apt update -y
WORKDIR /home

COPY pyproject.toml poetry.lock /home/

RUN curl -sSL https://install.python-poetry.org | python -
ENV PATH /root/.local/bin:$PATH
RUN poetry config virtualenvs.create false

RUN poetry install 

WORKDIR /home

