FROM registry.k.avito.ru/avito/service-pytorch:23.10.0-py3.10

RUN pip3 install poetry

WORKDIR /app

COPY pyproject.toml ./
RUN poetry config virtualenvs.create false \
    && poetry install --no-root

COPY jupyter_notebook_config.py /root/.jupyter/

COPY . .

CMD ["bash"]
