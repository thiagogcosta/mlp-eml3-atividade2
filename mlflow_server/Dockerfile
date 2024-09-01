FROM continuumio/miniconda3:latest

# Update conda and pip
RUN conda update -n base -c defaults conda && \
    conda install pip

# Install system dependencies (for psycopg2)
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libpq-dev && \
    apt-get clean

# Install Python packages
RUN pip install --upgrade pip && \
    pip install mlflow boto3 pymysql psycopg2-binary

ADD . /app
WORKDIR /app

COPY wait-for-it.sh wait-for-it.sh 
RUN chmod +x wait-for-it.sh

#----------INSTRUCTIONS----------

# buildar a imagem
#docker build -t mlflow_server .

# executar o container com os containers visualizando a rede da maquina
#--run in background--
#docker run -d --name mlflow_server --network host mlflow_server
#--run--
#docker run --name mlflow_server --network host mlflow_server 

# acessar o container
#docker exec -i -t mlflow_server bash

# finalizar a execucao do container
#docker kill mlflow_server

# excluir os containers finalizados
#docker rm $(docker ps -a -q)