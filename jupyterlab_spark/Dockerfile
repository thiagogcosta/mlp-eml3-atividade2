FROM jupyter/all-spark-notebook:latest

RUN pip install mlflow boto3 azureml azureml-opendatasets

COPY jupyter_notebook_config.py /home/jovyan/.jupyter/jupyter_notebook_config.py

COPY nyc_traffic_taxi_model.ipynb /home/jovyan/work/nyc_traffic_taxi_model.ipynb

COPY model_management.ipynb /home/jovyan/work/model_management.ipynb

CMD ["start-notebook.sh", "--NotebookApp.token=''"]