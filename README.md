# gpt2-tfx-pipeline-airflow
This code contains setting up Airflow for [gpt2-tfx-pipeline](http://github/com/NewsPipe/gpt2-tfx-pipeline)

## Getting Started
Add to ~/.bashrc the AIRFLOW_HOME variable with the part to your airflow folder. In my case it was `/home/s0558366/gpt2-tfx-pipeline-airflow/airflow`
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
```

# TODO E-Mail
https://airflow.apache.org/docs/stable/tutorial.html
https://stackoverflow.com/questions/53533720/success-mail-in-airflow
https://airflow.apache.org/docs/1.10.3/_modules/airflow/utils/email.html
https://stackoverflow.com/questions/51829200/how-to-set-up-airflow-send-email/51837049#51837049
