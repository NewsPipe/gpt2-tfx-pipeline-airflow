#!/bin/bash
AIRFLOW_VERSION=1.10.12
AIRFLOW_PORT=8080
AIRFLOW_HOME=/home/s0558366/gpt2-tfx-pipeline-airflow/airflow

# install python libs
pip install flask-bcrypt
pip install apache-airflow==${AIRFLOW_VERSION}

# init db
airflow initdb

# change airflow settings
sed -i'.orig' 's/dag_dir_list_interval = 300/dag_dir_list_interval = 1/g' ${AIRFLOW_HOME}/airflow.cfg \
    && sed -i'.orig' 's/job_heartbeat_sec = 5/job_heartbeat_sec = 1/g' ${AIRFLOW_HOME}/airflow.cfg \
    && sed -i'.orig' 's/scheduler_heartbeat_sec = 5/scheduler_heartbeat_sec = 1/g' ${AIRFLOW_HOME}/airflow.cfg \
    && sed -i'.orig' 's/dag_default_view = tree/dag_default_view = graph/g' ${AIRFLOW_HOME}/airflow.cfg \
    && sed -i'.orig' 's/load_examples = True/load_examples = False/g' ${AIRFLOW_HOME}/airflow.cfg \
    && sed -i'.orig' 's/max_active_runs_per_dag = 16/max_active_runs_per_dag = 1/g' ${AIRFLOW_HOME}/airflow.cfg \
    && sed -i'.orig' 's/dagbag_import_timeout = 30/dagbag_import_timeout = 600/g' ${AIRFLOW_HOME}/airflow.cfg \
    && sed -i'.orig' 's/max_threads = 2/max_threads = 1/g' ${AIRFLOW_HOME}/airflow.cfg \
    && sed -i'.orig' 's/authenticate = False/authenticate = True\nauth_backend = airflow.contrib.auth.backends.password_auth/g' ${AIRFLOW_HOME}/airflow.cfg \
    && sed -i'.orig' 's|dags_folder = /home/s0558366/gpt2-tfx-pipeline-airflow/airflow/dags|dags_folder = /home/s0558366/gpt2-tfx-pipeline-configurations|g' ${AIRFLOW_HOME}/airflow.cfg 

# reset db
airflow resetdb --yes
airflow initdb

# create airflow account
python3 ./create_account.py

# start server and scheduler
rm -rf ${AIRFLOW_HOME}/airflow-webserver*
rm -rf ${AIRFLOW_HOME}/airflow-scheduler*
airflow webserver -D -w 2 --host 0.0.0.0 --port ${AIRFLOW_PORT}
airflow scheduler
