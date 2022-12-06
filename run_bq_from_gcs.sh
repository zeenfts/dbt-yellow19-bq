
    # Create a dataset in BQ
    bq --location=US mk -d \
    --default_table_expiration 3600 \
    --description "This is my dataset." \
    nytaxi;

    # Enable the BQ transfer service
    gcloud services enable bigquerydatatransfer.googleapis.com;

    # Create the table
    bq mk -t nytaxi.yellow_taxi19_all VendorID:integer,tpep_pickup_datetime:datetime,tpep_dropoff_datetime:datetime,passenger_count:integer,\
    trip_distance:float64,RatecodeID:integer,store_and_fwd_flag:string,PULocationID:integer,DOLocationID:integer,payment_type:integer,\
    fare_amount	extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,\
    total_amount:float64,congestion_surcharge:float64;

    # for i in 1 2 3 4 5 6 7 8 9 10 11 12 # Error
    #     if [ i < 10 ]
    #     then
    #         i='0'+str(i)
    #     fi
    # do
    #     echo "print angka $i"
    #     # bq mk -t nytaxi.yellow_tripdata_2019-i VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64
    # done

    bq mk -t nytaxi.yellow_tripdata_2019-01 VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64;
    bq mk -t nytaxi.yellow_tripdata_2019-02 VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64;
    bq mk -t nytaxi.yellow_tripdata_2019-03 VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64;
    bq mk -t nytaxi.yellow_tripdata_2019-04 VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64;
    bq mk -t nytaxi.yellow_tripdata_2019-05 VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64;
    bq mk -t nytaxi.yellow_tripdata_2019-06 VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64;
    bq mk -t nytaxi.yellow_tripdata_2019-07 VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64;
    bq mk -t nytaxi.yellow_tripdata_2019-08 VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64;
    bq mk -t nytaxi.yellow_tripdata_2019-09 VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64;
    bq mk -t nytaxi.yellow_tripdata_2019-10 VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64;
    bq mk -t nytaxi.yellow_tripdata_2019-11 VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64;
    bq mk -t nytaxi.yellow_tripdata_2019-12 VendorID:string,tpep_pickup_datetime:timestamp,tpep_dropoff_datetime:timestamp,passenger_count:integer,trip_distance:float64,RatecodeID:string,store_and_fwd_flag:string,PULocationID:string,DOLocationID:string,payment_type:string,fare_amount:float64,extra:float64,mta_tax:float64,tip_amount:float64,tolls_amount:float64,improvement_surcharge:float64,total_amount:float64,congestion_surcharge:float64;
    
    # # Transfer the data from GCS to BQ (param error)
    # bq mk --transfer_config --project_id=<PROJECT_ID> --target_dataset=nytaxi --display_name='My Transfer' --params='{"data_path_template":"gs://<BUCKET_NAME>/*.csv","destination_table_name_template":"yellow_taxi19","file_format":"CSV","max_bad_records":"1","skip_leading_rows":"1","allow_quoted_newlines":"true","allow_jagged_rows":"false"}' --data_source=google_cloud_storage
