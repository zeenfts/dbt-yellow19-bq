1. Open cloud shell on GCP (50 hours usage limit/week).
2. `mkdir ~/mybucket` on the shell.
3. `gcsfuse <YOUR_BUCKET_NAME> ~/mybucket` on the shell.
4. `pip install kaggle --upgrade` on the shell.
5. Download API Key from your kaggle account.
6. `cd .kaggle` on the shell.
7. `echo '<SOMETHING_INSIDE_THAT_KAGGLE_JSON_KEY>' > kaggle.json` on the shell (will look like this {"username":"...", "key":"..."}).
8. `sudo chmod 600 kaggle.json` on the shell.
9. `~/.local/bin/kaggle datasets files microize/newyork-yellow-taxi-trip-data-2020-2019` on the shell, success if it shows some csv files.
10. `~/.local/bin/kaggle datasets download microize/newyork-yellow-taxi-trip-data-2020-2019` on the shell to download data directly to the Google Cloud Storage.
11. `cd ~/mybucket` on the shell.
12. `unzip newyork-yellow-taxi-trip-data-2020-2019.zip` on the shell.
13. Execute `run_bq_from_gcs.sh` script.
14. Transfer data using [Bigquery Transfer API](https://console.cloud.google.com/bigquery/transfers/configs/create).