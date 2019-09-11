from __future__ import print_function

from datetime import datetime
from datetime import timedelta

import airflow
from airflow.models import DAG
from airflow.operators.bash_operator import BashOperator

args = {
    'owner': 'airflow',
    'run_as_user': 'root',
    'start_date': airflow.utils.dates.days_ago(2),
}

dag = DAG(
    dag_id='transfer_mysql_and_csv_to_postgres',
    default_args=args,
    schedule_interval='0 0 * * *',
    dagrun_timeout=timedelta(minutes=60),
)

mysql_to_postgres = BashOperator(
    task_id='transfer_data_from_mysql_to_postgres',
    bash_command="/usr/local/airflow/bashcommand/mysql_to_postgres.sh ",
    dag=dag
)

csv_to_postgres = BashOperator(
    task_id='transfer_data_from_csv_to_postgres',
    bash_command="/usr/local/airflow/bashcommand/csv_to_postgres.sh ",
    dag=dag
)

mysql_to_postgres >> csv_to_postgres
