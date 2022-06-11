FROM python:3.9

RUN apt update -y
WORKDIR /home

#RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python && \
#RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
#RUN (curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python) \
#    cd /usr/local/bin && \
#    ln -s /opt/poetry/bin/poetry && \
#RUN poetry config virtualenvs.create false
#RUN /opt/poetry/bin/poetry config virtualenvs.in-project true && \
#    /opt/poetry/bin/poetry install --no-dev --no-interaction

COPY pyproject.toml poetry.lock /home/

RUN curl -sSL https://install.python-poetry.org | python -
ENV PATH /root/.local/bin:$PATH
RUN poetry config virtualenvs.create false

RUN poetry install 

RUN apt -y install mecab libmecab-dev mecab-ipadic-utf8
RUN cp /etc/mecabrc /usr/local/etc/

#RUN wget http://lotus.kuee.kyoto-u.ac.jp/nl-resource/jumanpp/jumanpp-1.02.tar.xz
#RUN tar Jxf jumanpp-1.02.tar.xz
#RUN apt -y install libboost-dev
#RUN cd jumanpp-1.02 && ./configure && make && make install

WORKDIR /home

