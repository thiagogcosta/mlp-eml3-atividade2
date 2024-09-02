## UFSCAR - Machine Learning in Production - EML2 - Atividade 2

Este repositório possui o intuito de conter os códigos da atividade 3, no qual possui o objetivo de por em prática o processo de registro de parâmetros, hiperparâmetros e métricas usando o MLflow, possibilitando a visualização do desempenho e a análise do melhor modelo para colocar em produção. Desse modo, a seguir é possível observar alguas referências utilizadas para a execução desta atividade:

Tutorial de como utilizar o Jupyter Lab com Spark:
- https://github.com/whole-tale/all-spark-notebook
- https://github.com/jupyter/docker-stacks

Tutorial de como construir um modelo de predição de tráfego de táxis em Nova York com Spark MLib:
- https://learn.microsoft.com/en-us/azure/synapse-analytics/spark/apache-spark-machine-learning-mllib-notebook

Tutorial de Spark Pipelines:
- https://spark.apache.org/docs/latest/ml-pipeline.html

Tutorial de como utilizar MLflow com Spark:
- https://mlflow.org/docs/latest/python_api/mlflow.spark.html

### Estrutura do projeto

```
/mlp-eml3-atividade2/
    /jupyterlab_spark/
        Dockerfile
        jupyter_notebook_config.py
        model_management.ipynb
        nyc_traffic_taxi_model.ipynb
    /mlflow_server/
        Dockerfile
        wait-for-it.sh
    docker-compose.yml
    Makefile
    .gitignore

```

### Passo-a-passo para interagir com o projeto

* Faça um clone deste repositório
* Execute o seguinte o comando: **make start**, assim serão buildadados e startados os containers:
    -  **jupyterlab_spark**: Instância do JupyterLab com o Spark configurado.
    -  **s3**: Instância do MinIO para armazenar os artefatos dos experimentos e modelos versionados via Mlflow.
    -  **create_s3_buckets**: Responsável por subir um client do MinIO com o intuito de realizar algumas configurações, como:
        - Criação de bucket;
        - Definição de apólice;
        - Criação de Acess Key. 
    -  **db**: Instância do PostgreSQL para armazenar os metadados dos experimentos e modelos versionados via Mlflow. 
    -  **mlflow_server**: Instância de um webserver do MLFLOW para versionarmos os experimentos e registrarmos os modelos.
* Logo após os containers serem startados, por favor, vá até o seguinte endereço eletrônico: **http://localhost:8888/** e acesse o diretório chamado: **"work"**.
* Execute end to end o notebook: **nyc_traffic_taxi_model.ipnyb**. Inclusive, este notebook realiza as seguintes operações:
    - Obtém os dados referentes ao tráfego de táxis da cidade de Nova York;
    - Prepara os dados utilizando Pyspark;
    - Cria um pipeline Spark;
    - Treina e testa um modelo de Regressão Logística;
    - Versiona no Mlflow WebServer os experimentos.
* Execute end to end o notebook: **model_management.ipnyb**. Sendo que, este notebook realiza as seguintes operações:
    - Obtém o experimento contendo o modelo com a melhor perfomance;
    - Registra este modelo no model server do Mlflow;
    - Transiciona o modelo registrado por N stages (ou seja, None, Stagging e Production);
    - Obtêm a última versão do modelo em produção e executa em uma base de dados separada anteriormente (ou seja, no notebook chamado **nyc_traffic_taxi_model.ipnyb**).
    - Deleta o modelo do Mlflow WebServer.
