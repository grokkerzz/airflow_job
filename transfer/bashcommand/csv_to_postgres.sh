#!/bin/bash
embulk guess /usr/local/airflow/datasources/seed_2.yml -o /usr/local/airflow/datasources/load_2.yml
embulk run /usr/local/airflow/datasources/load_2.yml