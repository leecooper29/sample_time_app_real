FROM python:3.12-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install --no-cache-dir Flask

RUN groupadd -g 799 nyu && \
    useradd -r -u 999 -g nyu nyu

COPY --chown=nyu:nyu . .

USER cooperlee32

EXPOSE 8080

CMD ["python", "./run.py"]
