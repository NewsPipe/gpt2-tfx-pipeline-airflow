# gpt2-tfx-pipeline-airflow
This code contains setting up airflow for our gpt2-tfx-pipeline container

## Getting Started
Add to ~/.bashrc
```
nano ~/.bashrc # and paste on top line below
export AIRFLOW_HOME=/home/s0558366/gpt2-tfx-pipeline-airflow/airflow
```
Verify settings
```
echo $AIRFLOW_HOME
env | grep AIRFLOW_HOME
```
Start setup script
```
chmod u+x setup.sh
./setup.sh

You may want to adjust the dag folder sed
