FROM python:3.12-slim

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends tzdata \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install --no-cache-dir Flask

RUN groupadd -g 799 cooper32 && \
    useradd -r -u 999 -g cooper32 cooper32

COPY --chown=cooper32:cooper32 . .

USER cooper32

EXPOSE 8080

CMD ["python", "./run.py"]
