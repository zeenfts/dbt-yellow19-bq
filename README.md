# dbt-yellow19-bq
NYC TLC 2019 Yellow Taxi Trip Data Transformation Process using dbt

Prerequisites: [dbt](https://docs.getdbt.com/docs/get-started/getting-started-dbt-core), [Google Cloud SDK](https://cloud.google.com/sdk/docs/install), and [Docker](https://docs.docker.com/engine/install/) (optional).

Info:
1. [The trip data](https://www.kaggle.com/datasets/microize/newyork-yellow-taxi-trip-data-2020-2019?resource=download) ready on Bigquery, if not please check [`ingest_csv_to_bq.md`](https://github.com/zeenfts/dbt-yellow19-bq/blob/main/.dbt/ingest_csv_to_bq.md) and kindly follow the instructions! or you can use any other way to upload the files to there.
2. Put your GCP Service Account Credentials inside [`.dbt`](https://github.com/zeenfts/dbt-yellow19-bq/tree/main/.dbt) folder and rename it as _**creds.json**_.
3. Change value inside `< >` to the correct one --> [profiles.yml](https://github.com/zeenfts/dbt-yellow19-bq/blob/main/.dbt/profiles.yml), [run_dbt.sh](https://github.com/zeenfts/dbt-yellow19-bq/blob/main/scripts/run_dbt.sh).
4. Execute [`run_dbt.sh`](https://github.com/zeenfts/dbt-yellow19-bq/blob/main/scripts/run_dbt.sh) script.
5. Check the [result](https://github.com/zeenfts/dbt-yellow19-bq/tree/main/.img).

<sup>note: for docs can only running outside docker!</sup>