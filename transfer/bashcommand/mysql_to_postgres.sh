#!/bin/bash
embulk guess /usr/local/airflow/datasources/seed_1.yml -o /usr/local/airflow/datasources/load_1.yml
embulk run /usr/local/airflow/datasources/load_1.yml