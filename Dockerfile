FROM python:3.9
ENV PYTHON_INTERPRETER_VERSION python3.9

COPY . /app

RUN apt update \
    && apt install -y --no-install-recommends \
    && ${PYTHON_INTERPRETER_VERSION} -m pip install --upgrade pip setuptools \
    && apt -y autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python - \
    && ~/.poetry/bin/poetry config virtualenvs.create false \
    && cd /app \
    && ~/.poetry/bin/poetry install --no-dev

WORKDIR /app
CMD ["/root/.poetry/bin/poetry","run","python","burgerbot.py"]