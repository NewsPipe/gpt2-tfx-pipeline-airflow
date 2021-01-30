# gpt2-tfx-pipeline-airflow
This code contains setting up Airflow for [gpt2-tfx-pipeline](https://github.com/NewsPipe/gpt2-tfx-pipeline)

## Getting Started
Clone the TFX pipeline repo:
```
git clone https://github.com/NewsPipe/gpt2-tfx-pipeline.git
cd gpt2-tfx-pipeline
pip install .
```

Add to `~/.bashrc` the `AIRFLOW_HOME` variable with the part to your airflow folder. In my case it was `/home/s0558366/gpt2-tfx-pipeline-airflow/airflow`
```
nano ~/.bashrc # and paste on top line below
export AIRFLOW_HOME=/home/s0558366/gpt2-tfx-pipeline-airflow/airflow # save and run following command
source ~/.bashrc
```
Verify settings
```
echo $AIRFLOW_HOME
env | grep AIRFLOW_HOME
```

Clone this repo and start the setup script:
```
git clone https://github.com/NewsPipe/gpt2-tfx-pipeline-airflow-setup.git
cd gpt2-tfx-pipeline-airflow-setup
chmod u+x setup.sh
./setup.sh
```
