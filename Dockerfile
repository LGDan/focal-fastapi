FROM ubuntu:20.04

RUN apt update && \
    apt install -y curl python3-pip && \
    curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain nightly -y -q && \
    pip install fastapi[all] && \
    mkdir -p /opt/fastapi

WORKDIR /opt/fastapi

COPY main.py /opt/fastapi/main.py

EXPOSE 80

ENTRYPOINT uvicorn main:app --host 0.0.0.0 --port 80
