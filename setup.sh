#!/bin/bash
AIRFLOW_VERSION=1.10.12
AIRFLOW_PORT=8080
AIRFLOW_HOME=${AIRFLOW_HOME}

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
    && sed -i'.orig' "s|dags_folder = ${AIRFLOW_HOME}/dags|dags_folder = ${PWD}/dags|g" ${AIRFLOW_HOME}/airflow.cfg 

# reset db
airflow resetdb --yes
airflow initdb

# create airflow account
python3 ./create_account.py

